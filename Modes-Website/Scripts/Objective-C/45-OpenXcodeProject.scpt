FasdUAS 1.101.10   ��   ��    k             l     ��  ��    . ( Opens the Xcode Project this File is in     � 	 	 P   O p e n s   t h e   X c o d e   P r o j e c t   t h i s   F i l e   i s   i n   
  
 l     ��������  ��  ��        l     ��  ��    � �---------------------------------------------------------------------------------------------------------------------- SeeSettings     �   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   S e e S e t t i n g s      i         I      �������� 0 seescriptsettings  ��  ��    L     	   K        ��  �� $0 keyboardshortcut keyboardShortcut  m       �    $ @ x  ��  �� $0 shortdisplayname shortDisplayName  m       �    O p e n   P r o j e c t  �� ���� 0 displayname displayName  m         � ! ! $ O p e n   X c o d e   P r o j e c t��     " # " l     ��������  ��  ��   #  $ % $ l     �� & '��   & � �---------------------------------------------------------------------------------------------------------------------- The actual Script    ' � ( ( - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   T h e   a c t u a l   S c r i p t %  ) * ) l     ��������  ��  ��   *  + , + l     -���� - O      . / . r     0 1 0 n     2 3 2 1    ��
�� 
psxp 3 l    4���� 4 c     5 6 5 n    
 7 8 7 m    
��
�� 
file 8 4   �� 9
�� 
docu 9 m    ����  6 m   
 ��
�� 
ctxt��  ��   1 o      ���� 0 documentpath documentPath / m      : :(                                                                                  Hdra  alis    �  	BuildDisk                  ϒ�H+   hcSubEthaEdit.app                                                  jwϗ��        ����  	               Debug     ϒ��      ϗϭ      hc  h,  h&  =�  RBuildDisk:SubEthaEdit-hdnlodhxzchzvx#3D9F: Build: Products: Debug: SubEthaEdit.app     S u b E t h a E d i t . a p p   	 B u i l d D i s k  N/SubEthaEdit-hdnlodhxzchzvxauuucuarwnjpsq/Build/Products/Debug/SubEthaEdit.app  /Volumes/BuildDisk��  ��  ��   ,  ; < ; l     ��������  ��  ��   <  = > = l     �� ? @��   ? 2 , using 'external' to get the xcode workspace    @ � A A X   u s i n g   ' e x t e r n a l '   t o   g e t   t h e   x c o d e   w o r k s p a c e >  B C B l    D���� D r     E F E I    �� G���� ~0 =posixpathbydeletinglastpathcomponentandaddinghelperscriptpath =posixPathByDeletingLastPathcomponentAndAddingHelperScriptPath G  H�� H I   �� I��
�� .earsffdralis        afdr I  f    ��  ��  ��   F o      ���� 0 
scriptpath 
scriptPath��  ��   C  J K J l   ) L���� L r    ) M N M I   '�� O��
�� .sysoloadscpt        file O 4    #�� P
�� 
psxf P l  ! " Q���� Q o   ! "���� 0 
scriptpath 
scriptPath��  ��  ��   N o      ���� *0 projecthelperscript projectHelperScript��  ��   K  R S R l     ��������  ��  ��   S  T U T l  * 7 V���� V O   * 7 W X W r   . 6 Y Z Y I   . 4�� [���� H0 "ensurexcodeprojectforposixfilepath "ensureXcodeProjectForPosixFilePath [  \�� \ o   / 0���� 0 documentpath documentPath��  ��   Z o      ���� 0 myworkspace myWorkspace X o   * +���� *0 projecthelperscript projectHelperScript��  ��   U  ] ^ ] l     ��������  ��  ��   ^  _ ` _ l     �� a b��   a  log myWorkspace as list    b � c c . l o g   m y W o r k s p a c e   a s   l i s t `  d e d l     �� f g��   f  set myWorkspace to false    g � h h 0 s e t   m y W o r k s p a c e   t o   f a l s e e  i j i l     ��������  ��  ��   j  k l k l  8 � m���� m Z   8 � n o�� p n l  8 ; q���� q >  8 ; r s r o   8 9���� 0 myworkspace myWorkspace s m   9 :��
�� boovfals��  ��   o O   > � t u t k   B � v v  w x w I  B G������
�� .miscactvnull��� ��� null��  ��   x  y z y r   H Q { | { l  H M }���� } c   H M ~  ~ n   H K � � � m   I K��
�� 
file � o   H I���� 0 myworkspace myWorkspace  m   K L��
�� 
ctxt��  ��   | o      ���� 0 
myfullpath 
myFullPath z  ��� � X   R � ��� � � k   j � � �  � � � r   j u � � � l  j q ����� � c   j q � � � n   j o � � � m   m o��
�� 
file � n   j m � � � m   k m��
�� 
docu � o   j k���� 0 mywindow myWindow � m   o p��
�� 
ctxt��  ��   � o      ���� 0 mywindowpath myWindowPath �  � � � l  v v��������  ��  ��   �  � � � l  v v�� � ���   � 3 -log myWindowPath & " -- original path window"    � � � � Z l o g   m y W i n d o w P a t h   &   "   - -   o r i g i n a l   p a t h   w i n d o w " �  � � � l  v v�� � ���   � ) #log myFullPath & " -- path project"    � � � � F l o g   m y F u l l P a t h   &   "   - -   p a t h   p r o j e c t " �  � � � l  v v��������  ��  ��   �  � � � l  v v�� � ���   � , & bring the project window to the front    � � � � L   b r i n g   t h e   p r o j e c t   w i n d o w   t o   t h e   f r o n t �  ��� � Z   v � � ����� � =  v } � � � o   v y���� 0 mywindowpath myWindowPath � o   y |���� 0 
myfullpath 
myFullPath � k   � � � �  � � � r   � � � � � m   � �����  � n       � � � 1   � ���
�� 
pidx � o   � ����� 0 mywindow myWindow �  ��� �  S   � ���  ��  ��  ��  �� 0 mywindow myWindow � 2  U Z��
�� 
cwin��   u m   > ? � ��                                                                                      @ alis    .  jon                        �AH+  ��	Xcode.app                                                      ��2���P        ����  	                Applications    �@��      ���@    ��  jon:Applications: Xcode.app    	 X c o d e . a p p    j o n  Applications/Xcode.app  / ��  ��   p I  � ��� ���
�� .sysodlogaskr        TEXT � m   � � � � � � � ` N o   P r o j e c t   c o n t a i n i n g   t h e   c u r r e n t   d o c u m e n t   f o u n d��  ��  ��   l  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � � �---------------------------------------------------------------------------------------------------------------------- Helper - Path to helper script    � � � �* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   H e l p e r   -   P a t h   t o   h e l p e r   s c r i p t �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� ~0 =posixpathbydeletinglastpathcomponentandaddinghelperscriptpath =posixPathByDeletingLastPathcomponentAndAddingHelperScriptPath �  ��� � o      ���� 0 apath aPath��  ��   � k     | � �  � � � r      � � � m     ��
�� boovfals � o      �� 0 myresult myResult �  � � � l   �~ � ��~   � $ set myFile to POSIX file aPath    � � � � < s e t   m y F i l e   t o   P O S I X   f i l e   a P a t h �  � � � r     � � � o    �}�} 0 apath aPath � o      �|�| 0 myfile myFile �  � � � r     � � � n    � � � 1   	 �{
�{ 
txdl � 1    	�z
�z 
ascr � o      �y�y 0 olddelimiters oldDelimiters �  � � � r     � � � J     � �  ��x � m     � � � � �  :�x   � n      � � � 1    �w
�w 
txdl � 1    �v
�v 
ascr �  � � � r     � � � n     � � � 2   �u
�u 
citm � l    ��t�s � c     � � � o    �r�r 0 myfile myFile � m    �q
�q 
ctxt�t  �s   � o      �p�p 0 	pathitems 	pathItems �  � � � Z    > � ��o�n � =   $ � � � n    " � � � 4   "�m �
�m 
cobj � m     !�l�l�� � o    �k�k 0 	pathitems 	pathItems � m   " # � � � � �   � r   ' : � � � n   ' 8 � � � 7  ( 8�j � �
�j 
cobj � m   , .�i�i  � l  / 7 ��h�g � \   / 7 � � � l  0 5 ��f�e � I  0 5�d �c
�d .corecnte****       ****  o   0 1�b�b 0 	pathitems 	pathItems�c  �f  �e   � m   5 6�a�a �h  �g   � o   ' (�`�` 0 	pathitems 	pathItems � o      �_�_ 0 	pathitems 	pathItems�o  �n   �  Z   ? s�^�] ?   ? F l  ? D�\�[ I  ? D�Z�Y
�Z .corecnte****       **** o   ? @�X�X 0 	pathitems 	pathItems�Y  �\  �[   m   D E�W�W  k   I o		 

 r   I \ n   I Z 7  J Z�V
�V 
cobj m   N P�U�U  l  Q Y�T�S \   Q Y l  R W�R�Q I  R W�P�O
�P .corecnte****       **** o   R S�N�N 0 	pathitems 	pathItems�O  �R  �Q   m   W X�M�M �T  �S   o   I J�L�L 0 	pathitems 	pathItems o      �K�K 0 	pathitems 	pathItems  r   ] f l  ] d�J�I c   ] d b   ] b l  ] ` �H�G  c   ] `!"! o   ] ^�F�F 0 	pathitems 	pathItems" m   ^ _�E
�E 
TEXT�H  �G   m   ` a## �$$ 8 : h e l p e r : x c o d e P a t h H e l p e r . s c p t m   b c�D
�D 
TEXT�J  �I   o      �C�C 0 myresult myResult %�B% r   g o&'& n   g m()( 1   k m�A
�A 
psxp) 4   g k�@*
�@ 
file* o   i j�?�? 0 myresult myResult' o      �>�> 0 myresult myResult�B  �^  �]   +,+ r   t y-.- o   t u�=�= 0 olddelimiters oldDelimiters. n     /0/ 1   v x�<
�< 
txdl0 1   u v�;
�; 
ascr, 121 l  z z�:34�:  3  log myResult   4 �55  l o g   m y R e s u l t2 6�96 L   z |77 o   z {�8�8 0 myresult myResult�9   � 8�78 l     �6�5�4�6  �5  �4  �7       �39:;<�3  9 �2�1�0�2 0 seescriptsettings  �1 ~0 =posixpathbydeletinglastpathcomponentandaddinghelperscriptpath =posixPathByDeletingLastPathcomponentAndAddingHelperScriptPath
�0 .aevtoappnull  �   � ****: �/ �.�-=>�,�/ 0 seescriptsettings  �.  �-  =  > �+ �* �)  �(�+ $0 keyboardshortcut keyboardShortcut�* $0 shortdisplayname shortDisplayName�) 0 displayname displayName�( �, 
�������; �' ��&�%?@�$�' ~0 =posixpathbydeletinglastpathcomponentandaddinghelperscriptpath =posixPathByDeletingLastPathcomponentAndAddingHelperScriptPath�& �#A�# A  �"�" 0 apath aPath�%  ? �!� ����! 0 apath aPath�  0 myresult myResult� 0 myfile myFile� 0 olddelimiters oldDelimiters� 0 	pathitems 	pathItems@ �� ���� ���#��
� 
ascr
� 
txdl
� 
ctxt
� 
citm
� 
cobj
� .corecnte****       ****
� 
TEXT
� 
file
� 
psxp�$ }fE�O�E�O��,E�O�kv��,FO��&�-E�O��i/�  �[�\[Zk\Z�j k2E�Y hO�j k +�[�\[Zk\Z�j k2E�O��&�%�&E�O*�/�,E�Y hO���,FO�< �B��CD�
� .aevtoappnull  �   � ****B k     �EE  +FF  BGG  JHH  TII  k��  �  �  C �� 0 mywindow myWindowD  :����
�	�������� �� �������������� ���
� 
docu
� 
file
� 
ctxt
�
 
psxp�	 0 documentpath documentPath
� .earsffdralis        afdr� ~0 =posixpathbydeletinglastpathcomponentandaddinghelperscriptpath =posixPathByDeletingLastPathcomponentAndAddingHelperScriptPath� 0 
scriptpath 
scriptPath
� 
psxf
� .sysoloadscpt        file� *0 projecthelperscript projectHelperScript� H0 "ensurexcodeprojectforposixfilepath "ensureXcodeProjectForPosixFilePath� 0 myworkspace myWorkspace
�  .miscactvnull��� ��� null�� 0 
myfullpath 
myFullPath
�� 
cwin
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 mywindowpath myWindowPath
�� 
pidx
�� .sysodlogaskr        TEXT� �� *�k/�,�&�,E�UO*)j k+ E�O*��/j 
E�O� 
*�k+ E�UO�f Z� R*j O��,�&E` O ?*a -[a a l kh  ��,�,�&E` O_ _   k�a ,FOY h[OY��UY 	a j  ascr  ��ޭ