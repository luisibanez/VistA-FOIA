DINIT0F0 ;SFISC/MKO-DATA FOR FORM AND BLOCK FILES ;10:49 AM  30 Mar 1999
 ;;22.0;VA FileMan;;Mar 30, 1999
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 D PRE^DINIT29P
 F I=1:2 S X=$T(ENTRY+I) G:X="" ^DINIT0F1 S Y=$E($T(ENTRY+I+1),5,999),X=$E(X,4,999),@X=Y
 Q
ENTRY ;
 ;;^DIST(.403,.001,0)
 ;;=DICATT^@^@^^2981031.1257^2990319.1306^^1^0^1^1
 ;;^DIST(.403,.001,1)
 ;;=2000000
 ;;^DIST(.403,.001,3)
 ;;=3000000
 ;;^DIST(.403,.001,4)
 ;;=N
 ;;^DIST(.403,.001,5)
 ;;=Y
 ;;^DIST(.403,.001,6)
 ;;=N
 ;;^DIST(.403,.001,7)
 ;;=N
 ;;^DIST(.403,.001,15,0)
 ;;=^^36^36^2981214
 ;;^DIST(.403,.001,15,1,0)
 ;;=Pages: 1          Main form
 ;;^DIST(.403,.001,15,2,0)
 ;;=       1.1, 1.2   DESCRIPTION and TECHNICAL DESCRIPTION  text
 ;;^DIST(.403,.001,15,3,0)
 ;;=       2.1-2.8    TYPE-specific   (2.1=DATE, etc)
 ;;^DIST(.403,.001,15,4,0)
 ;;=       3          SUBSCRIPT & PIECE-position
 ;;^DIST(.403,.001,15,5,0)
 ;;=       4          SUBSCRIPT & SUB-DICTIONARY NUMBER
 ;;^DIST(.403,.001,15,6,0)
 ;;=       5          Multiples
 ;;^DIST(.403,.001,15,7,0)
 ;;=       6          SCREEN for Pointers & Sets
 ;;^DIST(.403,.001,15,8,0)
 ;;=       8          VARIABLE-POINTER extra fields for each pointer
 ;;^DIST(.403,.001,15,9,0)
 ;;=       9          "ARE YOU SURE YOU WANT TO DELETE THE ENTIRE FIELD?"
 ;;^DIST(.403,.001,15,10,0)
 ;;=      10          Multiple-field
 ;;^DIST(.403,.001,15,11,0)
 ;;=                                                 
 ;;^DIST(.403,.001,15,12,0)
 ;;= 
 ;;^DIST(.403,.001,15,13,0)
 ;;= 
 ;;^DIST(.403,.001,15,14,0)
 ;;=Branching logic:
 ;;^DIST(.403,.001,15,15,0)
 ;;=              From Field 20.5 ("MULTIPLE?")
 ;;^DIST(.403,.001,15,16,0)
 ;;=       IS THIS FIELD NEW AND IS THE USER A PROGRAMMER?
 ;;^DIST(.403,.001,15,17,0)
 ;;=          |                                      |
 ;;^DIST(.403,.001,15,18,0)
 ;;=         NO                                     YES
 ;;^DIST(.403,.001,15,19,0)
 ;;=          |                                      |
 ;;^DIST(.403,.001,15,20,0)
 ;;=          |                               IS FIELD MULTIPLE?
 ;;^DIST(.403,.001,15,21,0)
 ;;=          |                                |              |
 ;;^DIST(.403,.001,15,22,0)
 ;;=          |                               YES            NO
 ;;^DIST(.403,.001,15,23,0)
 ;;=          |                                |              |
 ;;^DIST(.403,.001,15,24,0)
 ;;=IS FIELD EDITABLE & MULTIPLE?              |              |
 ;;^DIST(.403,.001,15,25,0)
 ;;=   |                    |                  |              |
 ;;^DIST(.403,.001,15,26,0)
 ;;=   |                   YES  --------->  Page 5         Page 3
 ;;^DIST(.403,.001,15,27,0)
 ;;=   |                                       |              |
 ;;^DIST(.403,.001,15,28,0)
 ;;=   |                                 PROGRAMMER?          |
 ;;^DIST(.403,.001,15,29,0)
 ;;=   |                                  |        |          |
 ;;^DIST(.403,.001,15,30,0)
 ;;=   |                                 YES      NO          |
 ;;^DIST(.403,.001,15,31,0)
 ;;=   |                                  |        |          |
 ;;^DIST(.403,.001,15,32,0)
 ;;=   |                                Page 4     |          | 
 ;;^DIST(.403,.001,15,33,0)
 ;;=   |                                  |        |          |
 ;;^DIST(.403,.001,15,34,0)
 ;;=    --------------------------------->|<------------------
 ;;^DIST(.403,.001,15,35,0)
 ;;=                                      |
 ;;^DIST(.403,.001,15,36,0)
 ;;=                           Field 98 (HELP-PROMPT)
 ;;^DIST(.403,.001,20)
 ;;=D POST^DICATTDE
 ;;^DIST(.403,.001,40,0)
 ;;=^.4031I^21^18
 ;;^DIST(.403,.001,40,1,0)
 ;;=1^^1,1
 ;;^DIST(.403,.001,40,1,1)
 ;;=Page 1
 ;;^DIST(.403,.001,40,1,40,0)
 ;;=^.4032IP^.00101^1
 ;;^DIST(.403,.001,40,1,40,.00101,0)
 ;;=.00101^1^1,1^e
 ;;^DIST(.403,.001,40,1,40,.00101,11)
 ;;=D PRE^DICATTD
 ;;^DIST(.403,.001,40,2,0)
 ;;=2.1^^4,3^^^1^12,70
 ;;^DIST(.403,.001,40,2,1)
 ;;=Page 2.1
 ;;^DIST(.403,.001,40,2,12)
 ;;=D POST1^DICATTD1
 ;;^DIST(.403,.001,40,2,40,0)
 ;;=^.4032IP^.00102^1
 ;;^DIST(.403,.001,40,2,40,.00102,0)
 ;;=.00102^1^2,3^e
 ;;^DIST(.403,.001,40,3,0)
 ;;=2.2^^4,3^^^1^9,70
 ;;^DIST(.403,.001,40,3,1)
 ;;=Page 2.2
 ;;^DIST(.403,.001,40,3,12)
 ;;=D POST2^DICATTD2
 ;;^DIST(.403,.001,40,3,40,0)
 ;;=^.4032IP^.00103^1
 ;;^DIST(.403,.001,40,3,40,.00103,0)
 ;;=.00103^1^2,3^e
 ;;^DIST(.403,.001,40,6,0)
 ;;=2.4^^3,8^^^1^7,67
 ;;^DIST(.403,.001,40,6,1)
 ;;=Page 2.4
 ;;^DIST(.403,.001,40,6,12)
 ;;=D POST4^DICATTD4
 ;;^DIST(.403,.001,40,6,40,0)
 ;;=^.4032IP^.00104^1
 ;;^DIST(.403,.001,40,6,40,.00104,0)
 ;;=.00104^1^1,1^e
 ;;^DIST(.403,.001,40,7,0)
 ;;=2.5^^4,6^^^1^6,75
 ;;^DIST(.403,.001,40,7,1)
 ;;=Page 2.5
 ;;^DIST(.403,.001,40,7,40,0)
 ;;=^.4032IP^.00105^1
 ;;^DIST(.403,.001,40,7,40,.00105,0)
 ;;=.00105^1^1,1^e
 ;;^DIST(.403,.001,40,8,0)
 ;;=2.6^^3,2^^^1^11,77
 ;;^DIST(.403,.001,40,8,1)
 ;;=Page 2.6
 ;;^DIST(.403,.001,40,8,12)
 ;;=D POST6^DICATTD6
 ;;^DIST(.403,.001,40,8,40,0)
 ;;=^.4032IP^.00106^1
 ;;^DIST(.403,.001,40,8,40,.00106,0)
 ;;=.00106^1^1,1^e
 ;;^DIST(.403,.001,40,9,0)
 ;;=2.7^^3,2^^^1^8,75
 ;;^DIST(.403,.001,40,9,1)
 ;;=Page 2.7
 ;;^DIST(.403,.001,40,9,12)
 ;;=D POST7^DICATTD7
 ;;^DIST(.403,.001,40,9,40,0)
 ;;=^.4032IP^.00107^1
 ;;^DIST(.403,.001,40,9,40,.00107,0)
 ;;=.00107^1^1,1^e
 ;;^DIST(.403,.001,40,10,0)
 ;;=2.8^^3,3^^^1^11,77
 ;;^DIST(.403,.001,40,10,1)
 ;;=Page 2.8
 ;;^DIST(.403,.001,40,10,40,0)
 ;;=^.4032IP^.00108^1
 ;;^DIST(.403,.001,40,10,40,.00108,0)
 ;;=.00108^1^1,1^e
 ;;^DIST(.403,.001,40,11,0)
 ;;=2.3^^3,6^^^1^17,70
 ;;^DIST(.403,.001,40,11,1)
 ;;=Page 2.3
 ;;^DIST(.403,.001,40,11,12)
 ;;=D POST3^DICATTD3
 ;;^DIST(.403,.001,40,11,40,0)
 ;;=^.4032IP^.00109^1
 ;;^DIST(.403,.001,40,11,40,.00109,0)
 ;;=.00109^1^1,1^e
 ;;^DIST(.403,.001,40,12,0)
 ;;=1.1^^1,1^^1
 ;;^DIST(.403,.001,40,12,1)
 ;;=Page 1.1
 ;;^DIST(.403,.001,40,12,40,0)
 ;;=^.4032IP^.0011^1
 ;;^DIST(.403,.001,40,12,40,.0011,0)
 ;;=.0011^1^1,1^e
 ;;^DIST(.403,.001,40,12,40,.0011,11)
 ;;=D WORD^DICATTD0(21)
 ;;^DIST(.403,.001,40,13,0)
 ;;=1.2^^1,1
 ;;^DIST(.403,.001,40,13,1)
 ;;=Page 1.2
 ;;^DIST(.403,.001,40,13,40,0)
 ;;=^.4032IP^.00111^1
 ;;^DIST(.403,.001,40,13,40,.00111,0)
 ;;=.00111^1^1,1^e
 ;;^DIST(.403,.001,40,15,0)
 ;;=3^^4,8^^^1^7,64
 ;;^DIST(.403,.001,40,15,1)
 ;;=Page 3
 ;;^DIST(.403,.001,40,15,12)
 ;;=D POST^DICATTDM
 ;;^DIST(.403,.001,40,15,40,0)
 ;;=^.4032IP^.00112^1
 ;;^DIST(.403,.001,40,15,40,.00112,0)
 ;;=.00112^1^2,2^e
 ;;^DIST(.403,.001,40,16,0)
 ;;=9^^3,10^^^1^7,70
 ;;^DIST(.403,.001,40,16,1)
 ;;=Page 9
 ;;^DIST(.403,.001,40,16,40,0)
 ;;=^.4032IP^.00113^1
 ;;^DIST(.403,.001,40,16,40,.00113,0)
 ;;=.00113^1^1,1^e
 ;;^DIST(.403,.001,40,17,0)
 ;;=4^^9,5^^^1^12,75
 ;;^DIST(.403,.001,40,17,1)
 ;;=Page 4
 ;;^DIST(.403,.001,40,17,40,0)
 ;;=^.4032IP^.00114^1
 ;;^DIST(.403,.001,40,17,40,.00114,0)
 ;;=.00114^1^1,1^e
