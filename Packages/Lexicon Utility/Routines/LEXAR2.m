LEXAR2 ; ISL Look-up Response (up arrow/jump/null); 09-23-96
 ;;2.0;LEXICON UTILITY;;Sep 23, 1996
 ;
UPA(LEXUR) ; Up-Arrow Detected
 I LEXUR="^^" S X=LEXUR D EDA^LEXAR Q
 N LEXR S LEXR=$P(LEXUR,"^",2,299)
 I +LEXR>0,+LEXR'>LEX D JMP Q
 S LEXUR=$E(LEXUR,1) I LEXUR="^",+LEXR=0 S X=LEXUR D EDU^LEXAR Q
 Q
NULL ; Null response
 N LEXEOA,LEXN S LEXEOA=+($P($G(LEX("LIST",0)),"^",1))
 I LEXEOA=0 D EDA^LEXAR Q
 S LEX=+($G(^TMP("LEXSCH",$J,"NUM",0))) I LEX=0 D EDA^LEXAR Q
 I LEXEOA=LEX!(LEXEOA>LEX) D EDU^LEXAR Q
 I LEXEOA'=LEX,LEXEOA<LEX D LIST^LEXAL2("PGDN")
 Q
JMP ; Jump to # on list
 S LEXR=+($G(LEXR)) Q:LEXR'>0!(LEXR>LEX)
 D LIST^LEXAL2(LEXR)
 Q