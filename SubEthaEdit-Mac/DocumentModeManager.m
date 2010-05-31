//
//  DocumentModeManager.m
//  SubEthaEdit
//
//  Created by Dominik Wagner on Mon Mar 22 2004.
//  Copyright (c) 2004 TheCodingMonkeys. All rights reserved.
//

#import "ModeSettings.h"
#import "DocumentModeManager.h"
#import "GeneralPreferences.h"
#import "SyntaxStyle.h"
#import "SyntaxDefinition.h"
#import <OgreKit/OgreKit.h>

#if defined(CODA)
#define MODEPATHCOMPONENT @"Application Support/Coda/Modes/"
#else
#define MODEPATHCOMPONENT @"Application Support/SubEthaEdit/Modes/"
#endif //defined(CODA)

@interface DocumentModeManager (DocumentModeManagerPrivateAdditions)
- (void)TCM_findModes;
- (NSMutableArray *)reloadPrecedences;
- (void)setupMenu:(NSMenu *)aMenu action:(SEL)aSelector alternateDisplay:(BOOL)aFlag;
- (void)setupPopUp:(DocumentModePopUpButton *)aPopUp selectedModeIdentifier:(NSString *)aModeIdentifier automaticMode:(BOOL)hasAutomaticMode;
- (NSMutableArray *)modePrecedenceArray;
- (void)setModePrecedenceArray:(NSMutableArray *)anArray;
@end

@implementation DocumentModePopUpButton

/* Replace the cell, sign up for notifications.
*/
- (id)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        I_automaticMode = NO;
    }
    return self;
}

- (void)awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(documentModeListChanged:) name:@"DocumentModeListChanged" object:nil];
    [[DocumentModeManager sharedInstance] setupPopUp:self selectedModeIdentifier:BASEMODEIDENTIFIER automaticMode:I_automaticMode];
}

- (void)setHasAutomaticMode:(BOOL)aFlag {
    I_automaticMode = aFlag;
    [self documentModeListChanged:[NSNotification notificationWithName:@"DocumentModeListChanged" object:self]];
}

- (NSString *)selectedModeIdentifier {
    DocumentModeManager *manager=[DocumentModeManager sharedInstance];
    return [manager documentModeIdentifierForTag:[[self selectedItem] tag]];
}

- (void)setSelectedModeIdentifier:(NSString *)aModeIdentifier {
    int tag=[[DocumentModeManager sharedInstance] tagForDocumentModeIdentifier:aModeIdentifier];
    [self selectItemAtIndex:[[self menu] indexOfItemWithTag:tag]];
}

- (DocumentMode *)selectedMode {
    DocumentModeManager *manager=[DocumentModeManager sharedInstance];
    return [manager documentModeForIdentifier:[manager documentModeIdentifierForTag:[[self selectedItem] tag]]];
}

- (void)setSelectedMode:(DocumentMode *)aMode {
    int tag=[[DocumentModeManager sharedInstance] tagForDocumentModeIdentifier:[[aMode bundle] bundleIdentifier]];
    [self selectItemAtIndex:[[self menu] indexOfItemWithTag:tag]];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

/* Update contents based on encodings list customization
*/
- (void)documentModeListChanged:(NSNotification *)notification {
    NSString *selectedModeIdentifier=[self selectedModeIdentifier];
    if (![[DocumentModeManager sharedInstance] documentModeAvailableModeIdentifier:selectedModeIdentifier]) {
        selectedModeIdentifier=BASEMODEIDENTIFIER;
    }
    [[DocumentModeManager sharedInstance] setupPopUp:self selectedModeIdentifier:selectedModeIdentifier automaticMode:I_automaticMode];
    [self setSelectedModeIdentifier:selectedModeIdentifier];
}

@end


@implementation DocumentModeMenu
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

- (void)documentModeListChanged:(NSNotification *)notification {
    [[DocumentModeManager sharedInstance] setupMenu:self action:I_action alternateDisplay:I_alternateDisplay];
}

- (void)configureWithAction:(SEL)aSelector alternateDisplay:(BOOL)aFlag {
    I_action = aSelector;
    I_alternateDisplay = aFlag;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(documentModeListChanged:) name:@"DocumentModeListChanged" object:nil];
    [[DocumentModeManager sharedInstance] setupMenu:self action:I_action alternateDisplay:aFlag];
}

@end

static DocumentModeManager *S_sharedInstance=nil;

@implementation DocumentModeManager

+ (DocumentModeManager *)sharedInstance {
    if (!S_sharedInstance) {
        S_sharedInstance = [self new];
    }
    return S_sharedInstance;
}

+ (DocumentMode *)baseMode {
    return [[DocumentModeManager sharedInstance] baseMode];
}

+ (NSString *)xmlFileRepresentationOfAllStyles {
    DocumentModeManager *modeManager=[DocumentModeManager sharedInstance];
    NSMutableString *result=[NSMutableString string];
    NSDictionary *availableModes=[modeManager availableModes];
    NSEnumerator *identifiers=[[[availableModes allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)] objectEnumerator];
    NSString *identifier=nil;
    while ((identifier=[identifiers nextObject])) {
        DocumentMode *mode=[modeManager documentModeForIdentifier:identifier];
        [result appendString:[[mode syntaxStyle] xmlRepresentation]];
    }
    return [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<seestyle>\n%@</seestyle>\n",result];
}

- (id)init {
    if (S_sharedInstance) {
        [self dealloc];
        self = S_sharedInstance;
    } else {
        self = [super init];
        if (self) {
            I_modeBundles=[NSMutableDictionary new];
            I_documentModesByIdentifier =[NSMutableDictionary new];
#if defined(CODA)
			I_documentModesByIdentifierLock = [NSRecursiveLock new]; // ifc - experimental locking... awaiting real fix from TCM
            I_modeIdentifiersByExtension=[NSMutableDictionary new];
#endif //defined(CODA)
            I_modeIdentifiersTagArray   =[NSMutableArray new];
            [I_modeIdentifiersTagArray addObject:@"-"];
            [I_modeIdentifiersTagArray addObject:AUTOMATICMODEIDENTIFIER];
            [I_modeIdentifiersTagArray addObject:BASEMODEIDENTIFIER];
            [self TCM_findModes];
            [self setModePrecedenceArray:[self reloadPrecedences]];
            [self revalidatePrecedences];
            
            // Preference Handling
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillTerminate:) name:NSApplicationWillTerminateNotification object:nil];
        }
    }
    return self;
}

- (void)dealloc {
    [I_modeBundles release];
    [I_documentModesByIdentifier release];
#if defined(CODA)
	[I_documentModesByIdentifierLock release]; // ifc - experimental locking... awaiting real fix from TCM
    [I_modeIdentifiersByExtension release];
#endif //defined(CODA)
    [super dealloc];
}

- (void)revalidatePrecedences {
    // Check for overriden Rules

    NSMutableArray *rulesSoFar = [NSMutableArray array];
    
    NSEnumerator *modes = [[self modePrecedenceArray] objectEnumerator];
    id mode;
    while ((mode = [modes nextObject])) {
        
        NSEnumerator *rules = [[mode objectForKey:@"Rules"] objectEnumerator];
        id rule;
        while ((rule = [rules nextObject])) {
            BOOL isOverridden = NO;
            NSMutableDictionary *ruleCopy = [[rule mutableCopy] autorelease];
            [ruleCopy setObject:[mode objectForKey:@"Name"] forKey:@"FromMode"];

            int typeRule = [[rule objectForKey:@"TypeIdentifier"] intValue];
            NSString *stringRule = [rule objectForKey:@"String"];
            
            // Check if overridden
            NSEnumerator *overridingRules = [rulesSoFar objectEnumerator];
            id override;
            while ((override = [overridingRules nextObject])) {
                int typeOverride = [[override objectForKey:@"TypeIdentifier"] intValue];
                NSString *stringOverride = [override objectForKey:@"String"];
                
                BOOL simpleOverride = ((typeOverride==typeRule) && ([stringRule isEqualToString:stringOverride]));
                BOOL caseOverride = (((typeRule==3)&&(typeOverride==0)) && ([[stringRule uppercaseString] isEqualToString:[stringOverride uppercaseString]]));
                
                if (simpleOverride||caseOverride) {
                    [rule setObject:[NSNumber numberWithBool:YES] forKey:@"Overridden"];
                    [rule setObject:[NSString stringWithFormat:NSLocalizedString(@"Overriden by trigger in %@ mode",@"Mode Precedence Overriden Tooltip"), [override objectForKey:@"FromMode"]] forKey:@"OverriddenTooltip"];
                    isOverridden = YES;
                }   
                
            }
            
            if (!isOverridden) {
                [rule setObject:[NSNumber numberWithBool:NO] forKey:@"Overridden"];
                [rule setObject:@"" forKey:@"OverriddenTooltip"];
            }
            
            if ([[rule objectForKey:@"Enabled"] boolValue]) [rulesSoFar addObject:ruleCopy];
        }
        
    }
}

- (NSMutableArray *)reloadPrecedences {
    
    NSArray *oldPrecedenceArray = nil;
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    oldPrecedenceArray = [defaults objectForKey:@"ModePrecedences"];
    
    NSMutableArray *precendenceArray = [NSMutableArray array];
    
    
    NSMutableArray *modeOrder;
    if (oldPrecedenceArray) {
        //Recover order
        modeOrder = [NSMutableArray array];
        NSEnumerator *oldModes = [oldPrecedenceArray objectEnumerator];
        id oldMode;
        while ((oldMode = [oldModes nextObject])) {
            if ([oldMode respondsToSelector:@selector(objectForKey:)]) {
                if ([oldMode objectForKey:@"Identifier"]) {
                    [modeOrder addObject:[oldMode objectForKey:@"Identifier"]];
                }
            } 
        }
    } else {
        // Default internal order
        modeOrder = [NSMutableArray arrayWithObjects:@"SEEMode.PHP-HTML", @"SEEMode.ERB", @"SEEMode.Ruby", @"SEEMode.bash", @"SEEMode.Objective-C", @"SEEMode.C++", @"SEEMode.C", @"SEEMode.Diff", @"SEEMode.HTML", @"SEEMode.CSS", @"SEEMode.Javascript", @"SEEMode.SDEF",@"SEEMode.XML", @"SEEMode.Perl", @"SEEMode.Pascal", @"SEEMode.Lua", @"SEEMode.AppleScript", @"SEEMode.ActionScript", @"SEEMode.LaTeX", @"SEEMode.Java", @"SEEMode.Python", @"SEEMode.SQL", @"SEEMode.Conference", @"SEEMode.LassoScript-HTML", @"SEEMode.Coldfusion", nil]; 
    }
    
    NSInteger i;
    for(i=0;i<[modeOrder count];i++) {
        [precendenceArray addObject:[NSMutableDictionary dictionary]];
    }

    NSEnumerator *enumerator = [I_modeBundles objectEnumerator];
    NSBundle *bundle;
    while ((bundle = [enumerator nextObject]) != nil) {
        
        ModeSettings *modeSettings = [[ModeSettings alloc] initWithFile:[bundle pathForResource:@"ModeSettings" ofType:@"xml"]];
		if (!modeSettings) { // Fall back to info.plist
			modeSettings = [[ModeSettings alloc] initWithPlist:[bundle bundlePath]];
		}
		
        NSMutableDictionary *modeDictionary = [NSMutableDictionary dictionary];
        NSMutableArray *ruleArray = [NSMutableArray array];
        
        NSEnumerator *extensions, *filenames, *regexes, *casesensitiveExtensions;
        if (modeSettings) {
            extensions = [[modeSettings recognizedExtensions] objectEnumerator];
            casesensitiveExtensions = [[modeSettings recognizedCasesensitveExtensions] objectEnumerator];
            filenames = [[modeSettings recognizedFilenames] objectEnumerator];
            regexes = [[modeSettings recognizedRegexes] objectEnumerator];
            
            i = [modeOrder indexOfObject:[bundle bundleIdentifier]];
            if (i!=NSNotFound) {
                [precendenceArray replaceObjectAtIndex:i withObject:modeDictionary];
            } else [precendenceArray addObject:modeDictionary];
            
            [modeDictionary setObject:[bundle bundleIdentifier] forKey:@"Identifier"];
            [modeDictionary setObject:[bundle objectForInfoDictionaryKey:@"CFBundleName"] forKey:@"Name"];
            [modeDictionary setObject:[bundle objectForInfoDictionaryKey:@"CFBundleVersion"] forKey:@"Version"];
            NSString *bundlePath = [bundle bundlePath];
            NSString *location = NSLocalizedString(@"User Library", @"Location: User Library");
            if ([bundlePath hasPrefix:@"/Library"]) location = NSLocalizedString(@"System Library", @"Location: System Library");
            if ([bundlePath hasPrefix:@"/Network/Library"]) location = NSLocalizedString(@"Network Library", @"Location: Network Library");
            if ([bundlePath hasPrefix:[[NSBundle mainBundle] bundlePath]]) location = NSLocalizedString(@"Application", @"Location: Application");
            [modeDictionary setObject:location forKey:@"Location"];
            
            [modeDictionary setObject:ruleArray forKey:@"Rules"];
        } 
        
        NSString *extension = nil;
        NSString *casesensitiveExtension = nil;
        NSString *filename = nil;
        NSString *regex = nil;
                
        while ((extension = [extensions nextObject])) {
            [ruleArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  extension,@"String",
                                  [NSNumber numberWithBool:YES],@"Enabled",
                                  [NSNumber numberWithInt:0],@"TypeIdentifier",
                                  [NSNumber numberWithBool:NO],@"Overridden",
                                  @"",@"OverriddenTooltip",
                                  [NSNumber numberWithBool:YES],@"ModeRule",
                                  nil]];
        }
        
        while ((casesensitiveExtension = [casesensitiveExtensions nextObject])) {
            [ruleArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  casesensitiveExtension,@"String",
                                  [NSNumber numberWithBool:YES],@"Enabled",
                                  [NSNumber numberWithInt:3],@"TypeIdentifier",
                                  [NSNumber numberWithBool:NO],@"Overridden",
                                  @"",@"OverriddenTooltip",
                                  [NSNumber numberWithBool:YES],@"ModeRule",
                                  nil]];
        }
        
        while ((filename = [filenames nextObject])) {
            [ruleArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  filename,@"String",
                                  [NSNumber numberWithBool:YES],@"Enabled",
                                  [NSNumber numberWithInt:1],@"TypeIdentifier",
                                  [NSNumber numberWithBool:NO],@"Overridden",
                                  @"",@"OverriddenTooltip",
                                  [NSNumber numberWithBool:YES],@"ModeRule",
                                  nil]];
        }
        
        while ((regex = [regexes nextObject])) {
            if ([OGRegularExpression isValidExpressionString:regex]) {
                [ruleArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                      regex,@"String",
                                      [NSNumber numberWithBool:YES],@"Enabled",
                                      [NSNumber numberWithInt:2],@"TypeIdentifier",
                                      [NSNumber numberWithBool:NO],@"Overridden",
                                      @"",@"OverriddenTooltip",
                                      [NSNumber numberWithBool:YES],@"ModeRule",
                                      nil]];
            }
        }
 
        [modeSettings release];
 
        // Enumerate rules from defaults to add user added rules back in
        NSEnumerator *oldModes = [oldPrecedenceArray objectEnumerator];
        id oldMode;
        while ((oldMode = [oldModes nextObject])) {
            if (![oldMode respondsToSelector:@selector(objectForKey:)]) {
                NSLog(@"Wrong Type in ModePrecedence Preferences: %@ %@",[oldMode class], oldMode);
                continue;
            }
            if (![[oldMode objectForKey:@"Identifier"] isEqualToString:[bundle bundleIdentifier]]) continue;
            NSEnumerator *oldRules = [[oldMode objectForKey:@"Rules"] objectEnumerator];
            NSDictionary *oldRule;
            while ((oldRule = [oldRules nextObject])) {
                if (![[oldRule objectForKey:@"ModeRule"] boolValue]) {
                    [ruleArray addObject:[[oldRule mutableCopy] autorelease]];
                }
                
                NSEnumerator *newRulesEnumerator = [ruleArray objectEnumerator];
                id newRule;
                while ((newRule = [newRulesEnumerator nextObject])) {
                    if (([[oldRule objectForKey:@"String"] isEqualToString:[newRule objectForKey:@"String"]])&&([[oldRule objectForKey:@"TypeIdentifier"] intValue] == [[newRule objectForKey:@"TypeIdentifier"] intValue]) &&[oldRule objectForKey:@"Enabled"]) {
                          [newRule setObject:[oldRule objectForKey:@"Enabled"] forKey:@"Enabled"];
                         }
                }
            }                       
        }
    }
    
	for (i=[precendenceArray count]-1;i>=0;i--) {
		if (![[precendenceArray objectAtIndex:i] objectForKey:@"Identifier"]) [precendenceArray removeObjectAtIndex:i];
	}
	
    [defaults setObject:precendenceArray forKey:@"ModePrecedences"];
    return precendenceArray;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    [[NSUserDefaults standardUserDefaults] setObject:[self modePrecedenceArray] forKey:@"ModePrecedences"];
}


- (void)TCM_findModes {
    NSString *file;
    NSString *path;
    
    //create Directories
    NSArray *userDomainPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSEnumerator *enumerator = [userDomainPaths objectEnumerator];
    while ((path = [enumerator nextObject])) {
        NSString *fullPath = [path stringByAppendingPathComponent:MODEPATHCOMPONENT];
        if (![[NSFileManager defaultManager] fileExistsAtPath:fullPath isDirectory:nil]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:[fullPath stringByDeletingLastPathComponent] attributes:nil];
            [[NSFileManager defaultManager] createDirectoryAtPath:fullPath attributes:nil];
        }
    }

        
    NSMutableArray *allPaths = [NSMutableArray array];
    NSArray *allDomainsPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSAllDomainsMask, YES);
    enumerator = [allDomainsPaths objectEnumerator];
    while ((path = [enumerator nextObject])) {
        [allPaths addObject:[path stringByAppendingPathComponent:MODEPATHCOMPONENT]];
    }
    
    [allPaths addObject:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Modes/"]];
    
    enumerator = [allPaths reverseObjectEnumerator];
    while ((path = [enumerator nextObject])) {
        NSEnumerator *dirEnumerator = [[[NSFileManager defaultManager] directoryContentsAtPath:path] objectEnumerator];
        while ((file = [dirEnumerator nextObject])) {
            if ([[file pathExtension] isEqualToString:@"mode"]) {
                NSBundle *bundle = [NSBundle bundleWithPath:[path stringByAppendingPathComponent:file]];
                if (bundle && [bundle bundleIdentifier]) {
                    [I_modeBundles setObject:bundle forKey:[bundle bundleIdentifier]];
                    if (![I_modeIdentifiersTagArray containsObject:[bundle bundleIdentifier]]) {
                        [I_modeIdentifiersTagArray addObject:[bundle bundleIdentifier]];                    
                    }
                }
            }
            
        }
    }

}

- (IBAction)reloadDocumentModes:(id)aSender {
#if defined(CODA)
	[I_documentModesByIdentifierLock lock]; // ifc - experimental
#endif //defined(CODA)
    // write all preferences
    [[I_documentModesByIdentifier allValues] makeObjectsPerformSelector:@selector(writeDefaults)];
    [[NSUserDefaults standardUserDefaults] setObject:[self modePrecedenceArray] forKey:@"ModePrecedences"];
    
    // reload all modes
    [I_modeBundles                removeAllObjects];
    [I_documentModesByIdentifier  removeAllObjects];
#if defined(CODA)
	[I_modeIdentifiersByExtension removeAllObjects];
#endif //defined(CODA)
    [self TCM_findModes];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DocumentModeListChanged" object:self];
    
    [self setModePrecedenceArray:[self reloadPrecedences]];
    [self revalidatePrecedences];
#if defined(CODA)
	[I_documentModesByIdentifierLock unlock]; // ifc - experimental
#endif //defined(CODA)
}

- (void)resolveAllDependenciesForMode:(DocumentMode *)aMode {
    if (aMode && [aMode syntaxDefinition]) {
        I_dependencyQueue = [NSMutableDictionary new];
        [I_dependencyQueue setObject:@"queued" forKey:[[aMode syntaxDefinition] name]];
        NSEnumerator *enumerator = [[[[aMode syntaxDefinition] importedModes] allKeys] objectEnumerator];
        id modeName;
        while ((modeName = [enumerator nextObject])) {
            if (![I_dependencyQueue objectForKey:modeName]) {
                [self documentModeForIdentifier:modeName];
                [I_dependencyQueue setObject:@"queued" forKey:modeName];
            }
        }
        [I_dependencyQueue release];
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"DocumentModeManager, FoundModeBundles:%@",[I_modeBundles description]];
}

- (DocumentMode *)documentModeForName:(NSString *)aName {
    
	DocumentMode *mode = [I_documentModesByName objectForKey:aName];
	
	if ( !mode )
	{
		NSString *identifier = nil;
		if ([aName hasPrefix:@"SEEMode."]) {
			identifier = aName;
		} else {
			identifier = [NSString stringWithFormat:@"SEEMode.%@", aName];
		}
		mode = [self documentModeForIdentifier:identifier];
		
		if (!mode) {
			NSEnumerator *keyEnumerator = [[self availableModes] keyEnumerator];
			NSString *key;
			while ((key = [keyEnumerator nextObject])) {
				if ([identifier caseInsensitiveCompare:key] == NSOrderedSame) {
					mode = [self documentModeForIdentifier:key];
					break;
				}
			}
		}
        
		if ( mode )
			[I_documentModesByName setObject:mode forKey:aName];
	}
    
	return mode;
}

- (DocumentMode *)documentModeForIdentifier:(NSString *)anIdentifier {
#if defined(CODA)
	[I_documentModesByIdentifierLock lock]; // ifc - experimental
#endif //defined(CODA)
    NSBundle *bundle=[I_modeBundles objectForKey:anIdentifier];
    if (bundle) {
        DocumentMode *mode=[I_documentModesByIdentifier objectForKey:anIdentifier];
        if (!mode) {
            mode = [[[DocumentMode alloc] initWithBundle:bundle] autorelease];
            if (mode) {
                [I_documentModesByIdentifier setObject:mode forKey:anIdentifier];
                
                // Load all depended modes
                NSEnumerator *linkEnumerator = [[[mode syntaxDefinition] importedModes] keyEnumerator];
                id import;
                while ((import = [linkEnumerator nextObject])) {
                    [self documentModeForName:import];
                }
            }
            [self resolveAllDependenciesForMode:mode];
        }
#if defined(CODA)
			[I_documentModesByIdentifierLock unlock]; // ifc - experimental
#endif //defined(CODA)
        return mode;
    } else {
#if defined(CODA)
			[I_documentModesByIdentifierLock unlock]; // ifc - experimental
#endif //defined(CODA)
        return nil;
    }
}

- (DocumentMode *)baseMode {
    return [self documentModeForIdentifier:BASEMODEIDENTIFIER];
}

- (DocumentMode *)modeForNewDocuments {
    DocumentMode *returnValue=[self documentModeForIdentifier:[[NSUserDefaults standardUserDefaults] objectForKey:ModeForNewDocumentsPreferenceKey]];
    if (!returnValue) {
        returnValue=[self baseMode];
    }
    return returnValue;
}

- (NSMutableArray *)modePrecedenceArray {
    return I_modePrecedenceArray;
}

- (void)setModePrecedenceArray:(NSMutableArray *)anArray {
    [self willChangeValueForKey:@"modePrecedenceArray"];
    [I_modePrecedenceArray autorelease];
    I_modePrecedenceArray=[anArray retain];
    [self didChangeValueForKey:@"modePrecedenceArray"];
}

- (DocumentMode *)documentModeForPath:(NSString *)path withContentData:(NSData *)content {
    // Convert data to ASCII, we don't know encoding yet at this point
    // FIXME Don't forget to handle UTF16/32
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    unsigned maxLength = [[NSUserDefaults standardUserDefaults] integerForKey:@"ByteLengthToUseForModeRecognitionAndEncodingGuessing"];
    NSString *contentString = [[NSString alloc] initWithBytesNoCopy:(void *)[content bytes] length:MIN([content length],maxLength) encoding:NSMacOSRomanStringEncoding freeWhenDone:NO];
    DocumentMode *mode = [self documentModeForPath:path withContentString:contentString];
    [contentString release];
    [pool release]; // this is save because mode is stored in something persistant and we know it
    return mode;
}

- (DocumentMode *)documentModeForPath:(NSString *)path withContentString:(NSString *)contentString {
    NSString *filename = [path lastPathComponent];
    NSString *extension = [path pathExtension];
#if defined(CODA)        
// need to loop over keys like this for bug #10694
	NSArray		*allKeys = [I_modeIdentifiersByExtension allKeys];
	int			i, count = [allKeys count];
	NSString	*identifier = nil;
	NSString	*curKey = nil;
	
	for ( i = 0; i < count && (identifier == nil); i++ )
	{
		curKey = [allKeys objectAtIndex:i];
		if ( [[filename lowercaseString] hasSuffix:[curKey lowercaseString]] )
			identifier = [I_modeIdentifiersByExtension objectForKey:curKey];
    }
	
	if ( identifier ) 
        return [self documentModeForIdentifier:identifier];
#endif //defined(CODA)
    NSEnumerator *modeEnumerator = [[self modePrecedenceArray] objectEnumerator];
    NSMutableDictionary *mode;
    while ((mode = [modeEnumerator nextObject])) {

        NSEnumerator *ruleEnumerator = [[mode objectForKey:@"Rules"] objectEnumerator];
        NSMutableDictionary *rule;
        while ((rule = [ruleEnumerator nextObject])) {
            int ruleType = [[rule objectForKey:@"TypeIdentifier"] intValue];
            NSString *ruleString = [rule objectForKey:@"String"];
            
            if (ruleType == 0) { // Case insensitive extension
                if ([[ruleString uppercaseString] isEqualToString:[extension uppercaseString]]) return [self documentModeForIdentifier:[mode objectForKey:@"Identifier"]];
            } 
            if (ruleType == 3) { // Case sensitive extension
                if ([ruleString isEqualToString:extension]) return [self documentModeForIdentifier:[mode objectForKey:@"Identifier"]];
            } 
            if (ruleType == 1) {
                if ([ruleString isEqualToString:filename]) return [self documentModeForIdentifier:[mode objectForKey:@"Identifier"]];
            }  
            if (ruleType == 2 && contentString) {
                BOOL didMatch = NO;
                OGRegularExpressionMatch *match;
                OGRegularExpression *regex =
                    [[[OGRegularExpression alloc] initWithString:ruleString options:OgreFindNotEmptyOption|OgreMultilineOption] autorelease];
                match = [regex matchInString:contentString];
                didMatch = [match count]>0;
                if (didMatch) return [self documentModeForIdentifier:[mode objectForKey:@"Identifier"]];
            }
        }
        
    }

    return [self baseMode];
}


/*"Returns an NSDictionary with Key=Identifier, Value=ModeName"*/
- (NSDictionary *)availableModes {
    NSMutableDictionary *result=[NSMutableDictionary dictionary];
    NSEnumerator *modeIdentifiers=[I_modeBundles keyEnumerator];
    NSString *identifier = nil;
    while ((identifier=[modeIdentifiers nextObject])) {
        [result setObject:[[I_modeBundles objectForKey:identifier] objectForInfoDictionaryKey:@"CFBundleName"] 
                   forKey:identifier];
    }
    return result;
}

- (NSString *)documentModeIdentifierForTag:(int)aTag {
    if (aTag>0 && aTag<[I_modeIdentifiersTagArray count]) {
        return [I_modeIdentifiersTagArray objectAtIndex:aTag];
    } else {
        return nil;
    }
}

- (BOOL)documentModeAvailableModeIdentifier:(NSString *)anIdentifier {
    return [I_modeBundles objectForKey:anIdentifier]!=nil;
}

- (int)tagForDocumentModeIdentifier:(NSString *)anIdentifier {
    return [I_modeIdentifiersTagArray indexOfObject:anIdentifier];
}


- (void)setupMenu:(NSMenu *)aMenu action:(SEL)aSelector alternateDisplay:(BOOL)aFlag {

    // Remove all menu items
    int count = [aMenu numberOfItems];
    while (count) {
        [aMenu removeItemAtIndex:count - 1];
        count = [aMenu numberOfItems];
    }
    

    static NSImage *s_alternateImage=nil;
    static NSDictionary *s_menuDefaultStyleAttributes, *s_menuSmallStyleAttributes;
    if (aFlag && !s_alternateImage) {
//        s_alternateImage=[[[NSImage imageNamed:@"Mode.icns"] resizedImageWithSize:NSMakeSize(15,15)] retain];
        s_alternateImage=[[[[NSImage imageNamed:@"Mode.icns"] copy] retain] autorelease];
        [s_alternateImage setScalesWhenResized:YES];
        [s_alternateImage setSize:NSMakeSize(16,16)];
        s_menuDefaultStyleAttributes = [[NSDictionary alloc] initWithObjectsAndKeys:[NSFont menuFontOfSize:0],NSFontAttributeName,[NSColor blackColor], NSForegroundColorAttributeName, nil];
        s_menuSmallStyleAttributes = [[NSDictionary alloc] initWithObjectsAndKeys:[NSFont menuFontOfSize:9.],NSFontAttributeName,[NSColor darkGrayColor], NSForegroundColorAttributeName, nil];
    }

    // Add modes
    DocumentMode *baseMode=[self baseMode];
    
    NSMutableArray *menuEntries=[NSMutableArray array];
    NSEnumerator *modeIdentifiers=[I_modeBundles keyEnumerator];
    NSString *identifier = nil;
    while ((identifier=[modeIdentifiers nextObject])) {
        if (![identifier isEqualToString:BASEMODEIDENTIFIER]) {
            NSBundle *modeBundle=[I_modeBundles objectForKey:identifier];
            NSString *additionalText=nil;
            NSString *bundlePath=[modeBundle bundlePath];
            NSMutableAttributedString *attributedTitle=[[NSMutableAttributedString alloc] initWithString:[bundlePath lastPathComponent] attributes:s_menuDefaultStyleAttributes];
            if ([bundlePath hasPrefix:[[NSBundle mainBundle] bundlePath]]) {
                additionalText=[NSString stringWithFormat:@"SubEthaEdit %@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
            } else if ([bundlePath hasPrefix:@"/Library"]) {
                additionalText=@"/Library";
            } else if ([bundlePath hasPrefix:NSHomeDirectory()?NSHomeDirectory():@"/Users"]) {
                additionalText=@"~/Library";
            } else if ([bundlePath hasPrefix:NSHomeDirectory()?NSHomeDirectory():@"/Network"]) {
                additionalText=@"/Network";
            }

            [attributedTitle appendAttributedString:[[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" (%@ v%@, %@)",identifier,[[modeBundle infoDictionary] objectForKey:@"CFBundleShortVersionString"],additionalText] attributes:s_menuSmallStyleAttributes] autorelease]];
            
            [menuEntries 
                addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:identifier,@"Identifier",[modeBundle objectForInfoDictionaryKey:@"CFBundleName"],@"Name",attributedTitle,@"AttributedTitle",nil]];
            [attributedTitle release];
        }
    }

    NSMenuItem *menuItem = [[NSMenuItem alloc] initWithTitle:[[baseMode bundle] objectForInfoDictionaryKey:@"CFBundleName"] action:aSelector keyEquivalent:@""];
    [menuItem setTag:[self tagForDocumentModeIdentifier:BASEMODEIDENTIFIER]];
    [aMenu addItem:menuItem];
    [menuItem release];

    count=[menuEntries count];
    if (count > 0) {
        [aMenu addItem:[NSMenuItem separatorItem]];
        
        // sort
        NSArray *sortedEntries=[menuEntries sortedArrayUsingDescriptors:
                        [NSArray arrayWithObjects:
                            [[[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES selector:@selector(caseInsensitiveCompare:)] autorelease],
                            [[[NSSortDescriptor alloc] initWithKey:@"Identifier" ascending:YES] autorelease],nil]];
        
        int index=0;
        for (index=0;index<count;index++) {
            NSDictionary *entry=[sortedEntries objectAtIndex:index];
            NSMenuItem *menuItem =[[NSMenuItem alloc] initWithTitle:[entry objectForKey:@"Name"]
                                                             action:aSelector
                                                      keyEquivalent:@""];
            [menuItem setTag:[self tagForDocumentModeIdentifier:[entry objectForKey:@"Identifier"]]];
            if (aFlag) {
                [menuItem setAttributedTitle:[entry objectForKey:@"AttributedTitle"]];
                [menuItem setImage:s_alternateImage];
            }
            [aMenu addItem:menuItem];
            [menuItem release];
            
        }
    }
    if (aFlag) {
        [aMenu addItem:[NSMenuItem separatorItem]];
        menuItem = [[NSMenuItem alloc] 
            initWithTitle:NSLocalizedString(@"Open User Modes Folder", @"Menu item in alternate mode menu for opening the user modes folder.")
                   action:@selector(revealModesFolder:)
            keyEquivalent:@""];
        [menuItem setTag:2];
        [menuItem setTarget:self];
        [aMenu addItem:menuItem];
        [menuItem release];

        menuItem = [[NSMenuItem alloc] 
            initWithTitle:NSLocalizedString(@"Open Library Modes Folder",@"Menu item in alternate mode menu for opening the library modes folder.")
                   action:@selector(revealModesFolder:)
            keyEquivalent:@""];
        [menuItem setTag:1];
        [menuItem setTarget:self];
        [aMenu addItem:menuItem];
        [menuItem release];

        menuItem = [[NSMenuItem alloc] 
            initWithTitle:NSLocalizedString(@"Open SubEthaEdit Modes Folder",@"Menu item in alternate mode menu for opening the SubEthaEdit modes folder.")
                   action:@selector(revealModesFolder:)
            keyEquivalent:@""];
        [menuItem setTag:0];
        [menuItem setTarget:self];
        [aMenu addItem:menuItem];
        [menuItem release];
    }
}

- (IBAction)revealModesFolder:(id)aSender {
    NSString *directoryString = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Modes/"];
    switch ([aSender tag]) {
        case 2: {
            NSArray *userDomainPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
            NSString *path=[userDomainPaths lastObject];
            directoryString = [path stringByAppendingPathComponent:MODEPATHCOMPONENT]; }
            break;
        case 1: {
            NSArray *systemDomainPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSSystemDomainMask, YES);
            NSString *path=[systemDomainPaths lastObject];
            directoryString = [path stringByAppendingPathComponent:MODEPATHCOMPONENT];
            }
            break;
    }
    if (![[NSWorkspace sharedWorkspace] openFile:directoryString]) NSBeep();;
}

- (void)setupPopUp:(DocumentModePopUpButton *)aPopUp selectedModeIdentifier:(NSString *)aModeIdentifier automaticMode:(BOOL)hasAutomaticMode {
    [aPopUp removeAllItems];
    NSMenu *tempMenu=[[NSMenu new] autorelease];
    [self setupMenu:tempMenu action:@selector(none:) alternateDisplay:NO];
    if (hasAutomaticMode) {
        NSMenuItem *menuItem=[[[tempMenu itemArray] objectAtIndex:0] copy];
        [menuItem setTag:[self tagForDocumentModeIdentifier:AUTOMATICMODEIDENTIFIER]];
        [menuItem setTitle:NSLocalizedString(@"Automatic Mode", @"Foo")];
        [tempMenu insertItem:menuItem atIndex:0];
        [menuItem release];
    }
    NSEnumerator *menuItems=[[tempMenu itemArray] objectEnumerator];
    NSMenuItem *item=nil;
    while ((item=[menuItems nextObject])) {
        if (![item isSeparatorItem]) {
            [aPopUp addItemWithTitle:[item title]];
            [[aPopUp lastItem] setTag:[item tag]];
            [[aPopUp lastItem] setEnabled:YES];
        }     
    }
    if (hasAutomaticMode) {
        [[aPopUp menu] insertItem:[NSMenuItem separatorItem] atIndex:1];
    }
    [aPopUp setSelectedModeIdentifier:aModeIdentifier];
}

@end