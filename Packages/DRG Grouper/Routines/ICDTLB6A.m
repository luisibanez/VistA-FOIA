ICDTLB6A	;ALB/EG/MRY - GROUPER UTILITY FUNCTIONS FY 2005; 9/29/03 2:47pm ; 6/16/05 1:31pm
	;;18.0;DRG Grouper;**14,17**;Oct 20, 2000
DRG403	S ICDRG=$S(ICDPD["l":$S(AGE="":470,AGE<18:405,1:473),ICDOR["O"!(ICDORNI["O"):$S(ICDCC:401,1:402),ICDCC:403,1:404),ICDRTC=$S(ICDRG=470:3,1:ICDRTC) Q
DRG404	S ICDRG=$S(ICDPD["l":$S(AGE="":470,AGE<18:405,1:473),ICDOR["O"!(ICDORNI["O"):$S(ICDCC:401,1:402),ICDCC:403,1:404),ICDRTC=$S(ICDRG=470:3,1:ICDRTC) Q
DRG405	D DRG404 Q
DRG406	;
	I ICDORNI["K" D
	.S ICDRG=$S((ICDPD["L")&(ICDCC):539,ICDPD["L":540,ICDCC:406,1:407)
	I ICDORNI'["K" D DRG408
	Q
DRG407	D DRG406 Q
DRG408	I $D(ICDDX(1))&(ICDOPCT=0) D  Q:ICDRG=409
	.I ICDDX(1)=$O(^ICD9("AB","V58.0 ",0)) S ICDRG=409 Q
	.I ICDDX(1)=$O(^ICD9("AB","V67.1 ",0)) S ICDRG=409 Q
	.Q
	I $D(ICDDX(1))&(ICDOPCT=0) D  Q:"410^492"[ICDRG
	.I ICDDX(1)=$O(^ICD9("AB","V58.1 ",0)) S ICDRG=$S(ICDSD["2":492,1:410) Q
	.I ICDDX(1)=$O(^ICD9("AB","V67.2 ",0)) S ICDRG=$S(ICDSD["2":492,1:410) Q
	I ICDOPCT>0 S ICDRG=$S(ICDPD'["L":408,ICDCC:401,1:402) Q
	I ICDOPCT=0 D DRG412
	Q
DRG411	S ICDRG=$S(ICDOR["O"!(ICDORNI["O"):408,ICDOR["N":412,1:411) Q
DRG412	;S ICDRG=$S(ICDOR["O"!(ICDORNI["O"):408,ICDOR["N"&($D(ICDPDRG(412))):412,$D(ICDPDRG(411)):411,ICDCC:413,1:414)
	I ICDOPCT>0 D DRG408 Q
	D DRG412^ICDTLB61
	Q
DRG413	S ICDRG=$S(ICDCC:413,1:414) Q
DRG414	S ICDRG=$S(ICDCC:413,1:414) Q
DRG416	S ICDRG=$S(ICDOR["O":415,AGE="":470,AGE>17:416,1:417),ICDRTC=$S(ICDRG=470:3,1:ICDRTC) Q
DRG417	S ICDRG=$S(ICDOR["O":415,AGE="":470,AGE>17:416,1:417),ICDRTC=$S(ICDRG=470:3,1:ICDRTC) Q
DRG418	S ICDRG=$S(ICDOR["O":415,1:418) Q
DRG419	S ICDRG=$S(ICDOR["O":415,AGE="":470,AGE<18:422,ICDCC:419,1:420),ICDRTC=$S(ICDRG=470:3,1:ICDRTC) Q
DRG420	S ICDRG=$S(ICDOR["O":415,AGE="":470,AGE<18:422,ICDCC:419,1:420),ICDRTC=$S(ICDRG=470:3,1:ICDRTC) Q
DRG421	S ICDRG=$S(ICDOR["O":415,AGE="":470,AGE>17:421,1:422),ICDRTC=$S(ICDRG=470:3,1:ICDRTC) Q
DRG422	S ICDRG=$S(ICDOR["O":415,AGE="":470,AGE>17:421,1:422),ICDRTC=$S(ICDRG=470:3,1:ICDRTC) Q
DRG423	S ICDRG=$S(ICDOR["O":415,1:423) Q
DRG424	S ICDRG=$S(ICDOR["O":424,1:425) Q
DRG425	S ICDRG=$S(ICDOR["O":424,1:425) Q
DRG426	S ICDRG=$S(ICDOR["O":424,1:426) Q
DRG427	S ICDRG=$S(ICDOR["O":424,1:427) Q
DRG428	S ICDRG=$S(ICDOR["O":424,1:428) Q
DRG429	S ICDRG=$S(ICDOR["O":424,1:429) Q
DRG430	S ICDRG=$S(ICDOR["O":424,1:430) Q
DRG431	S ICDRG=$S(ICDOR["O":424,1:431) Q
DRG432	S ICDRG=$S(ICDOR["O":424,1:432) Q
DRG434	S ICDRG=$S(ICDPD["t"!(ICDSD["t"):$S(ICDOR["D":437,ICDOR["R":436,ICDCC:434,1:435),ICDCC:434,1:435) Q
DRG435	S ICDRG=$S(ICDPD["t"!(ICDSD["t"):$S(ICDOR["D":437,ICDOR["R":436,ICDCC:434,1:435),ICDCC:434,1:435) Q
DRG436	S ICDRG=$S(ICDPD["t"!(ICDSD["t"):$S(ICDOR["D":437,ICDOR["R":436,ICDCC:434,1:435),ICDCC:434,1:435) Q
DRG437	S ICDRG=$S(ICDPD["t"!(ICDSD["t"):$S(ICDOR["D":437,ICDOR["R":436,ICDCC:434,1:435),ICDCC:434,1:435) Q
DRG439	S ICDRG=$S($D(ICDODRG(440)):440,1:439) Q
DRG442	S ICDRG=$S(ICDCC:442,1:443) Q
DRG443	D EN1^ICDDRG5 S ICDRG=$S(ICDCC3:$S(ICDCC:442,1:443),1:"") Q
DRG444	S ICDRG=$S(AGE<18:446,ICDCC:444,1:445) I AGE="" S ICDRG=470,ICDRTC=3
	Q
DRG445	S ICDRG=$S(AGE<18:446,ICDCC:444,1:445) I AGE="" S ICDRG=470,ICDRTC=3
	Q
DRG446	S ICDRG=$S(AGE<18:446,ICDCC:444,1:445) I AGE="" S ICDRG=470,ICDRTC=3
	Q
DRG447	S ICDRG=$S(AGE>17:447,1:448) I AGE="" S ICDRG=470,ICDRTC=3
	Q
DRG448	S ICDRG=$S(AGE>17:447,1:448) I AGE="" S ICDRG=470,ICDRTC=3
	Q
DRG449	S ICDRG=$S(AGE<18:451,ICDCC:449,1:450) I AGE="" S ICDRG=470,ICDRTC=3
	Q
DRG450	S ICDRG=$S(AGE<18:451,ICDCC:449,1:450) I AGE="" S ICDRG=470,ICDRTC=3
	Q
DRG451	S ICDRG=$S(AGE<18:451,ICDCC:449,1:450) I AGE="" S ICDRG=470,ICDRTC=3
	Q
DRG452	S ICDRG=$S(ICDCC:452,1:453) Q
DRG453	S ICDRG=$S(ICDCC:452,1:453) Q
DRG454	S ICDRG=$S(ICDCC:454,1:455) Q
DRG455	S ICDRG=$S(ICDCC:454,1:455) Q
DRG462	S ICDRG=$S(ICDOR["O":461,1:462) Q
DRG463	S ICDRG=$S(ICDOR["O":461,ICDCC:463,1:464) Q
DRG464	S ICDRG=$S(ICDOR["O":461,ICDCC:463,1:464) Q
DRG465	S ICDRG=$S(ICDOR["O":461,ICDSD["m":465,1:466) Q
DRG466	S ICDRG=$S(ICDOR["O":461,ICDSD["m":465,1:466) Q
DRG467	S ICDRG=$S(ICDOR["O":461,1:467) Q
DRG471	S ICDRG=$S($F($P(ICDOR,"M",2,99),"M"):471,1:"") Q
DRG475	S ICDRG=$S(ICDOR["V":475,1:$S($D(ICDPDRG):$O(ICDPDRG(0)),1:468)) I ICDRG<468 D DODRG^ICDDRG0
	Q
DRG478	S ICDRG=$S(ICDOR["O"&ICDCC:478,1:479) Q
DRG479	S ICDRG=$S(ICDOR["O"&ICDCC:478,1:479) Q
DRG493	;I (ICDI-1)=1,'ICDCC S ICDCC=$S($D(^ICD9("ACC",ICDDX(1),ICDDX(1))):1,1:0)
	S ICDRG=$S(ICDCC:493,1:494) Q
DRG494	;I (ICD-1),'ICDCC S ICDCC=$S($D(^ICD9("ACC",ICDDX(1),ICDDX(1))):1,1:0)
	S ICDRG=$S(ICDCC:493,1:494) Q
DRG495	Q
DRG496	S ICDRG=$S(ICDOR["F":496,ICDCC:497,1:498) Q
DRG497	S ICDRG=$S(ICDOR["F":496,ICDCC:497,1:498) Q
DRG498	S ICDRG=$S(ICDOR["F":496,ICDCC:497,1:498) Q
DRG499	S ICDRG=$S(ICDCC:499,1:500) Q
DRG500	S ICDRG=$S(ICDCC:499,1:500) Q
DRG501	D
	. I (ICDPD["k") D
	.. I ICDCC S ICDRG=501
	.. I 'ICDCC S ICDRG=502
	. E  S ICDRG=503
	Q
DRG502	D DRG501 Q
DRG503	D DRG501 Q
DRG514	; Replaced with DRG535
	N ICDE1,ICDE2
	S ICDE1=$S($D(ICDOP(" 37.95"))&($D(ICDOP(" 37.96"))):1,1:0)
	S ICDE2=$S($D(ICDOP(" 37.97"))&($D(ICDOP(" 37.98"))):1,1:0)
	S ICDRG=470
	I $D(ICDOP(" 37.94")) I ICDE1+ICDE2=0 S ICDRG=515
	I '$D(ICDOP(" 37.94")) I ICDE1!ICDE2 S ICDRG=515
	; "HN" in ICDOR represents OR proc 37.21-.23, 37.26, 88.52-.58
	I ICDRG=515 I ICDOR["HN" S ICDRG=514
	Q
DRG515	D DRG535 Q
DRG516	I ICDOR["1" S ICDRG=518
	I (ICDOR["1") I $D(ICDOP(" 36.06"))!($D(ICDOP(" 92.27"))) S ICDRG=517
	I (ICDOR["1")&(ICDPD["AIC") S ICDRG=516
	I (ICDOR["1")&(ICDPD["AIC")&$D(ICDOP(" 36.07")) S ICDRG=526
	I (ICDOR["1")&(ICDPD'["AIC")&$D(ICDOP(" 36.07")) S ICDRG=527 ; ICD*18*5
	Q
DRG517	D DRG516 Q
DRG518	D DRG516 Q
DRG519	S ICDRG=$S(ICDOR["F":496,ICDCC:519,1:520) Q
DRG520	D DRG519 Q
DRG521	S ICDRG=$S(ICDCC:521,ICDOR["D"!(ICDOR["R"):522,1:523) Q
DRG522	D DRG521 Q
DRG523	D DRG521 Q
DRG526	D DRG516 Q
DRG527	D DRG516 Q
DRG531	S ICDRG=$S(ICDCC:531,1:532) Q
DRG532	D DRG531 Q
DRG533	S ICDRG=$S(ICDCC:533,1:534) Q
DRG534	D DRG533 Q
DRG535	N ICDE1,ICDE2,ICDE3
	S ICDE1=$S($D(ICDOP(" 37.95"))&(($D(ICDOP(" 37.96")))!($D(ICDOP(" 00.54")))):1,1:0)
	S ICDE2=$S($D(ICDOP(" 37.97"))&(($D(ICDOP(" 37.98")))!($D(ICDOP(" 00.54")))):1,1:0)
	S ICDE3=$S($D(ICDOP(" 00.52"))&($D(ICDOP(" 00.54"))):1,1:0)
	;S ICDE4=$S($D(ICDOP(" 00.54"))&($D(ICDOP(" 37.95"))):1,1:0)
	S ICDRG=470
	I $D(ICDOP(" 37.94"))!$D(ICDOP(" 00.51")) I ICDE1+ICDE2+ICDE3=0 S ICDRG=515
	I '$D(ICDOP(" 37.94"))&('$D(ICDOP(" 00.51"))) I ICDE1!ICDE2!ICDE3 S ICDRG=515
	; "HN" in ICDOR represents OR proc 37.21-.23, 37.26, 88.52-.58
	I ICDRG=515 I ICDOR["HN" S ICDRG=$S(ICDPD["A":535,1:536)
	I ICDRG=470 D DRG115^ICDTLB2A
	Q
DRG536	D DRG535 Q
DRG537	S ICDRG=$S(ICDCC:537,1:538) Q
DRG538	D DRG537 Q
DRG539	I ICDPD["L"&(ICDMAJ'[3) D DRG401^ICDTLB5A Q:"401^402^403^404^405^470^473"[ICDRG
	S ICDRG=$S((ICDPD["L")&(ICDCC):539,ICDPD["L":540,ICDCC:406,1:407) Q
DRG540	D DRG539 Q
DRG543	S ICDRG=$S((ICDPD["Q")&(ICDOR["Q"):543,ICDOR["Q"&$D(ICDOP(" 00.10")):543,1:ICDRG)
