AIBCVT4 ;IHS/DDPS/DFM-IBM STAT RECORDS INITIALIZE  [ 01/28/89  1:05 PM ]
 ;1.3; 3/28/88
INIT ;HOUSEKEEPING INITIALIZE FIELDS ROUTINE
 S (AIBCT2,AIBCTB,AIBCTW,AIBCTE,AIBCTH,AIBCTI,AIBCTJ,AIBCTO,AIBCDV)=0
 S (AIBRLN,AIBAGI,AIBAGO,AIBCRG1)=0
 S (AIBGCT2,AIBGCTB,AIBGCTI,AIBGCTO,AIBGCTE,AIBFSQ)=0
 S (AIBA,AIBMSG,AIBG,AIBTDV,AIBOT,AIBOT(1),AIBH2)=""
 S AIB2ND="",AIBT2="W",(AIBSEQ,AIBTC)=1
 S AIBOS="M" I ^%ZOSF("OS")["DSM" S AIBOS="D"
 S AIBZRS="0000000000000000000000000",U="^",AIBDSH="-",WARN="W",YES="Y"
 S %DT="",X="T" D ^%DT S AIBYMD=$E(Y,2,7)
 S AIBH1="|||",AIBH2=""
 S AIBH3="RRD01   "_$E(AIBYMD,3,6)_$E(AIBYMD,1,2)
 S AIBH5="   DELETE RECORDS REGISTRATION"
 S AIBH4="   HEALTH REC ADD REGISTRATION"
 S:'$D(DTIME) DTIME=300
 I $D(AIBGBLP) G SELPRINT
 R !!,"Enter first 4 characters of global to process ",AIBGBLP:DTIME
SELPRINT ;SELECT PRINTER TO USE
 I $D(AIBPDV) S IOP=AIBPDV
 S %IS("B")="LP",%IS("A")="Select Printer " D ^%ZIS S AIBPDV=IO
CKTYPE ;CHECK TYPE OF FILE TO WRITE - keytap=TAPE, ibmjob=RJE CARDS
 S:AIBOS="D" AIBFILE="keytap" G:'$D(AIBFILE) RDTYPE
 G:AIBFILE="keytap" CKGLOB G:AIBFILE="ibmjob" CKGLOB
 I AIBFILE="^" S AIBA="A" D OPCANCL^AIBCVT6 G RETURN
RDTYPE ;GET TYPE FROM OPERATOR
 U AIBCDV W !!,"Choose Filetype to Generate :"
 W !,"    K - Keytape"
 W !,"    I - Ibmjob"
 W !,"    ^ - Abort run"
 R !!,"Enter Choice: ",AIBFILE:DTIME
 S:"KEYTAPEkeytape"[AIBFILE AIBFILE="keytap"
 S:"IBMJOBibmjob"[AIBFILE AIBFILE="ibmjob"
 G CKTYPE
CKGLOB ;CHECK IF GLOBAL EXISTS
 S (AIBZ,AIBZ(0),AIBZZ,AIBTZ,AIBTZ(0))="",AIBGBL=U_AIBGBLP_"GLOB"
 S:'$D(AIBDIR) AIBDIR="/usr/mumps/"
 U AIBCDV W !
 I $D(@AIBGBL) G GLOBOK
 S AIBMSG="Global "_AIBGBL_" Does'nt Exist" S AIBA="A" G RETURN
GLOBOK ;GLOBAL WAS FOUND
 S AIBGBLT=AIBGBL_"(AIBZ)",AIBZ="COUNT",AIBGBFT=AIBGBL_"(AIBZ,AIBZZ)"
 K @AIBGBLT S AIBZ=""
 S AIBZ=$O(@AIBGBLT)
 I AIBZ>0 S AIBMSG="Global Header Record Missing" S AIBA="A" G RETURN
 S AIBIN=@AIBGBLT
RETURN ;RETURN TO CALLING ROUTINE
 Q
