10 PUT &2, 12
20 X=0: Y=0
30 P=X+16*Y+1
40 @D(P)="X"
50 GET &2, A : IF A=0 THEN 50
60 A$=A
70 @D(P)=" "
80 IF A$="4" AND Y>0 THEN Y=Y-1
90 IF A$="3" AND Y<1 THEN Y=Y+1
100 IF A$="1" AND X>0 THEN X=X-1
110 IF A$="2" AND X<15 THEN X=X+1
120 IF A=10 GOSUB 200
130 DELAY 300
140 GOTO 30
200 PRINT "Selected", X, Y
210 DELAY 500
220 RETURN
