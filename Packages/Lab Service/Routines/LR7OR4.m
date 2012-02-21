LR7OR4 ;slc/dcm - Get Lab TEST Info ;8/11/97
 ;;5.2;LAB SERVICE;**256**;Sep 27, 1994
 ;Entry points:  EN
GET(TEST) ;Get TEST ifn
 I '$D(TEST) Q ""
 I TEST'?1N.N S TEST=$O(^LAB(60,"B",TEST,0)) Q:'TEST ""
 I TEST?1N.N Q:'$D(^LAB(60,TEST)) ""
 Q TEST
ONE(Y,TEST) ;Gets parameters for one test
 N CNT
 Q:'$L($G(TEST))
 S CNT=0,TEST=+TEST
 D EN
 Q
ALL(Y,TESTS) ;Gets Lab Test ordering parameters from file 60
 ;TEST=Lab TEST (can be either name or internal #)
 N I,CNT
 Q:'$O(TESTS(0))
 S (I,CNT)=0
 F  S I=$O(TESTS(I)) Q:'I  S TEST=+TESTS(I) D EN S CNT=CNT+1,Y(CNT)="---------------------"
 Q
EN Q:'$D(TEST)
 N X0
 S TEST=$$GET(TEST) Q:'TEST
 S X0=^LAB(60,TEST,0),CNT=CNT+1,Y(CNT)=$P(X0,"^",1)
 I $L($P(X0,"^",11)) S Y(CNT)=Y(CNT)_"   $"_$J($P(X0,"^",11),4,2)
 D URG
 D GCOM
 I $P(X0,"^",8),$O(^LAB(60,TEST,3,0)) S X=$G(^($O(^(0)),0)),CNT=CNT+1,Y(CNT)="Unique collection sample: "_$$SAMP(+X) ;$P($G(^LAB(62,+X,0)),"^")
 I $P(X0,"^",9) S I=0 F  S I=$O(^LAB(60,TEST,3,I)) Q:I<1  S X=+^(I,0) I X=$P(X0,"^",9) S CNT=CNT+1,Y(CNT)="Lab collect sample: "_$$SAMP(X) Q  ;$P($G(^LAB(62,X,0)),"^") Q
 ;I $O(^LAB(60,TEST,3,0)) S X=$G(^($O(^(0)),0)),CNT=CNT+1,Y(CNT)="Default collection sample: "_$P($G(^LAB(62,+X,0)),"^")
 D COLL,SUB
 Q
COLL ;Get Collection Sample-Specimen data
 N I,J,X,SAMP,SPEC,CHK
 S I=0
 F  S I=$O(^LAB(60,TEST,3,I)) Q:I<1  S X=^(I,0) D
 . S CNT=CNT+1,Y(CNT)="Collection sample: "_$$SAMP(X,$P(X0,"^",19))
 . I $L($P(X,"^",2)) S CNT=CNT+1,Y(CNT)="     Form name/number: "_$P(X,"^",2)
 . I $L($P(X,"^",4)) S CNT=CNT+1,Y(CNT)="     Minimum volume (in mls): "_$P(X,"^",4)
 . I $L($P(X,"^",5)) S CNT=CNT+1,Y(CNT)="     Maximum order frequency: "_$P(X,"^",5)
 . I $L($P(X,"^",7)) S CNT=CNT+1,Y(CNT)="     Maximum daily order frequency: "_$P(X,"^",7)
 . I $O(^LAB(60,TEST,3,I,1,0)) S CNT=CNT+1,Y(CNT)="     Collection sample instructions: " D
 .. S J=0 F  S J=$O(^LAB(60,TEST,3,I,1,J)) Q:J<1  S CNT=CNT+1,Y(CNT)="          "_^(J,0)
 ;. I $O(^LAB(60,TEST,3,I,2,0)) S CNT=CNT+1,Y(CNT)="     Collection sample LAB processing instructions: " D
 ;.. S J=0 F  S J=$O(^LAB(60,TEST,3,I,2,J)) Q:J<1  S CNT=CNT+1,Y(CNT)="          "_^(J,0)
 S I=0
 F  S I=$O(^LAB(60,TEST,1,I)) Q:I<1  S X=^(I,0) D
 . S CNT=CNT+1,Y(CNT)="Site/Specimen: "_$P($G(^LAB(61,+X,0)),"^")
 . I $L($P(X,"^",2,3))>1 S CNT=CNT+1,Y(CNT)="     Reference range: "_$P(X,"^",2)_$S($L($P(X,"^",3)):" - "_$P(X,"^",3),1:"")
 . I $L($P(X,"^",11,12))>1 S CNT=CNT+1,Y(CNT)="     Therapeutic range: "_$P(X,"^",11)_$S($L($P(X,"^",12)):" - "_$P(X,"^",12),1:"")
 . I $L($P(X,"^",4,5))>1 S CNT=CNT+1,Y(CNT)="     Critical range: "_$P(X,"^",4)_$S($L($P(X,"^",5)):" - "_$P(X,"^",5),1:"")
 . I $L($P(X,"^",7)) S CNT=CNT+1,Y(CNT)="     Units: "_$P(X,"^",7)
 . I $O(^LAB(60,TEST,1,I,1,0)) S CNT=CNT+1,Y(CNT)="     Interpretation: "
 . S J=0 F  S J=$O(^LAB(60,TEST,1,I,1,J)) Q:'J  S X=^(J,0),CNT=CNT+1,Y(CNT)="          "_X
 Q
URG ;Get Urgency params for TEST
 N I,X,URG
 I $P(X0,"^",18) S CNT=CNT+1,Y(CNT)="Default urgency: "_$P($G(^LAB(62.05,+$P(X0,"^",18),0)),"^")
 I $P(X0,"^",16) S CNT=CNT+1,Y(CNT)="Highest urgency allowed: "_$P($G(^LAB(62.05,+$P(X0,"^",16),0)),"^")
 Q
SAMP(X,REQ) ;Build Collection Sample data
 ;X=zero node from ^LAB(60,TEST,3,ifn,0) or ptr to 62
 ;REQ=Required comment from $P(^LAB(60,TEST,0),"^",19)
 N X0,Y1
 Q:'$D(^LAB(62,+X,0)) "" S X0=^(0)
 ;S REQ=$S($P(X,"^",6):$P(X,"^",6),$G(REQ):REQ,1:""),REQ=$S(REQ:$P($G(^LAB(62.07,REQ,0)),"^"),1:"")
 ;S Y1=+X_"^"_$P(X0,"^")_"^"_$P(X0,"^",2)_"^"_$P(X0,"^",3)_"^"_$P(X,"^",5)_"^"_$P(X,"^",7)_"^"_$P(X0,"^",7)_"^"_REQ
 S Y1=$P(X0,"^")_"  "_$P(X0,"^",3)
 Q Y1
GCOM ;Get General Ward & Lab Instructions
 ;TEST=ptr to TEST in file 60
 N I
 S I=0
 I $O(^LAB(60,+$G(TEST),6,0)) S CNT=CNT+1,Y(CNT)="General instructions: "
 F  S I=$O(^LAB(60,TEST,6,I)) Q:'I  S CNT=CNT+1,Y(CNT)="     "_^(I,0)
 S I=0
 ;I $O(^LAB(60,+$G(TEST),7,0)) S CNT=CNT+1,Y(CNT)="General LAB processing instructions: "
 ;F  S I=$O(^LAB(60,TEST,7,I)) Q:'I  S CNT=CNT+1,Y(CNT)="     "_^(I,0)
 Q
SUB ;Tests in panel
 N I
 S I=0
 I $O(^LAB(60,+$G(TEST),2,0)) S I=0,CNT=CNT+1,Y(CNT)="Tests included in panel: "
 F  S I=$O(^LAB(60,TEST,2,I)) Q:'I  S X=^(I,0),CNT=CNT+1,Y(CNT)="     "_$P($G(^LAB(60,+X,0)),"^")
 Q
