FOO ;NEW PROGRAM [ 01/10/2002  12:16 PM ]
  
 S X=0
 S Y=0
 S BNUM=3000112
 S COUNT=0
 
 F  S X=$O(^AUPNVSIT("APCIS",X)) Q:X=""  D  
 . F  S Y=$O(^AUPNVSIT("APCIS",X,Y)) Q:Y=""  D 
 . . I X<BNUM K ^AUPNVSIT("APCIS",X,Y) S COUNT=COUNT+1 Q
 . . Q
 W COUNT
 Q
 
