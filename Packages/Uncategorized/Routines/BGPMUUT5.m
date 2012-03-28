BGPMUUT5 ;IHS/MSC/MGH - Find lab results for date range ;02-Mar-2011 16:47;DU
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 Q
LAB(DATA,DFN,TAX,BDATE,EDATE) ; EP
 ;This function is designed to see if the patient has any labs
 ;in the given taxonomy in the date range
 ;
 N LRDFN,MAX,IDT,BGP1,BGP2,CNT,IEN
 S IEN=$O(^ATXAX("B",TAX,0))
 Q:IEN=""
 S MAX=9999
 S BGP2=9999999-$P(BDATE,"."),BGP1=9999999-$P(EDATE,".")-.24
 Q:'$D(^DPT(DFN,"LR"))  S LRDFN=+^DPT(DFN,"LR")
 S IDT=BGP1,CNT=0 F  S IDT=$O(^LR(LRDFN,"CH",IDT)) Q:IDT=""!(IDT>BGP2)  D:CNT'>MAX CHSET
 Q
CHSET ;Finds and evaluates chemistry tests
 N CDT,SITE,SPEC,PTR
 S CDT=+^LR(LRDFN,"CH",IDT,0),SITE=$P(^(0),U,5)
 S SPEC=$P($G(^LAB(61,SITE,0)),U,1),CNT=CNT+1
 S PTR=1 F  S PTR=$O(^LR(LRDFN,"CH",IDT,PTR)) Q:PTR<1  D NXTST
 Q
NXTST ;Visit next node in
 N RESULT,FLAG,TEST,TNM,DESCR,%,THER,UNIT,HI,LO,CIS,LOINC
 S RESULT=$P(^LR(LRDFN,"CH",IDT,PTR),U),FLAG=$P(^(PTR),U,2),CIS=""
 I FLAG["*" S FLAG=$S(FLAG="L*":"LL",FLAG="H*":"HH",1:FLAG)
 S TEST=$O(^LAB(60,"C","CH;"_PTR_";1",0)) Q:TEST'>0
 S TNM=$P(^LAB(60,TEST,0),U,1)
 S LOINC=$P($G(^LAB(60,TEST,1,SITE,95.3)),U,1)
 Q:LOINC=""
 S %=$P($G(^LAB(95.3,LOINC,0)),U)_"-"_$P($G(^LAB(95.3,LOINC,0)),U,15)
 I $D(^ATXAX(IEN,21,"B",%)) D
 .S DATA(IDT)=RESULT
 Q
