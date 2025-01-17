FasdUAS 1.101.10   ��   ��    k             l     ��  ��    M G $Id: InsertEnvironment.applescript,v 1.4 2008/02/17 11:23:46 mjb Exp $     � 	 	 �   $ I d :   I n s e r t E n v i r o n m e n t . a p p l e s c r i p t , v   1 . 4   2 0 0 8 / 0 2 / 1 7   1 1 : 2 3 : 4 6   m j b   E x p   $   
  
 l     ��������  ��  ��        l      ��  ��   -'
Copyright (c) 2008, Michael J. Barber

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject
to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
     �  N 
 C o p y r i g h t   ( c )   2 0 0 8 ,   M i c h a e l   J .   B a r b e r 
 
 P e r m i s s i o n   i s   h e r e b y   g r a n t e d ,   f r e e   o f   c h a r g e ,   t o   a n y   p e r s o n   o b t a i n i n g 
 a   c o p y   o f   t h i s   s o f t w a r e   a n d   a s s o c i a t e d   d o c u m e n t a t i o n   f i l e s   ( t h e 
 " S o f t w a r e " ) ,   t o   d e a l   i n   t h e   S o f t w a r e   w i t h o u t   r e s t r i c t i o n ,   i n c l u d i n g 
 w i t h o u t   l i m i t a t i o n   t h e   r i g h t s   t o   u s e ,   c o p y ,   m o d i f y ,   m e r g e ,   p u b l i s h , 
 d i s t r i b u t e ,   s u b l i c e n s e ,   a n d / o r   s e l l   c o p i e s   o f   t h e   S o f t w a r e ,   a n d   t o 
 p e r m i t   p e r s o n s   t o   w h o m   t h e   S o f t w a r e   i s   f u r n i s h e d   t o   d o   s o ,   s u b j e c t 
 t o   t h e   f o l l o w i n g   c o n d i t i o n s : 
 
 T h e   a b o v e   c o p y r i g h t   n o t i c e   a n d   t h i s   p e r m i s s i o n   n o t i c e   s h a l l   b e 
 i n c l u d e d   i n   a l l   c o p i e s   o r   s u b s t a n t i a l   p o r t i o n s   o f   t h e   S o f t w a r e . 
 
 T H E   S O F T W A R E   I S   P R O V I D E D   " A S   I S " ,   W I T H O U T   W A R R A N T Y   O F   A N Y   K I N D , 
 E X P R E S S   O R   I M P L I E D ,   I N C L U D I N G   B U T   N O T   L I M I T E D   T O   T H E   W A R R A N T I E S   O F 
 M E R C H A N T A B I L I T Y ,   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E   A N D   N O N I N F R I N G E M E N T . 
 I N   N O   E V E N T   S H A L L   T H E   A U T H O R S   O R   C O P Y R I G H T   H O L D E R S   B E   L I A B L E   F O R 
 A N Y   C L A I M ,   D A M A G E S   O R   O T H E R   L I A B I L I T Y ,   W H E T H E R   I N   A N   A C T I O N   O F 
 C O N T R A C T ,   T O R T   O R   O T H E R W I S E ,   A R I S I N G   F R O M ,   O U T   O F   O R   I N   C O N N E C T I O N 
 W I T H   T H E   S O F T W A R E   O R   T H E   U S E   O R   O T H E R   D E A L I N G S   I N   T H E   S O F T W A R E . 
      l     ��������  ��  ��        j     �� �� (0 defaultenvironment defaultEnvironment  m        �    e q u a t i o n      l     ��������  ��  ��        l     ����  Q          I   ��   !
�� .sysodlogaskr        TEXT   m     " " � # # . E n t e r   e n v i r o n m e n t   n a m e : ! �� $ %
�� 
appr $ m     & & � ' ' $ I n s e r t   E n v i r o n m e n t % �� (��
�� 
dtxt ( o    ���� (0 defaultenvironment defaultEnvironment��    R      ���� )
�� .ascrerr ****      � ****��   ) �� *��
�� 
errn * d       + + m      ���� ���    l    , - . , L    ����   -   user canceled    . � / /    u s e r   c a n c e l e d��  ��     0 1 0 l     2���� 2 r      3 4 3 n     5 6 5 1    ��
�� 
ttxt 6 1    ��
�� 
rslt 4 o      ���� 0 envname envName��  ��   1  7 8 7 l  ! ( 9���� 9 r   ! ( : ; : o   ! "���� 0 envname envName ; o      ���� (0 defaultenvironment defaultEnvironment��  ��   8  < = < l     ��������  ��  ��   =  > ? > l  ) L @���� @ r   ) L A B A I     ���� C��  0 selectionrange selectionRange��   C �� D E��  0 extendingfront extendingFront D m   2 3��
�� boovfals E �� D���� 0 extendingend extendingEnd��   B J   + / F F  G H G o   + ,���� 0 startselected startSelected H  I�� I o   , -���� 0 nextselected nextSelected��  ��  ��   ?  J K J l  M x L���� L r   M x M N M I     ���� O��  0 selectionrange selectionRange��   O �� P Q��  0 extendingfront extendingFront P m   Z [��
�� boovtrue Q �� P���� 0 extendingend extendingEnd��   N J   O W R R  S T S o   O R���� 0 startextended startExtended T  U�� U o   R U���� 0 nextextended nextExtended��  ��  ��   K  V W V l     ��������  ��  ��   W  X Y X l  y � Z���� Z r   y � [ \ [ I   y ��� ]���� &0 selectbycomparing selectByComparing ]  ^ _ ^ o   z {���� 0 startselected startSelected _  ` a ` o   { ~���� 0 startextended startExtended a  b c b m   ~ � d d � e e   c  f�� f m   � � g g � h h  
��  ��   \ o      ���� 
0 prefix  ��  ��   Y  i j i l  � � k���� k r   � � l m l I   � ��� n���� &0 selectbycomparing selectByComparing n  o p o o   � ����� 0 nextselected nextSelected p  q r q o   � ����� 0 nextextended nextExtended r  s t s m   � � u u � v v   t  w�� w m   � � x x � y y  
��  ��   m o      ���� 
0 suffix  ��  ��   j  z { z l  � � |���� | r   � � } ~ } I   � ��� ���� &0 selectbycomparing selectByComparing   � � � o   � ����� 0 startselected startSelected �  � � � o   � ����� 0 nextselected nextSelected �  � � � m   � � � � � � �  	 �  ��� � m   � � � � � � �  ��  ��   ~ o      ���� 
0 indent  ��  ��   {  � � � l     ��������  ��  ��   �  � � � l  � � ����� � r   � � � � � l  � � ����� � I  � ��� � ��� 0 join   � J   � � � �  � � � o   � ����� 
0 prefix   �  � � � m   � � � � � � �  \ b e g i n { �  � � � o   � ����� 0 envname envName �  � � � m   � � � � � � �  } 
 �  � � � o   � ����� 
0 indent   �  ��� � I   � ��������� 0 selectiontext selectionText��  ��  ��   � �� ���
�� 
by   � m   � � � � � � �  ��  ��  ��   � o      ���� "0 beforeinsertion beforeInsertion��  ��   �  � � � l  � � ����� � r   � � � � � l  � � ����� � I  � ��� � ��� 0 join   � J   � � � �  � � � o   � ����� 
0 suffix   �  � � � m   � � � � � � � 
 \ e n d { �  � � � o   � ����� 0 envname envName �  ��� � m   � � � � � � �  } 
��   � �� ���
�� 
by   � m   � � � � � � �  ��  ��  ��   � o      ����  0 afterinsertion afterInsertion��  ��   �  � � � l     ��������  ��  ��   �  � � � l  � ����� � I  ����� ��� $0 setselectiontext setSelectionText��   � �� ���
�� 
to   � l  � � ����� � b   � � � � � o   � ����� "0 beforeinsertion beforeInsertion � o   � ���  0 afterinsertion afterInsertion��  ��  ��  ��  ��   �  � � � l  ��~�} � I �|�{ ��| &0 setselectionrange setSelectionRange�{   � �z ��y
�z 
to   � [   � � � \   � � � [   � � � o  �x�x 0 startselected startSelected � l  ��w�v � I �u ��t
�u .corecnte****       **** � o  �s�s "0 beforeinsertion beforeInsertion�t  �w  �v   � m  �r�r  � l  ��q�p � I �o ��n
�o .corecnte****       **** � o  �m�m 
0 suffix  �n  �q  �p  �y  �~  �}   �  � � � l     �l�k�j�l  �k  �j   �  � � � i    � � � I      �i ��h�i &0 selectbycomparing selectByComparing �  � � � o      �g�g 0 val1   �  � � � o      �f�f 0 val2   �  � � � o      �e�e 0 sameval sameVal �  ��d � o      �c�c 0 diffval diffVal�d  �h   � Z      � ��b � � =     � � � o     �a�a 0 val1   � o    �`�` 0 val2   � o    �_�_ 0 sameval sameVal�b   � o   
 �^�^ 0 diffval diffVal �  � � � l     �]�\�[�]  �\  �[   �  � � � i    
 � � � I      �Z�Y�X�Z 0 seescriptsettings  �Y  �X   � K      � � �W � ��W 0 displayname displayName � m     � � � � � * I n s e r t   E n v i r o n m e n t . . . � �V � ��V $0 keyboardshortcut keyboardShortcut � m     � � � � �  @ ^ e � �U ��T�U 0 incontextmenu inContextMenu � m     � � � � �  y e s�T   �  � � � l     �S�R�Q�S  �R  �Q   �  �  � l     �P�P     SubEthaEdit Tools    � $   S u b E t h a E d i t   T o o l s   l     �O�O   M G $Id: SubEthaEditTools.m4pplescript,v 1.6 2008/02/17 12:29:00 mjb Exp $    � �   $ I d :   S u b E t h a E d i t T o o l s . m 4 p p l e s c r i p t , v   1 . 6   2 0 0 8 / 0 2 / 1 7   1 2 : 2 9 : 0 0   m j b   E x p   $ 	
	 l     �N�M�L�N  �M  �L  
  l     �K�K     Environment management    � .   E n v i r o n m e n t   m a n a g e m e n t  l     �J�I�H�J  �I  �H    i     I      �G�F�E�G "0 modeenvironment modeEnvironment�F  �E   I    !�D�D 0 join   J       m      � r e x p o r t   _ _ C F _ U S E R _ T E X T _ E N C O D I N G = 0 x 1 F 5 : 0 x 8 0 0 0 1 0 0 : 0 x 8 0 0 0 1 0 0 ;  m     �   4 e x p o r t   S E E _ M O D E _ R E S O U R C E S = !"! I   �C�B#�C $0 doublequotedform doubleQuotedForm�B  # �A$�@
�A 
for $ I    	�?�>�=�? 0 moderesources modeResources�>  �=  �@  " %&% m    '' �((  ;  & )�<) I   �;�:*�; "0 readenvironment readEnvironment�:  * �9+�8
�9 
outo+ I    �7�6�5�7 *0 environmentfilepath environmentFilePath�6  �5  �8  �<   �4,�3
�4 
by  , m    -- �..  �3   /0/ l     �2�1�0�2  �1  �0  0 121 i    343 I      �/�.�-�/ 0 moderesources modeResources�.  �-  4 O    565 e    77 l   8�,�+8 n    9:9 1   
 �*
�* 
pMrp: l   
;�)�(; n    
<=< m    
�'
�' 
Mode= l   >�&�%> 4   �$?
�$ 
docu? m    �#�# �&  �%  �)  �(  �,  �+  6 m     @@�                                                                                  Hdra   alis    �  Macintosh HD               ��W	H+   <�SubEthaEdit.app                                                 &k!�Q��        ����  	                Life    ��:�      �Q��     <� 
v� 
J=  {�  =Macintosh HD:Users:pittenau:Applications:Life:SubEthaEdit.app      S u b E t h a E d i t . a p p    M a c i n t o s h   H D  0Users/pittenau/Applications/Life/SubEthaEdit.app  /    ��  2 ABA l     �"�!� �"  �!  �   B CDC i   EFE I      ���� 20 openenvironmentsettings openEnvironmentSettings�  �  F I    ��G� "0 openenvironment openEnvironment�  G �HI
� 
at  H I    ���� *0 environmentfilepath environmentFilePath�  �  I �J�� 60 settingdefaultenvironment settingDefaultEnvironmentJ m    	�
� boovtrue�  D KLK l     ����  �  �  L MNM i    OPO I      ���� *0 environmentfilepath environmentFilePath�  �  P k     $QQ RSR O    TUT r    VWV n    XYX 1   
 �
� 
pnamY l   
Z��Z n    
[\[ m    
�

�
 
Mode\ l   ]�	�] 4   �^
� 
docu^ m    �� �	  �  �  �  W o      �� 0 modename modeNameU m     __�                                                                                  Hdra   alis    �  Macintosh HD               ��W	H+   <�SubEthaEdit.app                                                 &k!�Q��        ����  	                Life    ��:�      �Q��     <� 
v� 
J=  {�  =Macintosh HD:Users:pittenau:Applications:Life:SubEthaEdit.app      S u b E t h a E d i t . a p p    M a c i n t o s h   H D  0Users/pittenau/Applications/Life/SubEthaEdit.app  /    ��  S `�` I   $�ab� 0 join  a J    cc ded I   �fg
� .earsffdralis        afdrf m    �
� afdrprefg � hi
�  
fromh m    ��
�� fldmfldui ��j��
�� 
rtypj m    ��
�� 
TEXT��  e klk m    mm �nn : d e . c o d i n g m o n k e y s . S u b E t h a E d i t .l opo o    ���� 0 modename modeNamep q��q m    rr �ss $ _ e n v i r o n m e n t . p l i s t��  b ��t��
�� 
by  t m     uu �vv  ��  �  N wxw l     ��������  ��  ��  x yzy l     ��{|��  { $  Manipulation of document text   | �}} <   M a n i p u l a t i o n   o f   d o c u m e n t   t e x tz ~~ l     ��������  ��  ��   ��� i   ��� I      �������� .0 completeselectedlines completeSelectedLines��  ��  � I    	������� "0 extendselection extendSelection��  � ������  0 extendingfront extendingFront� m    ��
�� boovtrue� ������� 0 extendingend extendingEnd��  � ��� l     ��������  ��  ��  � ��� i    "��� I      �������� 0 selectiontext selectionText��  ��  � O    ��� e    �� l   ������ n    ��� 1   
 ��
�� 
pTxt� l   
������ 1    
��
�� 
pSel��  ��  ��  ��  � l    ������ n     ��� 4   ���
�� 
docu� m    ���� � m     ���                                                                                  Hdra   alis    �  Macintosh HD               ��W	H+   <�SubEthaEdit.app                                                 &k!�Q��        ����  	                Life    ��:�      �Q��     <� 
v� 
J=  {�  =Macintosh HD:Users:pittenau:Applications:Life:SubEthaEdit.app      S u b E t h a E d i t . a p p    M a c i n t o s h   H D  0Users/pittenau/Applications/Life/SubEthaEdit.app  /    ��  ��  ��  � ��� l     ��������  ��  ��  � ��� i  # &��� I      ������� $0 setselectiontext setSelectionText��  � �����
�� 
to  � o      ���� 0 newtext newText��  � O    ��� r    ��� l   ������ o    ���� 0 newtext newText��  ��  � l     ������ n      ��� 1    ��
�� 
pTxt� l   ������ n    ��� 1   	 ��
�� 
pSel� l   	������ 4   	���
�� 
docu� m    ���� ��  ��  ��  ��  ��  ��  � m     ���                                                                                  Hdra   alis    �  Macintosh HD               ��W	H+   <�SubEthaEdit.app                                                 &k!�Q��        ����  	                Life    ��:�      �Q��     <� 
v� 
J=  {�  =Macintosh HD:Users:pittenau:Applications:Life:SubEthaEdit.app      S u b E t h a E d i t . a p p    M a c i n t o s h   H D  0Users/pittenau/Applications/Life/SubEthaEdit.app  /    ��  � ��� l     ��������  ��  ��  � ��� i   ' *��� I      �������  0 selectionrange selectionRange��  � ������  0 extendingfront extendingFront� o      ���� &0 shouldextendfront shouldExtendFront� ������� 0 extendingend extendingEnd� o      ���� "0 shouldextendend shouldExtendEnd��  � O     g��� Z    f����� F    ��� o    ���� &0 shouldextendfront shouldExtendFront� o    ���� "0 shouldextendend shouldExtendEnd� e    %�� J    %�� ��� n    ��� 1    ��
�� 
pIdS� l   ������ n    ��� 4   ���
�� 
cpar� m    ���� � l   ������ 1    ��
�� 
pSel��  ��  ��  ��  � ���� n    #��� 1     "��
�� 
pIdN� l    ������ n     ��� 4    ���
�� 
cpar� m    ������� l   ������ 1    ��
�� 
pSel��  ��  ��  ��  ��  � ��� o   ( )���� &0 shouldextendfront shouldExtendFront� ��� e   , =�� J   , =�� ��� n   , 5��� 1   2 4��
�� 
pIdS� l  , 2������ n   , 2��� 4  / 2���
�� 
cpar� m   0 1���� � l  , /������ 1   , /��
�� 
pSel��  ��  ��  ��  � ���� n   5 ;��� 1   8 :��
�� 
pIdN� l  5 8������ 1   5 8��
�� 
pSel��  ��  ��  � ��� o   @ A���� "0 shouldextendend shouldExtendEnd� ���� e   D U�� J   D U�� ��� n   D J��� 1   G I��
�� 
pIdS� l  D G������ 1   D G��
�� 
pSel��  ��  � ���� n   J S��� 1   P R��
�� 
pIdN� l  J P������ n   J P��� 4  M P���
�� 
cpar� m   N O������� l  J M������ 1   J M��
�� 
pSel��  ��  ��  ��  ��  ��  � e   X f�� J   X f�� ��� n   X ^��� 1   [ ]��
�� 
pIdS� l  X [������ 1   X [��
�� 
pSel��  ��  �  ��  n   ^ d 1   a c��
�� 
pIdN l  ^ a���� 1   ^ a��
�� 
pSel��  ��  ��  � l    ��~ n      4   �}
�} 
docu m    �|�|  m     �                                                                                  Hdra   alis    �  Macintosh HD               ��W	H+   <�SubEthaEdit.app                                                 &k!�Q��        ����  	                Life    ��:�      �Q��     <� 
v� 
J=  {�  =Macintosh HD:Users:pittenau:Applications:Life:SubEthaEdit.app      S u b E t h a E d i t . a p p    M a c i n t o s h   H D  0Users/pittenau/Applications/Life/SubEthaEdit.app  /    ��  �  �~  � 	
	 l     �{�z�y�{  �z  �y  
  i  + . I      �x�w�x &0 setselectionrange setSelectionRange�w   �v�u
�v 
to   o      �t�t 0 newrange newRange�u   O      r     o    �s�s 0 newrange newRange 1    �r
�r 
pSel l    �q�p n      4   �o
�o 
docu m    �n�n  m     �                                                                                  Hdra   alis    �  Macintosh HD               ��W	H+   <�SubEthaEdit.app                                                 &k!�Q��        ����  	                Life    ��:�      �Q��     <� 
v� 
J=  {�  =Macintosh HD:Users:pittenau:Applications:Life:SubEthaEdit.app      S u b E t h a E d i t . a p p    M a c i n t o s h   H D  0Users/pittenau/Applications/Life/SubEthaEdit.app  /    ��  �q  �p    l     �m�l�k�m  �l  �k    i   / 2 I      �j�i �j .0 extendedselectiontext extendedSelectionText�i    �h!"�h  0 extendingfront extendingFront! o      �g�g &0 shouldextendfront shouldExtendFront" �f#�e�f 0 extendingend extendingEnd# o      �d�d "0 shouldextendend shouldExtendEnd�e   k     7$$ %&% r     '(' I     �c�b)�c  0 selectionrange selectionRange�b  ) �a*+�a  0 extendingfront extendingFront* o    �`�` &0 shouldextendfront shouldExtendFront+ �_,�^�_ 0 extendingend extendingEnd, o   	 
�]�] "0 shouldextendend shouldExtendEnd�^  ( J    -- ./. o    �\�\ 0 	startchar 	startChar/ 0�[0 o    �Z�Z 0 nextchar nextChar�[  & 1�Y1 O    7232 e   % 644 c   % 6565 l  % 47�X�W7 n   % 4898 1   2 4�V
�V 
pTxt9 7 % 2�U:;
�U 
cha : o   * ,�T�T 0 	startchar 	startChar; l  - 1<�S�R< \   - 1=>= o   . /�Q�Q 0 nextchar nextChar> m   / 0�P�P �S  �R  �X  �W  6 m   4 5�O
�O 
ctxt3 l   "?�N�M? n    "@A@ 4   "�LB
�L 
docuB m     !�K�K A m    CC�                                                                                  Hdra   alis    �  Macintosh HD               ��W	H+   <�SubEthaEdit.app                                                 &k!�Q��        ����  	                Life    ��:�      �Q��     <� 
v� 
J=  {�  =Macintosh HD:Users:pittenau:Applications:Life:SubEthaEdit.app      S u b E t h a E d i t . a p p    M a c i n t o s h   H D  0Users/pittenau/Applications/Life/SubEthaEdit.app  /    ��  �N  �M  �Y   DED l     �J�I�H�J  �I  �H  E FGF i  3 6HIH I      �G�FJ�G "0 extendselection extendSelection�F  J �EKL�E  0 extendingfront extendingFrontK o      �D�D &0 shouldextendfront shouldExtendFrontL �CM�B�C 0 extendingend extendingEndM o      �A�A "0 shouldextendend shouldExtendEnd�B  I k     *NN OPO r     QRQ l     S�@�?S I     �>�=T�>  0 selectionrange selectionRange�=  T �<UV�<  0 extendingfront extendingFrontU o    �;�; &0 shouldextendfront shouldExtendFrontV �:W�9�: 0 extendingend extendingEndW o   	 
�8�8 "0 shouldextendend shouldExtendEnd�9  �@  �?  R J    XX YZY o    �7�7 0 	startchar 	startCharZ [�6[ o    �5�5 0 nextchar nextChar�6  P \�4\ I   *�3�2]�3 &0 setselectionrange setSelectionRange�2  ] �1^�0
�1 
to  ^ J     &__ `a` o     !�/�/ 0 	startchar 	startChara b�.b \   ! $cdc o   ! "�-�- 0 nextchar nextChard m   " #�,�, �.  �0  �4  G efe l     �+�*�)�+  �*  �)  f ghg l     �(ij�(  i * $ Manipulation of document properties   j �kk H   M a n i p u l a t i o n   o f   d o c u m e n t   p r o p e r t i e sh lml l     �'�&�%�'  �&  �%  m non i  7 :pqp I      �$�#r�$ "0 checksavestatus checkSaveStatus�#  r �"s�!�" 0 updating  s o      � �  0 
shouldsave 
shouldSave�!  q O     Dtut k    Cvv wxw Z    yz��y H    {{ l   |��| I   �}�
� .coredoexbool        obj } n    
~~ 1    
�
� 
ppth 4   ��
� 
docu� m    �� �  �  �  z R    ���
� .ascrerr ****      � ****� m    �� ��� F Y o u   h a v e   t o   s a v e   t h e   d o c u m e n t   f i r s t�  �  �  x ��� Z    C����� F    (��� o    �� 0 
shouldsave 
shouldSave� l   &���� n    &��� 1   # %�
� 
imod� 4   #��
� 
docu� m   ! "�� �  �  � Q   + ?���� I  . 6�
��	
�
 .coresavenull���     obj � 4  . 2��
� 
docu� m   0 1�� �	  � R      ���
� .ascrerr ****      � ****�  �  �  �  �  �  u m     ���                                                                                  Hdra   alis    �  Macintosh HD               ��W	H+   <�SubEthaEdit.app                                                 &k!�Q��        ����  	                Life    ��:�      �Q��     <� 
v� 
J=  {�  =Macintosh HD:Users:pittenau:Applications:Life:SubEthaEdit.app      S u b E t h a E d i t . a p p    M a c i n t o s h   H D  0Users/pittenau/Applications/Life/SubEthaEdit.app  /    ��  o ��� l     ����  �  �  � ��� i  ; >��� I      � �����  *0 requirenewlineateof requireNewlineAtEOF��  ��  � O     "��� Z    !������ =   ��� m    �� ���  � l   ������ n    ��� 1    ��
�� 
pTxt� l   ������ 4   ���
�� 
cpar� m   
 ��������  ��  ��  ��  � l   ������  � ( " final line terminated, do nothing   � ��� D   f i n a l   l i n e   t e r m i n a t e d ,   d o   n o t h i n g��  � r    !��� o    ��
�� 
ret � l     ������ n      ��� 1     ��
�� 
pTxt� l   ������ n    ��� 4   ���
�� 
cins� m    ������� l   ������ 4   ���
�� 
cpar� m    ��������  ��  ��  ��  ��  ��  � l    ������ n     ��� 4   ���
�� 
docu� m    ���� � m     ���                                                                                  Hdra   alis    �  Macintosh HD               ��W	H+   <�SubEthaEdit.app                                                 &k!�Q��        ����  	                Life    ��:�      �Q��     <� 
v� 
J=  {�  =Macintosh HD:Users:pittenau:Applications:Life:SubEthaEdit.app      S u b E t h a E d i t . a p p    M a c i n t o s h   H D  0Users/pittenau/Applications/Life/SubEthaEdit.app  /    ��  ��  ��  � ��� l     ��������  ��  ��  � ��� i   ? B��� I      �������� 0 documentpath documentPath��  ��  � O    ��� e    �� l   ������ n    ��� 1    
��
�� 
ppth� l   ������ 4   ���
�� 
docu� m    ���� ��  ��  ��  ��  � m     ���                                                                                  Hdra   alis    �  Macintosh HD               ��W	H+   <�SubEthaEdit.app                                                 &k!�Q��        ����  	                Life    ��:�      �Q��     <� 
v� 
J=  {�  =Macintosh HD:Users:pittenau:Applications:Life:SubEthaEdit.app      S u b E t h a E d i t . a p p    M a c i n t o s h   H D  0Users/pittenau/Applications/Life/SubEthaEdit.app  /    ��  � ��� l     ��������  ��  ��  � ��� i   C F��� I      �������� 0 documentline documentLine��  ��  � O    ��� e    �� l   ������ n    ��� 1   
 ��
�� 
pSln� n    
��� 1    
��
�� 
pSel� 4   ���
�� 
docu� m    ���� ��  ��  � m     ���                                                                                  Hdra   alis    �  Macintosh HD               ��W	H+   <�SubEthaEdit.app                                                 &k!�Q��        ����  	                Life    ��:�      �Q��     <� 
v� 
J=  {�  =Macintosh HD:Users:pittenau:Applications:Life:SubEthaEdit.app      S u b E t h a E d i t . a p p    M a c i n t o s h   H D  0Users/pittenau/Applications/Life/SubEthaEdit.app  /    ��  � ��� l     ��������  ��  ��  � ��� l     ������  �   String Utilities   � ��� "   S t r i n g   U t i l i t i e s� ��� l     ������  � G A $Id: StringTools.applescript,v 1.5 2008/02/17 08:56:05 mjb Exp $   � ��� �   $ I d :   S t r i n g T o o l s . a p p l e s c r i p t , v   1 . 5   2 0 0 8 / 0 2 / 1 7   0 8 : 5 6 : 0 5   m j b   E x p   $� ��� l     ��������  ��  ��  � ��� i   G J��� I      ������ 0 replacement  � o      ���� 0 olddelim oldDelim� ����
�� 
by  � o      ���� 0 newdelim newDelim� �����
�� 
for � o      ���� 0 sourcestring sourceString��  � L     �� I    ������ 0 join  � l    ������ I    ������ 
0 tokens  � o     ���� 0 sourcestring sourceString� �����
�� 
btwn� o    ���� 0 olddelim oldDelim��  ��  ��  � �����
�� 
by  � o    	���� 0 newdelim newDelim��  � ��� l     ��������  ��  ��  � ��� i   K N��� I      ������ 
0 tokens  � o      ���� 0 str  � �����
�� 
btwn� o      ���� 0 
delimiters  ��  � k         r      n      1    ��
�� 
txdl 1     ��
�� 
ascr o      ���� 0 oldtids oldTIDs  r    	
	 o    ���� 0 
delimiters  
 n       1    
��
�� 
txdl 1    ��
�� 
ascr  r     n     2   ��
�� 
citm o    ���� 0 str   o      ���� 0 strtoks    r     o    ���� 0 oldtids oldTIDs n       1    ��
�� 
txdl 1    ��
�� 
ascr �� L     o    ���� 0 strtoks  ��  �  l     ��������  ��  ��    i   O R  I      ��!"�� 0 join  ! o      ���� 0 	tokenlist 	tokenList" ��#��
�� 
by  # o      ���� 0 	delimiter  ��    k     $$ %&% r     '(' n     )*) 1    ��
�� 
txdl* 1     ��
�� 
ascr( o      ���� 0 oldtids oldTIDs& +,+ r    -.- o    ���� 0 	delimiter  . n      /0/ 1    
��
�� 
txdl0 1    ��
�� 
ascr, 121 r    343 c    565 o    ���� 0 	tokenlist 	tokenList6 m    ��
�� 
TEXT4 o      ���� 0 joinedstring joinedString2 787 r    9:9 o    ���� 0 oldtids oldTIDs: n      ;<; 1    ��
�� 
txdl< 1    ��
�� 
ascr8 =��= L    >> o    ���� 0 joinedstring joinedString��   ?@? l     ��������  ��  ��  @ ABA i   S VCDC I      ����E�� $0 doublequotedform doubleQuotedForm��  E ��F�
�� 
for F o      �~�~ 0 
basestring 
baseString�  D b     GHG b     IJI 1     �}
�} 
quotJ o    �|�| 0 
basestring 
baseStringH 1    �{
�{ 
quotB KLK l     �z�y�x�z  �y  �x  L MNM i   W ZOPO I      �wQR�w  0 shelltransform shellTransformQ o      �v�v 0 intext inTextR �uST
�u 
for S o      �t�t 0 	envstring 	envStringT �sUV
�s 
thruU o      �r�r 0 pipeline  V �qW�p�q *0 alteringlineendings alteringLineEndingsW o      �o�o 0 altends altEnds�p  P k     GXX YZY r     [\[ I    �n]^�n 0 join  ] J     __ `a` o     �m�m 0 	envstring 	envStringa bcb m    dd �ee  p b p a s t ec fgf m    hh �ii  |g j�lj o    �k�k 0 pipeline  �l  ^ �jk�i
�j 
by  k 1    �h
�h 
spac�i  \ o      �g�g 0 shellscript  Z lml r    non I   �f�e�d
�f .JonsgClp****    ��� null�e  �d  o l     p�c�bp o      �a�a 0 oldclipboard oldClipboard�c  �b  m qrq I   �`s�_
�` .JonspClpnull���     ****s l   t�^�]t o    �\�\ 0 intext inText�^  �]  �_  r uvu Q    ?wxyw r     )z{z I    '�[|}
�[ .sysoexecTEXT���     TEXT| o     !�Z�Z 0 shellscript  } �Y~�X
�Y 
alen~ o   " #�W�W 0 altends altEnds�X  { o      �V�V 0 shellresponse  x R      �U�
�U .ascrerr ****      � **** o      �T�T 0 errmsg errMsg� �S��
�S 
errn� o      �R�R 0 errnum errNum� �Q��P
�Q 
erob� o      �O�O 0 	badobject 	badObject�P  y k   1 ?�� ��� I  1 6�N��M
�N .JonspClpnull���     ****� l  1 2��L�K� o   1 2�J�J 0 oldclipboard oldClipboard�L  �K  �M  � ��I� R   7 ?�H��
�H .ascrerr ****      � ****� o   = >�G�G 0 errmsg errMsg� �F��
�F 
errn� o   9 :�E�E 0 errnum errNum� �D��C
�D 
erob� o   ; <�B�B 0 	badobject 	badObject�C  �I  v ��� I  @ E�A��@
�A .JonspClpnull���     ****� l  @ A��?�>� o   @ A�=�= 0 oldclipboard oldClipboard�?  �>  �@  � ��<� o   F G�;�; 0 shellresponse  �<  N ��� l     �:�9�8�:  �9  �8  � ��� l     �7���7  � : 4 Handling of environment settings using a plist file   � ��� h   H a n d l i n g   o f   e n v i r o n m e n t   s e t t i n g s   u s i n g   a   p l i s t   f i l e� ��� l     �6���6  � L F $Id: EnvironmentPlist.applescript,v 1.1 2008/01/03 16:49:41 mjb Exp $   � ��� �   $ I d :   E n v i r o n m e n t P l i s t . a p p l e s c r i p t , v   1 . 1   2 0 0 8 / 0 1 / 0 3   1 6 : 4 9 : 4 1   m j b   E x p   $� ��� l     �5�4�3�5  �4  �3  � ��� i  [ ^��� I      �2�1��2 20 writedefaultenvironment writeDefaultEnvironment�1  � �0��/
�0 
at  � o      �.�. 0 envpath envPath�/  � k     6�� ��� r     ��� I    �-�,�+
�- .JonsgClp****    ��� null�,  �+  � o      �*�*  0 savedclipboard savedClipboard� ��� I   �)��(
�) .JonspClpnull���     ****� m    	�� ���z < ? x m l   v e r s i o n = " 1 . 0 "   e n c o d i n g = " U T F - 8 " ? > 
 < ! D O C T Y P E   p l i s t   P U B L I C   " - / / A p p l e   C o m p u t e r / / D T D   P L I S T   1 . 0 / / E N "   " h t t p : / / w w w . a p p l e . c o m / D T D s / P r o p e r t y L i s t - 1 . 0 . d t d " > 
 < p l i s t   v e r s i o n = " 1 . 0 " > 
 < d i c t / > 
 < / p l i s t >�(  � ��� Q    0���� I   �'��&
�' .sysoexecTEXT���     TEXT� b    ��� m    �� ���  p b p a s t e   >  � l   ��%�$� n    ��� 1    �#
�# 
psxp� o    �"�" 0 envpath envPath�%  �$  �&  � R      �!��
�! .ascrerr ****      � ****� o      � �  0 errmsg errMsg� ���
� 
errn� o      �� 0 errnum errNum� ���
� 
erob� o      �� 0 	badobject 	badObject�  � k   " 0�� ��� I  " '���
� .JonspClpnull���     ****� l  " #���� o   " #��  0 savedclipboard savedClipboard�  �  �  � ��� R   ( 0���
� .ascrerr ****      � ****� o   . /�� 0 errmsg errMsg� ���
� 
errn� o   * +�� 0 errnum errNum� ���
� 
erob� o   , -�� 0 	badobject 	badObject�  �  � ��� I  1 6���
� .JonspClpnull���     ****� l  1 2��
�	� o   1 2��  0 savedclipboard savedClipboard�
  �	  �  �  � ��� l     ����  �  �  � ��� i  _ b��� I      ���� "0 openenvironment openEnvironment�  � ���
� 
at  � o      �� 0 envfilepath envFilePath� � ����  60 settingdefaultenvironment settingDefaultEnvironment� o      ���� $0 shouldsetdefault shouldSetDefault��  � O     8��� k    7�� ��� Z    .������� H    �� l   ������ I   �����
�� .coredoexbool        obj � 4    ���
�� 
file� o    ���� 0 envfilepath envFilePath��  ��  ��  � Z    *������ o    ���� $0 shouldsetdefault shouldSetDefault� I   ������ 20 writedefaultenvironment writeDefaultEnvironment�  f    � �����
�� 
at  � o    ���� 0 envfilepath envFilePath��  ��  � R    *����
�� .ascrerr ****      � ****� l  " )������ b   " )��� b   " '��� b   " %��� m   " #�� ��� 6 C a n ' t   g e t   e n v i r o n m e n t   f i l e  � 1   # $��
�� 
quot� o   % &���� 0 envfilepath envFilePath� 1   ' (��
�� 
quot��  ��  � �����
�� 
errn� m     !�����@��  ��  ��  � ���� I  / 7�����
�� .aevtodocnull  �    alis� 4   / 3���
�� 
file� o   1 2���� 0 envfilepath envFilePath��  ��  � m     ���                                                                                  sevs   alis    �  Macintosh HD               ��W	H+     tSystem Events.app                                                ���f�W        ����  	                CoreServices    ��:�      �f�7       t   0   /  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� l     ��������  ��  ��  � � � i  c f I      ������ "0 readenvironment readEnvironment��   ����
�� 
outo o      ���� 	0 plist  ��   k       I    ������ 0 readlistpair readListPair��   ��	��
�� 
outo	 o    ���� 	0 plist  ��   
��
 I   ������ &0 environmentstring environmentString��   ����
�� 
from 1   
 ��
�� 
rslt��  ��     l     ��������  ��  ��    i  g j I      ������ 0 readlistpair readListPair��   ����
�� 
outo o      ���� 	0 plist  ��   O     0 Z    /�� I   ����
�� .coredoexbool        obj  4    ��
�� 
file o    ���� 	0 plist  ��   O    & e    % n    %  J    $!! "#" 1    ��
�� 
pnam# $��$ 1     ��
�� 
valL��    2    ��
�� 
plii 4    ��%
�� 
plif% o    ���� 	0 plist  ��   J   ) /&& '(' J   ) +����  ( )��) J   + -����  ��   m     **�                                                                                  sevs   alis    �  Macintosh HD               ��W	H+     tSystem Events.app                                                ���f�W        ����  	                CoreServices    ��:�      �f�7       t   0   /  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   +,+ l     ��������  ��  ��  , -.- i   k n/0/ I      ����1�� &0 environmentstring environmentString��  1 ��2��
�� 
from2 o      ���� $0 keyvaluelistpair keyValueListPair��  0 k     h33 454 r     676 o     ���� $0 keyvaluelistpair keyValueListPair7 J      88 9:9 o      ���� 0 	plistkeys 	plistKeys: ;��; o      ���� 0 plistvalues plistValues��  5 <=< r    >?> J    ����  ? o      ���� 0 accumulator  = @A@ r    BCB n    DED 1    ��
�� 
txdlE 1    ��
�� 
ascrC o      ���� 0 oldtids oldTIDsA FGF r    !HIH m    JJ �KK  I n      LML 1     ��
�� 
txdlM 1    ��
�� 
ascrG NON Y   " TP��QR��P k   1 OSS TUT r   1 DVWV J   1 >XX YZY m   1 2[[ �\\  e x p o r t  Z ]^] n   2 6_`_ 4   3 6��a
�� 
cobja o   4 5���� 0 i  ` o   2 3���� 0 	plistkeys 	plistKeys^ bcb m   6 7dd �ee  =c fgf n   7 ;hih 4   8 ;��j
�� 
cobjj o   9 :���� 0 i  i o   7 8���� 0 plistvalues plistValuesg k��k m   ; <ll �mm  ;��  W o      ���� 
0 tokens  U n��n s   E Oopo l  E Lq����q c   E Lrsr o   E J���� 
0 tokens  s m   J K��
�� 
TEXT��  ��  p l     t����t n      uvu  ;   M Nv l  L Mw����w o   L M���� 0 accumulator  ��  ��  ��  ��  ��  �� 0 i  Q m   % &���� R n   & ,xyx m   ) +��
�� 
nmbry n  & )z{z 2  ' )��
�� 
cobj{ o   & '���� 0 	plistkeys 	plistKeys��  O |}| r   U Z~~ 1   U V��
�� 
spac n     ��� 1   W Y��
�� 
txdl� 1   V W��
�� 
ascr} ��� r   [ `��� c   [ ^��� o   [ \���� 0 accumulator  � m   \ ]��
�� 
TEXT� o      ���� 0 	envstring 	envString� ��� r   a f��� o   a b���� 0 oldtids oldTIDs� n     ��� 1   c e��
�� 
txdl� 1   b c��
�� 
ascr� ���� o   g h���� 0 	envstring 	envString��  . ��� l     ��������  ��  ��  � ��� l     ��~�}�  �~  �}  � ��|� l     �{�z�y�{  �z  �y  �|       �x� �����������������������������x  � �w�v�u�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�w (0 defaultenvironment defaultEnvironment�v &0 selectbycomparing selectByComparing�u 0 seescriptsettings  �t "0 modeenvironment modeEnvironment�s 0 moderesources modeResources�r 20 openenvironmentsettings openEnvironmentSettings�q *0 environmentfilepath environmentFilePath�p .0 completeselectedlines completeSelectedLines�o 0 selectiontext selectionText�n $0 setselectiontext setSelectionText�m  0 selectionrange selectionRange�l &0 setselectionrange setSelectionRange�k .0 extendedselectiontext extendedSelectionText�j "0 extendselection extendSelection�i "0 checksavestatus checkSaveStatus�h *0 requirenewlineateof requireNewlineAtEOF�g 0 documentpath documentPath�f 0 documentline documentLine�e 0 replacement  �d 
0 tokens  �c 0 join  �b $0 doublequotedform doubleQuotedForm�a  0 shelltransform shellTransform�` 20 writedefaultenvironment writeDefaultEnvironment�_ "0 openenvironment openEnvironment�^ "0 readenvironment readEnvironment�] 0 readlistpair readListPair�\ &0 environmentstring environmentString
�[ .aevtoappnull  �   � ****� �Z ��Y�X���W�Z &0 selectbycomparing selectByComparing�Y �V��V �  �U�T�S�R�U 0 val1  �T 0 val2  �S 0 sameval sameVal�R 0 diffval diffVal�X  � �Q�P�O�N�Q 0 val1  �P 0 val2  �O 0 sameval sameVal�N 0 diffval diffVal�  �W ��  �Y �� �M ��L�K���J�M 0 seescriptsettings  �L  �K  �  � �I ��H ��G ��F�I 0 displayname displayName�H $0 keyboardshortcut keyboardShortcut�G 0 incontextmenu inContextMenu�F �J 	�������� �E�D�C���B�E "0 modeenvironment modeEnvironment�D  �C  �  � �A�@�?'�>�=�<�;�:-�9
�A 
for �@ 0 moderesources modeResources�? $0 doublequotedform doubleQuotedForm
�> 
outo�= *0 environmentfilepath environmentFilePath�< "0 readenvironment readEnvironment�; 
�: 
by  �9 0 join  �B "��*�*j+ l �*�*j+ l �v��l � �84�7�6���5�8 0 moderesources modeResources�7  �6  �  � @�4�3�2
�4 
docu
�3 
Mode
�2 
pMrp�5 � *�k/�,�,EU� �1F�0�/���.�1 20 openenvironmentsettings openEnvironmentSettings�0  �/  �  � �-�,�+�*�)
�- 
at  �, *0 environmentfilepath environmentFilePath�+ 60 settingdefaultenvironment settingDefaultEnvironment�* �) "0 openenvironment openEnvironment�. *�*j+ �e� � �(P�'�&���%�( *0 environmentfilepath environmentFilePath�'  �&  � �$�$ 0 modename modeName� _�#�"�!� ������mr�u�
�# 
docu
�" 
Mode
�! 
pnam
�  afdrpref
� 
from
� fldmfldu
� 
rtyp
� 
TEXT� 
� .earsffdralis        afdr
� 
by  � 0 join  �% %� *�k/�,�,E�UO������ 
���v��l � �������� .0 completeselectedlines completeSelectedLines�  �  �  � �����  0 extendingfront extendingFront� 0 extendingend extendingEnd� � "0 extendselection extendSelection� 
*�e�e� � �������� 0 selectiontext selectionText�  �  �  � ���
�	
� 
docu
�
 
pSel
�	 
pTxt� ��k/ *�,�,EU� �������� $0 setselectiontext setSelectionText�  � ���
� 
to  � 0 newtext newText�  � �� 0 newtext newText� �� ����
�  
docu
�� 
pSel
�� 
pTxt� � �*�k/�,�,FU� �������������  0 selectionrange selectionRange��  �� �������  0 extendingfront extendingFront�� &0 shouldextendfront shouldExtendFront� �������� 0 extendingend extendingEnd�� "0 shouldextendend shouldExtendEnd��  � ������ &0 shouldextendfront shouldExtendFront�� "0 shouldextendend shouldExtendEnd� ������������
�� 
docu
�� 
bool
�� 
pSel
�� 
cpar
�� 
pIdS
�� 
pIdN�� h��k/ a�	 ��& *�,�k/�,E*�,�i/�,ElvY @� *�,�k/�,E*�,�,ElvY (� *�,�,E*�,�i/�,ElvY *�,�,E*�,�,ElvU� ������������ &0 setselectionrange setSelectionRange��  �� ������
�� 
to  �� 0 newrange newRange��  � ���� 0 newrange newRange� ����
�� 
docu
�� 
pSel�� ��k/ �*�,FU� ������������ .0 extendedselectiontext extendedSelectionText��  �� �������  0 extendingfront extendingFront�� &0 shouldextendfront shouldExtendFront� �������� 0 extendingend extendingEnd�� "0 shouldextendend shouldExtendEnd��  � ���������� &0 shouldextendfront shouldExtendFront�� "0 shouldextendend shouldExtendEnd�� 0 	startchar 	startChar�� 0 nextchar nextChar� ����������������C��������
�� 
Krtn�� 0 	startchar 	startChar�� 0 nextchar nextChar��  0 extendingfront extendingFront�� 0 extendingend extendingEnd�� ��  0 selectionrange selectionRange
�� 
cobj
�� 
docu
�� 
cha 
�� 
pTxt
�� 
ctxt�� 8*���lv��� E[�k/E�Z[�l/E�ZO��k/ *[�\[Z�\Z�k2�,�&U� ��I���������� "0 extendselection extendSelection��  �� �������  0 extendingfront extendingFront�� &0 shouldextendfront shouldExtendFront� �������� 0 extendingend extendingEnd�� "0 shouldextendend shouldExtendEnd��  � ���������� &0 shouldextendfront shouldExtendFront�� "0 shouldextendend shouldExtendEnd�� 0 	startchar 	startChar�� 0 nextchar nextChar� 
��������������������
�� 
Krtn�� 0 	startchar 	startChar�� 0 nextchar nextChar��  0 extendingfront extendingFront�� 0 extendingend extendingEnd�� ��  0 selectionrange selectionRange
�� 
cobj
�� 
to  �� &0 setselectionrange setSelectionRange�� +*���lv��� E[�k/E�Z[�l/E�ZO*袣klvl 	� ��q���������� "0 checksavestatus checkSaveStatus��  �� �������� 0 updating  �� 0 
shouldsave 
shouldSave��  � ���� 0 
shouldsave 
shouldSave� 
������������������
�� 
docu
�� 
ppth
�� .coredoexbool        obj 
�� 
imod
�� 
bool
�� .coresavenull���     obj ��  ��  �� E� A*�k/�,j  	)j�Y hO�	 *�k/�,E�&  *�k/j W X  	hY hU� ������������� *0 requirenewlineateof requireNewlineAtEOF��  ��  �  � ������������
�� 
docu
�� 
cpar
�� 
pTxt
�� 
ret 
�� 
cins�� #��k/ �*�i/�,  hY �*�i/�i/�,FU� ������������� 0 documentpath documentPath��  ��  �  � �����
�� 
docu
�� 
ppth�� � 	*�k/�,EU� ������������� 0 documentline documentLine��  ��  �  � �������
�� 
docu
�� 
pSel
�� 
pSln�� � *�k/�,�,EU� ������������� 0 replacement  �� 0 olddelim oldDelim�� �����
�� 
by  �� 0 newdelim newDelim� ������
�� 
for �� 0 sourcestring sourceString��  � �������� 0 olddelim oldDelim�� 0 newdelim newDelim�� 0 sourcestring sourceString� ����~�}
�� 
btwn� 
0 tokens  
�~ 
by  �} 0 join  �� ��l �l � �|��{�z���y�| 
0 tokens  �{ 0 str  �z �x�w�v
�x 
btwn�w 0 
delimiters  �v  � �u�t�s�r�u 0 str  �t 0 
delimiters  �s 0 oldtids oldTIDs�r 0 strtoks  � �q�p�o
�q 
ascr
�p 
txdl
�o 
citm�y ��,E�O���,FO��-E�O���,FO�� �n �m�l���k�n 0 join  �m 0 	tokenlist 	tokenList�l �j�i�h
�j 
by  �i 0 	delimiter  �h  � �g�f�e�d�g 0 	tokenlist 	tokenList�f 0 	delimiter  �e 0 oldtids oldTIDs�d 0 joinedstring joinedString� �c�b�a
�c 
ascr
�b 
txdl
�a 
TEXT�k ��,E�O���,FO��&E�O���,FO�� �`D�_�^���]�` $0 doublequotedform doubleQuotedForm�_  �^ �\�[�Z
�\ 
for �[ 0 
basestring 
baseString�Z  � �Y�Y 0 
basestring 
baseString� �X
�X 
quot�] ��%�%� �WP�V�U���T�W  0 shelltransform shellTransform�V 0 intext inText�U �S�R�
�S 
for �R 0 	envstring 	envString� �Q�P�
�Q 
thru�P 0 pipeline  � �O�N�M�O *0 alteringlineendings alteringLineEndings�N 0 altends altEnds�M  � 
�L�K�J�I�H�G�F�E�D�C�L 0 intext inText�K 0 	envstring 	envString�J 0 pipeline  �I 0 altends altEnds�H 0 shellscript  �G 0 oldclipboard oldClipboard�F 0 shellresponse  �E 0 errmsg errMsg�D 0 errnum errNum�C 0 	badobject 	badObject� dh�B�A�@�?�>�=�<�;�:��9�8�B 
�A 
by  
�@ 
spac�? 0 join  
�> .JonsgClp****    ��� null
�= .JonspClpnull���     ****
�< 
alen
�; .sysoexecTEXT���     TEXT�: 0 errmsg errMsg� �7�6�
�7 
errn�6 0 errnum errNum� �5�4�3
�5 
erob�4 0 	badobject 	badObject�3  
�9 
errn
�8 
erob�T H����v��l E�O*j E�O�j O ��l 	E�W X 
 �j O)����O�j O�� �2��1�0���/�2 20 writedefaultenvironment writeDefaultEnvironment�1  �0 �.�-�,
�. 
at  �- 0 envpath envPath�,  � �+�*�)�(�'�+ 0 envpath envPath�*  0 savedclipboard savedClipboard�) 0 errmsg errMsg�( 0 errnum errNum�' 0 	badobject 	badObject� �&��%��$�#�"��!� �
�& .JonsgClp****    ��� null
�% .JonspClpnull���     ****
�$ 
psxp
�# .sysoexecTEXT���     TEXT�" 0 errmsg errMsg� ���
� 
errn� 0 errnum errNum� ���
� 
erob� 0 	badobject 	badObject�  
�! 
errn
�  
erob� �/ 7*j  E�O�j O ��,%j W X  �j O)���O�j � �������� "0 openenvironment openEnvironment�  � ���
� 
at  � 0 envfilepath envFilePath� ���� 60 settingdefaultenvironment settingDefaultEnvironment� $0 shouldsetdefault shouldSetDefault�  � ��� 0 envfilepath envFilePath� $0 shouldsetdefault shouldSetDefault� 
������
�	���
� 
file
� .coredoexbool        obj 
� 
at  � 20 writedefaultenvironment writeDefaultEnvironment
�
 
errn�	�@
� 
quot
� .aevtodocnull  �    alis� 9� 5*�/j  � )�l Y )��l��%�%�%Y hO*�/j 	U� ������� "0 readenvironment readEnvironment�  � ��� 
� 
outo� 	0 plist  �   � ���� 	0 plist  � ����������
�� 
outo�� 0 readlistpair readListPair
�� 
from
�� 
rslt�� &0 environmentstring environmentString� *�l O*��l � ������������ 0 readlistpair readListPair��  �� ������
�� 
outo�� 	0 plist  ��  � ���� 	0 plist  � *������������
�� 
file
�� .coredoexbool        obj 
�� 
plif
�� 
plii
�� 
pnam
�� 
valL�� 1� -*�/j  *�/ *�-[�,\[�,\ZlvEUY jvjvlvU� ��0���������� &0 environmentstring environmentString��  �� ������
�� 
from�� $0 keyvaluelistpair keyValueListPair��  � ���������������� $0 keyvaluelistpair keyValueListPair�� 0 	plistkeys 	plistKeys�� 0 plistvalues plistValues�� 0 accumulator  �� 0 oldtids oldTIDs�� 0 i  �� 0 	envstring 	envString� ������J��[dl������
�� 
cobj
�� 
ascr
�� 
txdl
�� 
nmbr�� 
�� 
TEXT
�� 
spac�� i�E[�k/E�Z[�l/E�ZOjvE�O��,E�O���,FO 1k��-�,Ekh ��/��/��vEc  Ob  �&�6G[OY��O���,FO��&E�O���,FO�� �����������
�� .aevtoappnull  �   � ****� k    ��  ��  0��  7��  >��  J��  X��  i��  z��  ���  �    �  �����  ��  ��  �  � . "�� &���������������������������������� d g���� u x�� � ��� � ����� ����� � � �����������
�� 
appr
�� 
dtxt�� 
�� .sysodlogaskr        TEXT��   ������
�� 
errn������  
�� 
rslt
�� 
ttxt�� 0 envname envName
�� 
Krtn�� 0 startselected startSelected�� 0 nextselected nextSelected��  0 extendingfront extendingFront�� 0 extendingend extendingEnd�� ��  0 selectionrange selectionRange
�� 
cobj�� 0 startextended startExtended�� 0 nextextended nextExtended�� &0 selectbycomparing selectByComparing�� 
0 prefix  �� 
0 suffix  �� 
0 indent  �� 0 selectiontext selectionText
�� 
by  �� 0 join  �� "0 beforeinsertion beforeInsertion��  0 afterinsertion afterInsertion
�� 
to  �� $0 setselectiontext setSelectionText
�� .corecnte****       ****�� &0 setselectionrange setSelectionRange�� ����b   � W 	X  hO��,E�O�Ec   O*���lv�f�fa  E[a k/E�Z[a l/E�ZO*�a a lv�e�ea  E[a k/E` Z[a l/E` ZO*�_ a a �+ E` O*�_ a a �+ E` O*��a a �+ E` O_ a �a  _ *j+ !a va "a #l $E` %O_ a &�a '�va "a (l $E` )O*a *_ %_ )%l +O*a *�_ %j ,k_ j ,l -ascr  ��ޭ