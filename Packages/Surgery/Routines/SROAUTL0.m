SROAUTL0 ;BIR/ADM/SLM-Risk Assessment Utility ; [ 04/23/04   7:53 AM ]
 ;;3.0; Surgery ;**38,47,57,60,61,63,81,125**;24 Jun 93
PREOP K DR S SRQ=1,DR="325;238;240;204;203;396;332;333;338;339;215;217"
 Q
PREMD K DR S SRQ=1,DR=".011;247;413;417;418;419;420;421;452;453;454"
 Q
OPER K DR S SRQ=0,DR=".03;.04;26;27;214;.42;.035;1.09;1.13;.37;.22;.23;340;66"
 Q
LR K DR S SRQ=0,DR="225;292;228;295;224;291;234;301;230;297;227;294"
 Q
OUT1 ; man preop edit scr
 D PREOP S SRDR=DR,SRC=35,SRQ=1 D OUT
 Q
OUT2 ; man op edit scr
 D OPER S SRDR=DR,SRC=34,SRQ=0 D OUT
 Q
OUT K DA,DIC,DIQ,SRY S DIC="^SRF(",DA=SRTN,DIQ="SRY",DIQ(0)="E",DR=SRDR D EN^DIQ1 K DA,DIC,DIQ,DR
 K SRX S SRX=0 F M=1:1 S I=$P(SRDR,";",M) Q:'I  D
 .D TR D:SRQ GET^SROAUTL1 D:'SRQ GET^SROAUTL2
 .S SRX=SRX+1,Y=$P(X,";;",2),SRFLD=$P(Y,"^"),(Z,SRX(SRX))=$S($P(Y,"^",3)'="":$P(Y,"^",3),1:$P(Y,"^",2))_"^"_SRFLD
 .I SRFLD=.42 S SRY(130,SRTN,SRFLD,"E")=$S($O(^SRF(SRTN,13,0)):"***INFORMATION ENTERED***",1:"")
 .I SRFLD=35,$P($G(^SRF(SRTN,"CON")),"^") S SRY(130,SRTN,SRFLD,"E")="***INFORMATION ENTERED***"
 .I SRFLD=.37 D TECH^SROPRIN S SRY(130,SRTN,SRFLD,"E")=SRTECH
 .I SRFLD=66 S Y=SRY(130,SRTN,SRFLD,"E") I Y'="" D DIAG S SRY(130,SRTN,SRFLD,"E")=X
 .W !,$J(SRX,2)_". "_$P(Z,"^")_":" S SREXT=SRY(130,SRTN,SRFLD,"E") D EXT
 W !! F K=1:1:80 W "-"
 Q
EXT I SRFLD=27 S SREXT=$E(SREXT,1,5)
 I $L(SREXT)<(80-SRC) W ?(SRC),SREXT W:SRFLD=247&SREXT " DAYS" Q
 N I,J,X,Y S X=SREXT F  D  W:$L(X) ! I $L(X)<(80-SRC)!(X'[" ") W ?(SRC),X Q
 .F I=0:1:(78-SRC) S J=(79-SRC)-I,Y=$E(X,J) I Y=" " W ?(SRC),$E(X,1,J-1) S X=$E(X,J+1,$L(X)) Q
 Q
LAB ; man lab edit scrn
 D LR S SRDR=DR K DA,DIC,DIQ,SRY S DIC="^SRF(",DA=SRTN,DIQ="SRY",DIQ(0)="E",DR=SRDR D EN^DIQ1 K DA,DIC,DIQ,DR
 K SRX S SRX=0 F M=1:2 S L=$P(SRDR,";",M) Q:'L  S I=L D
 .D TR,GET^SROAUTL2
 .S SRX=SRX+1,Y=$P(X,";;",2),SRFLD=$P(Y,"^"),SRDT=$P(Y,"^",4),(Z,SRX(SRX))=$S($P(Y,"^",3)'="":$P(Y,"^",3),1:$P(Y,"^",2))_"^"_SRFLD_"^"_SRDT
 .W !,$J(SRX,2)_". "_$P(Z,"^")_":",?35,SRY(130,SRTN,SRFLD,"E") W:SRY(130,SRTN,SRDT,"E")'="" ?45,"("_$P(SRY(130,SRTN,SRDT,"E"),"@")_")"
 W !! F K=1:1:80 W "-"
 Q
CHK ; missing non-card man data
 K SRX F SRC="PREOP","PREMD","OPER" K DA,DIC,DIQ,DR,SRY S DIC="^SRF(",DA=SRTN,DIQ="SRY",DIQ(0)="I" D @SRC D EN^DIQ1 D
 .S I=0 F  S I=$O(SRY(130,SRTN,I)) Q:'I  I SRY(130,SRTN,I,"I")="" D TR D:SRQ GET^SROAUTL1 D:'SRQ GET^SROAUTL2 S SRFLD=$P(X,";;",2),SRX(I)=$P(SRFLD,"^",2)
 K DA,DIC,DIQ,DR,SRY S DIC="^SRF(",DA=SRTN,DIQ="SRY",DIQ(0)="I" D LR D EN^DIQ1 S I=0 F  S I=$O(SRY(130,SRTN,I)) Q:'I  D
 .I SRY(130,SRTN,I,"I")="" D TR,GET^SROAUTL2 S SRFLD=$P(X,";;",2),SRX(I)=$P(SRFLD,"^",2) Q
 .I SRY(130,SRTN,I,"I")="NS" D TR,GET^SROAUTL2 S SRFLD=$P(X,";;",2),SRDT=$P(SRFLD,"^",4) S SRLR(SRDT)=""
 S SRDT=0 F  S SRDT=$O(SRLR(SRDT)) Q:'SRDT  K SRX(SRDT)
 D OTH^SROAUTL
 Q
DIAG ;diagnosis info
 S X=$P($G(^SRF(SRTN,34)),"^",2) S:X X=$$ICDDX^ICDCODE(X,$P($G(^SRF(SRTN,0)),"^",9)),X=Y_"   "_$P(X,"^",4)
 Q
TR S J=I,J=$TR(J,"1234567890.","ABCDEFGHIJP")
 Q
OCC ; occur data
 D EN^SROCCAT K ^TMP("SROCC",$J),SRO,SROC,SROOC
 F SRK=1:1:36 S SROC(SRK)="       "
 S (SRFLG,SRIO,SRPO)=0 F  S SRIO=$O(^SRF(SRTN,10,SRIO)) Q:'SRIO  S ^TMP("SROCC",$J,$P(^SRF(SRTN,10,SRIO,0),U,2),$E($P(^SRF(SRTN,0),U,9),1,7),10)=SRIO
 F  S SRPO=$O(^SRF(SRTN,16,SRPO)) Q:'SRPO  D
 .S SRDATE=$E($P(^SRF(SRTN,16,SRPO,0),U,7),1,7)
 .S X1=$E(SRSDATE,1,7),X2=30 D C^%DTC
 .I SRDATE>X Q
 .I '$G(SRDATE) S SRDATE="       "
 .S ^TMP("SROCC",$J,$P(^SRF(SRTN,16,SRPO,0),U,2),SRDATE,16)=SRPO
 I '$D(^TMP("SROCC",$J)) D OCCEND Q
 ;remove multiples
 S SROCC=0 F  S SROCC=$O(^TMP("SROCC",$J,SROCC)) Q:'SROCC  S SROCCDT=$O(^TMP("SROCC",$J,SROCC,0)),SRTYPE=$O(^TMP("SROCC",$J,SROCC,SROCCDT,0)) D
 .I SROCC=21!(SROCC>28&(SROCC<33))!(SROCC=36) D
 ..S SRDA=^TMP("SROCC",$J,SROCC,SROCCDT,SRTYPE),SRICD=$P(^SRF(SRTN,SRTYPE,SRDA,0),U,3)
 ..I SRICD S SROOC(SROCC)=$P(^ICD9(SRICD,0),U)_"^"_$P(^SRF(SRTN,SRTYPE,SRDA,0),U)
 ..E  S SROOC(SROCC)="NO ICD9 CODE ENTERED"
 .S ^TMP("SROCC",$J,"SR",SROCC,SROCCDT)=""
 S SRK=1,SRO="",SROCC=0 F  S SROCC=$O(^TMP("SROCC",$J,"SR",SROCC)) Q:'SROCC  S SROCCDT="" F  S SROCCDT=$O(^TMP("SROCC",$J,"SR",SROCC,SROCCDT)) Q:SROCCDT=""  D
 .I SROCC=3 S SRPO=^TMP("SROCC",$J,SROCC,SROCCDT,16) I SRPO S X=$P(^SRF(SRTN,16,SRPO,0),"^",4) S:X SRSEP=X
 .S SROC(SROCC)=SROCCDT
 F I=1:1:22,29:1:32,35,36 S SRO=SRO_$J(SROC(I),7)
 S X=$G(SRSEP),SRO=SRO_X I X S SRSEP=$S(X=2:"SEPSIS",X=3:"SEPTIC SHOCK",1:"SIRS")
OCCEND K ^TMP("SROCC",$J),SRPOCC,SRPOCCD,SRSDATE,SRTYPE,SRDATE,SRDA,SRFLG,SRICD,SRJ,SRK,SROCC,SROCCDT,SRPO,X1,X2
 Q
