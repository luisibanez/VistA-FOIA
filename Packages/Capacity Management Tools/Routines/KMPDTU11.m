KMPDTU11 ;OAK/RAK - CP Tools Timing Utility ;2/17/04  09:46
 ;;2.0;CAPACITY MANAGEMENT TOOLS;;Mar 22, 2002
 ;
RLTMHR(KMPDQIET,KMPDASK,KMPDEF) ;-- extrinsic function - real time hours
 ;-----------------------------------------------------------------------
 ; KMPDQIET... Display output
 ;              0 - display output (not quiet)
 ;              1 - do not display output (quiet)
 ; KMPDASK.... Ask user to select hours
 ;              0 - do not ask user to select
 ;              1 - ask user to select
 ; KMPDEF..... Default
 ;              0 - do not use default
 ;              1 - use time range as default
 ;
 ; Return: List of hours (ie, 1,2,5,6,7...)
 ;         "" - no selection made
 ;-----------------------------------------------------------------------
 ;
 S KMPDQIET=+$G(KMPDQIET),KMPDASK=+$G(KMPDASK),KMPDEF=+$G(KMPDEF)
 N DATA,DIR,DOT,HOURS,HR,I,QUEUED,X,Y
 W:'KMPDQIET !," ==> building Hours list..."
 S I="",DOT=0
 F  S I=$O(^KMPTMP("KMPDT","ORWCV",I)) Q:I=""  S DATA=^(I) I DATA]"" D 
 .S DOT=DOT+1 W:'(DOT#1000)&('KMPDQIET) "."
 .; change $h to fileman format and get hour
 .S HR=$E($P($$HTFM^XLFDT($P(DATA,U)),".",2),1,2) S:HR>23 HR="0"
 .; create HOURS() array
 .S:HR'="" HOURS(+HR)=""
 ;
 ; if no HOURS() array
 Q:'$D(HOURS) ""
 ;
 ; do not ask user to select hours
 I 'KMPDASK D  Q X
 .S (I,X)="" F  S I=$O(HOURS(I)) Q:I=""  S X=X_I_","
 ;
 ; ask user to select hour(s)
 S DIR(0)="LO^"_$O(HOURS(""))_":"_$O(HOURS("A"),-1)
 S DIR("A")="Select Hour(s)"
 S:KMPDEF DIR("B")=$O(HOURS(""))_"-"_$O(HOURS("A"),-1)
 W ! D ^DIR
 Q $S(Y=""!(Y="^"):"",1:$G(Y(0)))
