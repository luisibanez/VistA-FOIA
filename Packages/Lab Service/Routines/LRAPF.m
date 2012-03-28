LRAPF ;AVAMC/REG/WTY - CY/EM/SP RPT ;9/25/00 [ 04/11/2003  10:11 AM ]
 ;;5.2;LR;**1003,1006,1018,1020**;Sep 13, 2005
 ;;5.2;LAB SERVICE;**173,201,248**;Sep 27, 1994
 ;
 ;from LRSPRPT,LRSPRPT1, LRSPRPT2, LRSPRPTM
 I $D(LR("F")),IOST?1"C".E D M^LRU Q:LR("Q")
 S LRQ=LRQ+1
 W:($D(LR("F"))&(IOST'?1"C".E))!(IOST?1"C".E) @IOF,!
 D W
 W !?5,"MEDICAL RECORD |",?40,LRAA(1),?73,"Pg ",LRQ
 D:LRQ>1 P D W
 Q
F ;from LRSPRPT,LRSPRPT1, LRSPRPT2, LRSPRPTM
 Q:LR("Q")  F X=1:1 Q:$Y>(IOSL-14)  W !
 D W W !,$S('$D(LR("W")):"",1:"See signed copy in chart")
 W ?57,"(",$S($D(LRO):"End of report",1:"See next page"),")"
 W !,LRPMD,?52,LRW(9),?55,"| Date ",LRRC
 D W
 W !,LRP,?50,$S('$D(LR("W")):"STANDARD FORM 515",1:"WORK COPY ONLY !!")
 ;W !,"ID:",SSN,?16,"SEX:",SEX," DOB:",DOB
 ;W:AGE $S($G(VADM(6))]"":" AGE AT DEATH: ",1:" AGE: "),AGE
 ;W " LOC:",LRLLOC
 ;W !
 ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 W !,"ID:",HRCN,?16,"SEX:",SEX," DOB:",DOB W:AGE $S($G(VADM(6))]"":" AGE AT DEATH: ",1:" AGE: "),AGE W " LOC:",LRLLOC W !  ;IHS/DIR TUC/AAB 5/4/98
 ;----- END IHS MODIFICATIONS LR*5.2*1018
 W:$L(LRADM) "ADM:",$P(LRADM,"@")
 W:$L(LRADX) ?17,"DX:",$E(LRADX,1,28) W:$L(LRMD) ?46,LRMD
 ;----- BEGIN IHS MODIFICATIONS LR*5.2*1020 -- Name, Address & Phone # on Report
NAMER ;
 NEW STR,STRA,STRN,STRO,STRT
 ;
 ; Get ADDRESS from the BLR MASTER CONTROL file
 S STRA=$$GET1^DIQ(9009029,$G(DUZ(2)),"PATH ADDR1")
 S STR=$$GET1^DIQ(9009029,$G(DUZ(2)),"PATH ADDR2")
 I $G(STR)'="" S STRA=STRA_" "_STR
 S STRA=STRA_"  "_$$GET1^DIQ(9009029,$G(DUZ(2)),"PATH CITY")
 S STRA=STRA_", "_$$GET1^DIQ(9009029,$G(DUZ(2)),"PATH STATE:ABBREVIATION")
 S STRA=STRA_"  "_$$GET1^DIQ(9009029,$G(DUZ(2)),"PATH ZIP")
 ;
 ; If ADDRESS is not in BLR MASTER CONTROL, try the INSTITUTION file
 I $TR($TR(STRA,",")," ")="" D
 . S STRA=$$GET1^DIQ(4,$G(DUZ(2)),"STREET ADDR. 1")
 . S STR=$$GET1^DIQ(4,$G(DUZ(2)),"STREET ADDR. 2")
 . I $G(STR)'="" S STRA=STRA_" "_STR
 . S STRA=STRA_"  "_$$GET1^DIQ(4,$G(DUZ(2)),"CITY")
 . S STRA=STRA_", "_$$GET1^DIQ(4,$G(DUZ(2)),"STATE:ABBREVIATION")
 . S STRA=STRA_"  "_$$GET1^DIQ(4,$G(DUZ(2)),"ZIP")
 ;
 I $TR($TR(STRA,",")," ")="" Q         ; If there is no address, skip
 ;
 ; Pathology "Institution" Name
 S STRN=$$GET1^DIQ(9009029,$G(DUZ(2)),"PATH INST")
 I $G(STRN)="" S STRN=$$NAME^XUAF4($G(DUZ(2)))  ; If no data, get Institution Name
 ;
 I $TR(STRN," ")="" Q                  ; If there is no site name, skip
 ;
 I ($L(STRA)+$L(STRN)+8)>IOM D    ; May need to use 2 lines
 . W !!,$$CJ^XLFSTR(STRN,IOM)
 . W !,$$CJ^XLFSTR(STRA,IOM),!
 I ($L(STRA)+$L(STRN)+8)<IOM D    ; Just use 1 line
 . W !!,$$CJ^XLFSTR(STRN_"  "_STRA,IOM),!
 I ($L(STRA)+$L(STRN)+8)=IOM D
 . W !!,$$CJ^XLFSTR(STRN_"  "_STRA,IOM),!
 ;
 S STRO=" "                       ; Name & Phone Number & Title, if they exist
 S STRN=$$GET1^DIQ(9009029,$G(DUZ(2)),"PATH NAME:SIGNATURE BLOCK PRINTED NAME")
 I $G(STRN)'="" D
 . S STRT=$$GET1^DIQ(9009029,$G(DUZ(2)),"PATH TITLE")
 . I $G(STRT)="" S STRO="Pathology:"_STRN
 . I $G(STRT)'="" S STRO=STRT_":"_STRN
 S STRA=$$GET1^DIQ(9009029,$G(DUZ(2)),"PATH PHONE")
 I $G(STRA)'="" S STRO=STRO_"     Phone:"_STRA
 I $TR(STRO," ")="" Q
 ;
 S STRO=$$TRIM^XLFSTR(STRO,"L"," ")
 W $$CJ^XLFSTR(STRO,IOM),!
 ;----- END IHS MODIFICATIONS LR*5.2*1020 -- Name, Address & Phone # on Report
 Q
 ;
P D:LRQ>1 W
 S ADESC="Accession No. "_$S(LRQ(8)]"":LRQ(8)_LRW(1)_" "_LRAC,1:LRAC)
 S LENG1=$L(LRQ(1)),LENG2=$L(ADESC),LNSPCE=IOM-LENG2-14
 S:LENG1>LNSPCE LRQ(1)=$E(LRQ(1),1,LNSPCE)
 W !?30,"PATHOLOGY REPORT",!,"Laboratory: ",LRQ(1)
 W ?(IOM-LENG2-1),ADESC
 K ADESC,LENG1,LENG2,LNSPCE
 Q
W W !,LR("%")
 Q
