PXRMV1X ; SLC/PJH - Export Package Level Parameters ; 05/08/2000
 ;;1.5;CLINICAL REMINDERS;;Jun 19, 2000
 ;;
MAIN ; main (initial) parameter transport routine
 K ^TMP($J,"XPARRSTR")
 N ENT,IDX,ROOT,REF,VAL,I
 S ROOT=$NAME(^TMP($J,"XPARRSTR")),ROOT=$E(ROOT,1,$L(ROOT)-1)_","
 D ^PXRMV1X1
XX2 S IDX=0,ENT="PKG."_"CLINICAL REMINDERS"
 F  S IDX=$O(^TMP($J,"XPARRSTR",IDX)) Q:'IDX  D
 . N PAR,INST,VAL,ERR
 . S PAR=$P(^TMP($J,"XPARRSTR",IDX,"KEY"),U),INST=$P(^("KEY"),U,2)
 . M VAL=^TMP($J,"XPARRSTR",IDX,"VAL")
 . D EN^XPAR(ENT,PAR,INST,.VAL,.ERR)
 K ^TMP($J,"XPARRSTR")
 Q
