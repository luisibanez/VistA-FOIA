ICPTAU ;DLS/DEK/KER - CPT Annual Update Protocol for CPT Codes ; 10/22/2003
 ;;6.0;CPT/HCPCS;**14,16**;May 19, 1997
 ;
 ; Quit Update if NOT CPT Procedure Related 
 ;
 ;   XQORQUIT  Signals the Unwinder to not process 
 ;             any protocols that are subordinate to 
 ;             the current protocol.  Control is passed
 ;             to the next sibling protocol.
 ;
 S:'$D(LEXSCHG(757.9,"B",81))&('$D(LEXSCHG(757.9,"B",81.3))) XQORQUIT=1
 Q
