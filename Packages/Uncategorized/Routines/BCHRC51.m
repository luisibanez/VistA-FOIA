BCHRC51 ; IHS/TUCSON/LAB - PROCESS REPORT ;  [ 06/05/99  8:42 PM ]
 ;;1.0;IHS RPMS CHR SYSTEM;**7**;OCT 28, 1996
 ;IHS/CMI/LAB - tmp to xtmp
 ;
START ;
 D XTMP^BCHUTIL("BCHRC5","CHR CHRIS II REPORT")
 S (BCHBT,BCHBTH)=$H,BCHJOB=$J,BCHTF=0,BCHTM=0
 S BCHRNN=BCHRBIN,BCHRA="" F I=1:1 S BCHRX=$P(BCHRNN,";",I) Q:BCHRX=""  D SETA
 S BCHRDOBS=BCHRA
 D D,END
 Q
 ;
D ; Run by date of service
 S X1=BCHBD,X2=-1 D C^%DTC S BCHSD=X
 S BCHODAT=BCHSD_".9999" F  S BCHODAT=$O(^BCHR("B",BCHODAT)) Q:BCHODAT=""!((BCHODAT\1)>BCHED)  D D1
 Q
 ;
END ;
 S BCHET=$H
 D EOJ
 Q
EOJ ;
 Q
D1 ;
 S (BCHR,BCHRCNT)=0 F  S BCHR=$O(^BCHR("B",BCHODAT,BCHR)) Q:BCHR'=+BCHR  I $D(^BCHR(BCHR,0)),$P(^(0),U,2)]"",$P(^(0),U,3)]"" S BCHR0=^(0),BCHR11=$G(^BCHR(BCHR,11)) D PROC
 Q
PROC ;
 S BCHPROG=$P(BCHR0,U,2)
 I BCHPRG,BCHPRG'=BCHPROG Q
 ;S (BCHX,BCHC)=0 F  S BCHX=$O(^BCHRPROB("AD",BCHR,BCHX)) Q:BCHX'=+BCHX  S BCHC=BCHC+1 D
 S (BCHX,BCHC)=0 F  S BCHX=$O(^BCHRPROB("AD",BCHR,BCHX)) Q:BCHX'=+BCHX  I $P(^BCHRPROB(BCHX,0),U,4),$P(^BCHTSERV($P(^BCHRPROB(BCHX,0),U,4),0),U,3)'="LT" S BCHC=BCHC+1 D
 .S BCHPROB=$P(^BCHRPROB(BCHX,0),U),BCHPROBN=$P(^BCHTPROB(BCHPROB,0),U)_"|"_$P(^BCHTPROB(BCHPROB,0),U,2)
 .D SETTMP
 .Q
 Q
SETTMP ;
 S DFN=$P(BCHR0,U,4) I DFN S DOB=$P(^DPT(DFN,0),U,3)
 I 'DFN S DOB=$P(BCHR11,U,2)
 Q:DOB']""
 I DFN S SEX=$P(^DPT(DFN,0),U,2)
 I 'DFN S SEX=$P(BCHR11,U,3)
 Q:SEX=""  ;no sex available
 Q:$P(BCHR0,U,12)'=1
 S BCHRAGE="" D GETAGE
 Q:'BCHRAGE
 I SEX="F" S BCHTF=BCHTF+1
 I SEX="M" S BCHTM=BCHTM+1
 S ^XTMP("BCHRC5",BCHJOB,BCHBT,"TOTAL AGE",BCHRAGE,SEX)=^XTMP("BCHRC5",BCHJOB,BCHBT,"TOTAL AGE",BCHRAGE,SEX)+1
 S ^(SEX)=$S($D(^XTMP("BCHRC5",BCHJOB,BCHBT,"HA",BCHPROB,BCHRAGE,SEX)):^(SEX)+1,1:1)
 S ^(SEX)=$S($D(^XTMP("BCHRC5",BCHJOB,BCHBT,"HA",BCHPROB,"TOTAL",SEX)):^(SEX)+1,1:1)
 Q
GETAGE ;
 F I=1:1 S BCHRNN=$P(BCHRA,";",I) Q:BCHRNN=""  S BCHRX=$P(BCHRNN,"-"),BCHRY=$P(BCHRNN,"-",2) I DOB'<BCHRX,DOB'>BCHRY  S BCHRAGE=I Q
 Q
 ;
SETA ;
 S BCHRY=$P(BCHRX,"-"),BCHRZ=$P(BCHRX,"-",2)
 I BCHRA]"" S BCHRA=BCHRA_";"
 S BCHRA=BCHRA_(DT+1-(10000*(BCHRZ+1)))_"-"_(DT-(BCHRY*10000))
 S ^XTMP("BCHRC5",BCHJOB,BCHBT,"TOTAL AGE",I,"F")=0,^XTMP("BCHRC5",BCHJOB,BCHBT,"TOTAL AGE",I,"M")=0
 Q
