ORSLTR2 ; slc/dcm - Setup letters ;7/29/91  10:33 ;
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;;Dec 17, 1997
 N ORZ,ORX
 F ORZ=1:1 S ORX=$P($T(ZZ+ORZ),";;",2) Q:ORX=""  S ^UTILITY("ORSLTR",$J,$E(ORX,1))=$P(ORX,"=",2)
 Q
ZZ ;;
 ;;0=00099999000909000900900900900900090900099999
 ;;1=000000000009000090009999999009
 ;;2=00990009000909000900900900900900900900900099
 ;;3=00090009000900000900900900900900900900099099
 ;;4=00009900000009090000009009000999999900009
 ;;5=000900999009000909009000909009000909000999009
 ;;6=000999900009009090009009009009009009000990009
 ;;7=000000009009990009000009009000000909000000099
 ;;8=00099099000900900900900900900900900900099099
 ;;9=00900099000900900900900900900090900900009999
 ;; =
 ;;!=000000000000000000009099999
 ;;"=000000000000000011000000000000000011
 ;;#=000010100001111111000010100001111111000010100
 ;;$=   2  2     2 2 2   2222222   2 2 2     2  2
 ;;'=000000000000000000000000999
 ;;(=000099900000900090009000009
 ;;)=0000000000000000000090000090009000900000999
 ;;+=000001000000001000000111110000001000000001
 ;;,=0000000009000000000999
 ;;-=000001000000001000000001000000001000000001
 ;;.=0000000000000000000099
 ;;/=000100000000010000000001000000000100000000010
 ;;:=0000000000000000000000909
 ;;;=0000000009000000000999009
 ;;=000010100000010100000010100000010100000010100
 ;;?=00000009000000000900909900900000090900000009
 ;;A=0099999000000900900000900090000900900099999
 ;;B=00999999900900900900900900900900900900099099
 ;;C=00099999000900000900900000900900000900090009
 ;;D=00999999900900000900900000900900000900099999
 ;;E=009999999009009009009009009009009009009000009
 ;;F=009999999000009009000009009000009009000000009
 ;;G=000999990009000009009000009009090009009990009
 ;;H=009999999000009000000009000000009000009999999
 ;;I=000000000009000009009999999009000009
 ;;J=000900000009000000009000000009000000000999999
 ;;K=009999999000009000000090900000900090009000009
 ;;L=009999999009000000009000000009000000009
 ;;M=009999999000000090000009900000000090009999999
 ;;N=009999999000000900000009000000090000009999999
 ;;O=00099999000900000900900000900900000900099999
 ;;P=00999999900000900900000900900000900900000099
 ;;Q=00099999000900000900909000900090000900909999
 ;;R=00999999900000900900009900900090900900900099
 ;;S=00090099000900900900900900900900900900099009
 ;;T=000000009000000009009999999000000009000000009
 ;;U=000999999009000000009000000009000000000999999
 ;;V=000099999000900000009000000000900000000099999
 ;;W=009999999000900000000099000000900000009999999
 ;;X=009900099000090900000009000000090900009900099
 ;;Y=000000099000000900009999000000000900000000099
 ;;Z=009900009009090009009009009009000909009000099