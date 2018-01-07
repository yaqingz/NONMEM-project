$PROBLEM PK final
$INPUT ID TIME DV AMT TYPE
$DATA dopamin.dta IGNORE=@ IGNORE=(TYPE.EQ.0)
$SUBROUTINE ADVAN6 TOL=5
$MODEL 
COMP=(DEPOT,DEFDOSE)
COMP=(CENTRAL)

$PK
TVCL = THETA(1)
TVV = THETA(2)
TVKA = THETA(3)
V = TVV *EXP(ETA(2))
KA = TVKA *EXP(ETA(3))
KE=CL/V

$DES
DADT(1) = -KA*A(1)
DADT(2) = KA*A(1)-KE*A(2)

$ERROR
IPRED = A(2)/V
IRES = DV - IPRED
W = SQRT(SIGMA(1,1)*IPRED**2)
IF(W.EQ.0) W = 1
IWRES = IRES/W
Y = IPRED * (1+EPS(1))

$THETA (0,0.0112796) ; 1. CL
$THETA (0,1.08219) ; 2. V
$THETA (0,0.0633451) ; 3.KA

$OMEGA 0.0657943 ; 1.CL
0.0261774 ; 2.V
0 FIX ; 3.ka

$SIGMA 0.0236686 ; 1.PROPORTIONAL

$ESTIMATION METHOD=1 POSTHOC

$COVARIANCE