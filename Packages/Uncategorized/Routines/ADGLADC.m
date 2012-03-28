ADGLADC ; IHS/ADC/PDW/ENM - ADMISSION LISTINGS (CALC) ; [ 03/25/1999  11:48 AM ]
 ;;5.0;ADMISSION/DISCHARGE/TRANSFER;;MAR 25, 1999
 ;
 K ^TMP("DGZLAD",$J)
A ; -- driver
 D L1 G ^ADGLADP
 ;
L1 ; -- loop admissions
 N DFN,IFN,DGDT
 S DGDT=DGBDT-.0001,DGEND=DGEDT+.2400
 F  S DGDT=$O(^DGPM("AMV1",DGDT)) Q:'DGDT!(DGDT>DGEND)  D
 . S DFN=0 F  S DFN=$O(^DGPM("AMV1",DGDT,DFN)) Q:'DFN  D
 .. S IFN=0 F  S IFN=$O(^DGPM("AMV1",DGDT,DFN,IFN)) Q:'IFN  D 1
 Q
 ;
1 ;
 N NAME,N,WD,WARD,DX,TS
 S NAME=$P($G(^DPT(DFN,0)),U),N=$G(^DGPM(+IFN,0)),WD=$P(N,U,6)
 I DGTYP=2,DGSRT'="A" Q:WD'=+DGSRT
 S WARD=$P($G(^DIC(42,+WD,0)),U),DX=$P(N,U,10),TS=$$TS
 I DGTYP=3,DGSRT'="A" Q:TS'=$P($G(^DIC(45.7,+DGSRT,0)),U)
 S TS=$S(TS="":"NO SERVICE",1:TS)
 ;--sort by
 ;--date, alpha 
 I DGTYP=1 D  Q
 . S ^TMP("DGZLAD",$J,$P(DGDT,"."),DGDT,DFN)=WARD_U_TS_U_DX
 ;--ward, date, alpha
 I DGTYP=2 D  Q
 . S ^TMP("DGZLAD",$J,WARD,DGDT,NAME,DFN)=TS_U_DX
 ;--service, date, alpha
 S ^TMP("DGZLAD",$J,TS,DGDT,NAME,DFN)=WARD_U_DX
 Q
 ;
TS() ; -- treating specialty
 Q $P($G(^DIC(45.7,+$P($G(^DGPM(+$O(^DGPM("APHY",IFN,0)),0)),U,9),0)),U)
