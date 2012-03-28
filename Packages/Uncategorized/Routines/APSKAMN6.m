APSKAMN6 ;IHS/ANMC/SFB/MRS - CONTAINS ALL MATH FUNCTIONS[ 09/28/94  10:51 AM ]
 ;;1.0;Aminoglycoside Kinetics;;OCT 31,1994
 I APSKPTIN'=1 D NOINFO^APSKAMN
 G START^APSKAMN0
TIME ;EP - CHANGES TIME INPUTS TO DECIMAL HOURS
 S (APSKP,APSKQ1,APSKQ2)=0
 S APSKQ1=$P(APSKZ(APSKX1),":",1)
 S APSKQ2=$P(APSKZ(APSKX1),":",2)
 S APSKP=APSKQ1_"."_APSKQ2
 S APSKT(APSKX1)=APSKQ1+(100*(APSKP-APSKQ1)/60)
 Q
LN ;EP - APSKLNN=LN(APSKXX) (LOG BASE E)
 S APSKTT=APSKXX,(APSKLNN,APSKDD)=0 Q:APSKXX'>0
LN2 I APSKTT'<1 S APSKTT=.5*APSKTT,APSKDD=APSKDD+1 G LN2
LN3 I APSKTT<.5 S APSKTT=2*APSKTT,APSKDD=(APSKDD-1) G LN3
 S APSKTT=(APSKTT-.707107)/(APSKTT+.707107),APSKLNN=APSKTT*APSKTT
 S APSKLNN=+$J((((.598979*APSKLNN+.961471)*APSKLNN+2.88539)*APSKTT+APSKDD-.5)*.693147,1,6)
 K APSKDD,APSKTT
 Q
EXP ;EP - APSKEE=EXP(X) (E TO THE X POWER)
 S APSKEE=0,APSKBB=1.4427*APSKXX\1+1 Q:APSKBB>90
 S APSKEE=.693147*APSKBB-APSKXX,APSKAA=.00132988-(.000141316*APSKEE),APSKAA=((APSKAA*APSKEE-.00830136)*APSKEE+.0416574)*APSKEE,APSKEE=(((APSKAA-.166665)*APSKEE+.5)*APSKEE-1)*APSKEE+1,APSKAA=2
 I APSKBB'>0 S APSKAA=.5,APSKBB=-APSKBB
 F APSKII=1:1:APSKBB S APSKEE=APSKAA*APSKEE
 S APSKEE=+$J(APSKEE,1,6)
 K APSKAA,APSKBB,APSKII
 Q
 ;
PWR ;EP - APSKPP=APSKXX^APSKYY
 S APSKPP=1 Q:APSKYY=0
 S APSKEE=0,APSKGG=APSKXX,APSKHHH=APSKYY
 I APSKXX<0,APSKYY\1=APSKYY S APSKPP=1-(2*APSKYY)+(4*(APSKYY/2)\1),APSKXX=-APSKXX
 I APSKXX D LN S APSKXX=APSKYY*APSKLNN D EXP
 S APSKPP=APSKPP*APSKEE,APSKXX=APSKGG,APSKYY=APSKHHH
 I APSKYY>1,APSKXX#1+(APSKYY#1)=0 S APSKPP=$J(APSKPP,1,0)
 K APSKGG,APSKHHH,APSKEE,APSKLNN
 Q
