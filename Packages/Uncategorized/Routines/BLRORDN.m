BLRORDN ;SLC/CJS/TPF - DETERMINE NEXT LRORDER NUMBER ; 6/2/86  8:33 AM ; [ 08/01/2002  8:21 AM ]
 ;;5.2;LR;**1013**;JUL 30, 2002
 ;
 ;;5.2;LAB SERVICE;;Sep 27, 1994
 S LRYR=$E(DT,1,3) I $D(^LRO(69,LRYR,2)) S LRORDER=1+^(2) Q
 S ^LRO(69,LRYR,0)=LRYR,^(2)=0
 Q
