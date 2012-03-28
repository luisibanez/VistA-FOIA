BLRLABL7 ; IHS/DIR/FJE - Bar Code label printer Facit T-410 2X1 ; [ 06/02/1999  9:30 AM ]
 ;;5.2;BLR;**1008**;JUN 01, 1999
 ;
 ;MAXM - check digit disabled, variable length=11 
 ;CX5 - check digit disabled,no spaces,fixed length=4+1 for check digit
 ;Open tag is called from TERMINAL TYPE file 3.2,terminal type=P-FACIT T410
 ;
ST ;      
 N X,Y
 S IOP=ION,U="^",(BLRURG,BLRACC)="" D ^%ZIS U IO
 S BLRAN=$G(LRAN)
 W "^D2",*13
 W $E($G(PNM),1,28),*13
 W $G(SEX),*13
 W $G(HRCN),*13
 W "DOB:",*13
 S X=$G(DOB) D ^%DT
 W $E(Y,4,5)_"/"_$E(Y,6,7)_"/"_($E(Y,1,3)+1700),*13 ;IHS/DIR/FJE Y2K 4 DIG DATE YEAR DISP
 W $E($G(LRLLOC),1,7),*13
 S BLRLEN=$L($P(LRACC," ",3)) I BLRLEN<4 F BLRII=1:1:4-BLRLEN S BLRACC=BLRACC_"0"
 S LRACC=$G(LRACC),BLRACC=BLRACC_$P(LRACC," ",3)
 W BLRACC,*13
 W "CDT:",*13
 S BLRDAT=$TR($G(LRDAT)," ","@") W BLRDAT,*13
 W $G(LRTOP),*13
 W $G(LRCE),*13
 W LRACC,*13
 W "PR:",*13
 I '$D(LRDOC),$G(LRAA),$G(LRAD),$G(LRAN) N LRDOC D
 .S LRDOC=$P($G(^LRO(68,LRAA,1,LRAD,1,LRAN,0)),U,8)
 .S:LRDOC LRDOC=$P(^VA(200,LRDOC,0),U)
 W $E(LRDOC,1,15),*13
 S LRURG0=$G(LRURG0) I LRURG0'="" S BLRURG=$E($P(^LAB(62.05,LRURG0,0),U,1),1,2)
 W BLRURG,*13
 S BLRII=0,BLRTST="" F  S BLRII=$O(LRTS(BLRII)) Q:BLRII=""  S BLRT=$E(LRTS(BLRII),1,7) S BLRTST=BLRTST_BLRT_","
 S BLRTST=$E(BLRTST,1,43) I $E(BLRTST,$L(BLRTST))="," S BLRTST=$E(BLRTST,1,$L(BLRTST)-1)
 W BLRTST,*13
 W "^D3",*13
 K BLRDAT,BLRT,BLRTST,BLRURG,BLRACC,BLRLEN,BLRII
 Q
 ;
OPEN ;
 U IO
 W "^A22^D45",*13
 W "^A49^D91",*13
 W "^AB00000000^D23",*13
 W "^AB00000000^D24",*13
 W "^AB10001011^D21",*13
 W "^AB00000000^D22",*13
 W "^A3^D97",*13
 W "^A85^D95",*13
 W "^A0^D39",*13
 W "^D57",*13
 W "17,660,206,,24,30,0,1,10",*13
 W "1,220,160,28,1,2",*13  ;NAME
 W "2,587,160,1,1,2",*13         ;SEX
 W "3,220,140,6,1,2",*13    ;HRCN
 W "4,320,140,4,1,2",*13   ;DOB:
 W "5,380,140,10,1,2",*13          ;DOB /IHS/DIR/FJE 6/2/99 4 DIG YR
 W "6,520,140,7,1,2",*13        ;LOCATION 
 W "7,370,58,4,1,2",*13        ;READABLE ACCESSION NUMBER
 W "7,320,82,5,16,2,,,2,60",*13     ;BAR CODED ACCESSION NUMBER
 W "8,220,37,4,1,1",*13         ;CDT:
 W "9,272,37,16,1,1",*13      ;COLLECTION DATE /IHS/DIR/FJE 14-16 DIG YR
 W "10,450,37,5,1,1",*13         ;COLLECTION SAMPLE
 W "11,520,37,7,1,1",*13         ;ORDER NUMBER
 W "12,220,20,15,1,1",*13        ;ACCESSION NUMBER
 W "13,370,20,3,1,1",*13         ;PR:
 W "14,402,20,15,1,1",*13       ;PROVIDER 
 W "15,580,20,2,1,1",*13        ;URGENCY
 W "16,220,0,43,1,1",*13     ;TESTS
 W "^D56",*13
 ;
 Q
