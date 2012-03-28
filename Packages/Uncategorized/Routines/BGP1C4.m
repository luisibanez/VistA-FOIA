BGP1C4 ; IHS/CMI/LAB - calc CMS measures ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
SCALL ;EP
 K BGPDATA
 D SCIP^BGP1CU5(DFN,$P($P(BGPVSIT0,U),"."),$$DSCH^BGP1CU(BGPVINP),.BGPDATA)
 Q:'$D(BGPDATA)
 K BGPDATA
 I $$AGE^AUPNPAT(DFN,$P($P(BGPVSIT0,U),"."))<18 Q  ; no one under 18 at admission date
 S ^XTMP("BGP1C1",BGPJ,BGPH,"LIST",BGPIND,BGPPLSTL,$P(^DPT(DFN,0),U),DFN,BGPVSIT)=""
 Q
 ;
SCIP1 ;EP
 S BGPEX=""
 K BGPDATA
 D SCIP1^BGP1CU5(DFN,$P($P(BGPVSIT0,U),"."),$$DSCH^BGP1CU(BGPVINP),.BGPDATA)
 I '$D(BGPDATA) Q  ;no procedure
 I $$AGE^AUPNPAT(DFN,$P($P(BGPVSIT0,U),"."))<18 Q  ; no one under 18 at admission date
 ;exclusions
 I $$ADMPRIM^BGP1CU5(BGPVINP,"BGP CMS INFECTIOUS DXS") S BGPEX=BGPEX_"1|"
SCIP1A ;
 I $G(BGPEXCL),BGPEX]"" Q
 S ^XTMP("BGP1C1",BGPJ,BGPH,"LIST",BGPIND,BGPPLSTL,$P(^DPT(DFN,0),U),DFN,BGPVSIT)=BGPEX
 Q
 ;
SCIP3 ;EP
 S BGPEX=""
 K BGPDATA
 D SCIP1^BGP1CU5(DFN,$P($P(BGPVSIT0,U),"."),$$DSCH^BGP1CU(BGPVINP),.BGPDATA)
 I '$D(BGPDATA) Q  ;no procedure
 I $$AGE^AUPNPAT(DFN,$P($P(BGPVSIT0,U),"."))<18 Q  ; no one under 18 at admission date
 ;exclusions
 I $$ADMPRIM^BGP1CU5(BGPVINP,"BGP CMS INFECTIOUS DXS") S BGPEX=BGPEX_"1|"
 K BGPDATA
 D ANTIRX^BGP1CU3(DFN,$P($P(BGPVSIT0,U),"."),$$DSCH^BGP1CU(BGPVINP),.BGPDATA)
 I '$D(BGPDATA) S BGPEX=BGPEX_"|7"
SCIP3A ;
 I $G(BGPEXCL),BGPEX]"" Q
 S ^XTMP("BGP1C1",BGPJ,BGPH,"LIST",BGPIND,BGPPLSTL,$P(^DPT(DFN,0),U),DFN,BGPVSIT)=BGPEX
 Q
 ;
