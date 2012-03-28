BGP9C2 ; IHS/CMI/LAB - calc CMS measures 26 Sep 2004 11:28 AM 04 May 2008 2:38 PM ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
HFALL ;EP
 ;was there an AMI pov on this visit
 Q:'$$HFDX^BGP9CU(BGPVSIT)
 I $$AGE^AUPNPAT(DFN,$P($P(BGPVSIT0,U),"."))<18 Q  ; no one under 18 at admission date
 I $$LVADEX^BGP9CU(DFN,$P($P(BGPVSIT0,U),"."),$$DSCH^BGP9CU(BGPVINP)) Q  ;
 S ^XTMP("BGP9C1",BGPJ,BGPH,"LIST",BGPIND,BGPPLSTL,$P(^DPT(DFN,0),U),DFN,BGPVSIT)=""
 Q
 ;
HF1 ;EP
 S BGPEX=""
 Q:'$$HFDX^BGP9CU(BGPVSIT)
 I $$AGE^AUPNPAT(DFN,$P($P(BGPVSIT0,U),"."))<18 Q  ; no one under 18 at admission date
 I '$$REGDSCH^BGP9CU(BGPVINP) Q  ;not regular discharge so don't count this patient
 I $$LVADEX^BGP9CU(DFN,$P($P(BGPVSIT0,U),"."),$$DSCH^BGP9CU(BGPVINP)) S BGPEX=1
HF1A ;
 I $G(BGPEXCL),BGPEX]"" Q
 S ^XTMP("BGP9C1",BGPJ,BGPH,"LIST",BGPIND,BGPPLSTL,$P(^DPT(DFN,0),U),DFN,BGPVSIT)=BGPEX
 Q
 ;
HF2 ;EP
 S BGPEX=""
 Q:'$$HFDX^BGP9CU(BGPVSIT)
 I $$AGE^AUPNPAT(DFN,$P($P(BGPVSIT0,U),"."))<18 Q  ; no one under 18 at admission date
 I $$LVADEX^BGP9CU(DFN,$P($P(BGPVSIT0,U),"."),$$DSCH^BGP9CU(BGPVINP)) S BGPEX=1
 I $$DEATHAMA^BGP9CU(BGPVINP) S BGPEX=BGPEX_"|2"  ;HF exclusion 2 death or ama
HF2A ;
 I $G(BGPEXCL),BGPEX]"" Q
 S ^XTMP("BGP9C1",BGPJ,BGPH,"LIST",BGPIND,BGPPLSTL,$P(^DPT(DFN,0),U),DFN,BGPVSIT)=BGPEX
 Q
 ;
HF3 ;EP
 S BGPEX=""
 Q:'$$HFDX^BGP9CU(BGPVSIT)
 I $$AGE^AUPNPAT(DFN,$P($P(BGPVSIT0,U),"."))<18 Q  ; no one under 18 at admission date
 K BGPDATA S BGPLVSD=0
 D LVSD^BGP9CU1(DFN,$$FMADD^XLFDT($$DSCH^BGP9CU(BGPVINP),-365),$$DSCH^BGP9CU(BGPVINP),.BGPDATA)
 I $D(BGPDATA) S BGPLVSD=1
 K BGPDATA S BGPEJEC=0
 D EJECFRAC^BGP9CU1(DFN,$$FMADD^XLFDT($$DSCH^BGP9CU(BGPVINP),-365),$$DSCH^BGP9CU(BGPVINP),.BGPDATA)
 I $D(BGPDATA) S BGPEJEC=1
 I 'BGPLVSD,'BGPEJEC Q  ;no lsvd or ejection fraction
 I $$LVADEX^BGP9CU(DFN,$P($P(BGPVSIT0,U),"."),$$DSCH^BGP9CU(BGPVINP)) S BGPEX=1
 I $$DEATHAMA^BGP9CU(BGPVINP) S BGPEX=BGPEX_"|2"  ;HF exclusion 2 death or ama
 I $$ACEALLEG^BGP9CU1(DFN,$$DOB^AUPNPAT(DFN),$$DSCH^BGP9CU(BGPVINP)),$$ARBALLEG^BGP9CU1(DFN,$$DOB^AUPNPAT(DFN),$$DSCH^BGP9CU(BGPVINP)) S BGPEX=BGPEX_"|6"
 I $$SAORSTEN^BGP9CU1(DFN,$$FMADD^XLFDT($$DSCH^BGP9CU(BGPVINP),-365),$$DSCH^BGP9CU(BGPVINP)) S BGPEX=BGPEX_"|7"
HF3A ;
 I $G(BGPEXCL),BGPEX]"" Q
 S ^XTMP("BGP9C1",BGPJ,BGPH,"LIST",BGPIND,BGPPLSTL,$P(^DPT(DFN,0),U),DFN,BGPVSIT)=BGPEX
 Q
 ;
 ;
HF4 ;EP
 S BGPEX=""
 Q:'$$HFDX^BGP9CU(BGPVSIT)
 I $$AGE^AUPNPAT(DFN,$P($P(BGPVSIT0,U),"."))<18 Q  ; no one under 18 at admission date
 K BGPDATA
 D SMOKER^BGP9CU2(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-365),$$DSCH^BGP9CU(BGPVINP),.BGPDATA)
 I '$D(BGPDATA) Q  ;not a smoker
 I $$LVADEX^BGP9CU(DFN,$P($P(BGPVSIT0,U),"."),$$DSCH^BGP9CU(BGPVINP)) S BGPEX=1
 I $$DEATHAMA^BGP9CU(BGPVINP) S BGPEX=BGPEX_"|2"  ;HF exclusion 2 death or ama
HF4A ;
 I $G(BGPEXCL),BGPEX]"" Q
 S ^XTMP("BGP9C1",BGPJ,BGPH,"LIST",BGPIND,BGPPLSTL,$P(^DPT(DFN,0),U),DFN,BGPVSIT)=BGPEX
 Q
 ;
