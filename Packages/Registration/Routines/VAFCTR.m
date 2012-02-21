VAFCTR ;BIR/CMC-Monitoring fields for MPI/PD via DG field monitoring ;9/25/2003
 ;;5.3;Registration;**575,648**;Aug 13, 1993
 Q  ; quit if called from the top
 ;
MPIPD ; protocol entry point for monitoring fields via DG field monitoring
 ; Currently monitoring for fields:
 ; 1 ALIAS - .01 of the multiple
 ; 2 RACE INFORMATION - .01 of the multiple
 ; 6 ETHNICITY INFORMATION - .01 of the multiple
 ; 994 MULTIPLE BIRTH INDICATOR
 ; 361 PATIENT ELIGIBILITIES - .01 of the multiple - MOVED TO 691
 ; .525 POW STAUTS INDICATED?
 ;
 I $G(DGFILE)'=2&($G(DGFILE)'=2.01)&($G(DGFILE)'=2.02)&($G(DGFILE)'=2.06)&($G(DGFILE)'=2.0361) Q
 S DGFIELD=$G(DGFIELD)
 I DGFIELD'=.01&(DGFIELD'=994)&(DGFIELD'=.525) Q
 I $T(AVAFC^VAFCDD01)="" Q
 I (DGFIELD=994)!(DGFIELD=.525) S VAFCF=DGFIELD_";" D AVAFC^VAFCDD01(DGDA)
 ; ^ MULTIPLE BIRTH INDICATOR
 I DGFILE=2.01 S VAFCF="1;" D AVAFC^VAFCDD01(DGDA(1)) ;ALIAS
 I DGFILE=2.02 S VAFCF="2.02,.01;" D AVAFC^VAFCDD01(DGDA(1))
 ; ^ RACE INFORMATION
 I DGFILE=2.06 S VAFCF="2.06,.01;" D AVAFC^VAFCDD01(DGDA(1))
 ; ^ ETHNICITY INFORMATION
 ; MOVED TO DG*5.3*691
 ;I DGFILE=2.0361 S VAFCF="2.0361,.01;" D AVAFC^VAFCDD01(DGDA(1))
 ; ^ PATIENT ELIGIBILITIES
 Q
