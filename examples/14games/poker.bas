2 REM "POKER"
4 REM "Ported by Stefan in 2022"
6 REM 
8 @R=MILLIS(1)
10 DIM A(50),B(15)
20 DEF FNA(X)=INT(10*RND(1))
30 DEF FNB(X)=X-100*INT(X/100)
40 PRINT "WELCOME TO THE CASINO.  WE EACH HAVE $200."
50 PRINT "I WILL OPEN THE BETTING BEFORE THE DRAW; YOU OPEN AFTER."
60 PRINT "TO FOLD BET 0; TO CHECK BET .5."
70 PRINT "ENOUGH TALK -- LET'S GET DOWN TO BUSINESS."
80 PRINT
90 LET O=1
100 LET C=200
110 LET S=200
120 LET P=0
130 REM
140 PRINT
150 IF C<=5 THEN 3670
160 PRINT "THE ANTE IS $5.  I WILL DEAL:"
170 PRINT
180 IF S>5 THEN 200
190 GOSUB 3830
200 LET P=P+10
210 LET S=S-5
220 LET C=C-5
230 FOR Z=1 TO 10
240 GOSUB 1740
250 NEXT Z
260 PRINT "YOUR HAND:"
270 N=1
280 GOSUB 1850
290 N=6
300 I=2
310 GOSUB 2170
320 PRINT
330 IF I<>6 THEN 470
340 IF FNA(0)<=7 THEN 370
350 LET X=11100
360 GOTO 420
370 IF FNA(0)<=7 THEN 400
380 LET X=11110
390 GOTO 420
400 IF FNA(0)>=1 THEN 450
410 X=11111
420 I=7
430 Z=23
440 GOTO 580
450 Z=1
460 GOTO 510
470 IF U>=13 THEN 540
480 IF FNA(0)>=2 THEN 500
490 GOTO 420
500 Z=0
510 K=0
520 PRINT "I CHECK."
530 GOTO 620
540 IF U<=16 THEN 570
550 Z=2
560 IF FNA(0)>=1 THEN 580
570 Z=35
580 V=Z+FNA(0)
590 GOSUB 3480
600 PRINT "I'LL OPEN WITH $"; V
610 K=V
620 GOSUB 3050
630 GOSUB 650
640 GOTO 820
650 IF I<>3 THEN 760
660 PRINT
670 PRINT "I WIN."
680 C=C+P
690 PRINT "NOW I HAVE $"; C; "AND YOU HAVE $"; S
700 PRINT "DO YOU WISH TO CONTINUE";
710 INPUT H$
720 IF H$="YES" OR H$="yes" THEN 120
730 IF H$="NO" OR H$="no" THEN 4100
740 PRINT "ANSWER YES OR NO, PLEASE."
750 GOTO 700
760 IF I<>4 THEN 810
770 PRINT
780 PRINT "YOU WIN."
790 S=S+P
800 GOTO 690
810 RETURN
820 PRINT
830 PRINT "NOW WE DRAW -- HOW MANY CARDS DO YOU WANT";
840 INPUT T
850 IF T=0 THEN 980
860 Z=10
870 IF T<4 THEN 900
880 PRINT "YOU CAN'T DRAW MORE THAN THREE CARDS."
890 GOTO 840
900 PRINT "WHAT ARE THEIR NUMBERS:"
910 FOR Q=1 TO T
920 INPUT U
930 GOSUB 1730
940 NEXT Q
950 PRINT "YOUR NEW HAND:"
960 N=1
970 GOSUB 1850
980 Z=10+T
990 FOR U=6 TO 10
1000 IF INT(X/POW(10,(U-6)))<>10*INT(X/POW(10,(U-5))) THEN 1020
1010 GOSUB 1730
1020 NEXT U
1030 PRINT
1040 PRINT "I AM TAKING"; Z-10-T; "CARD";
1050 IF Z=11+T THEN 1090
1060 PRINT "S"
1070 PRINT
1080 GOTO 1100
1090 PRINT
1100 N=6
1110 V=I
1120 I=1
1130 GOSUB 2170
1140 B=U
1150 M=D
1160 IF V<>7 THEN 1190
1170 Z=28
1180 GOTO 1330
1190 IF I<>6 THEN 1220
1200 Z=1
1210 GOTO 1330
1220 IF U>=13 THEN 1270
1230 Z=2
1240 IF FNA(0)<>6 THEN 1260
1250 Z=19
1260 GOTO 1330
1270 IF U>=16 THEN 1320
1280 Z=19
1290 IF FNA(0)<>8 THEN 1310
1300 Z=11
1310 GOTO 1330
1320 Z=2
1330 K=0
1340 GOSUB 3050
1350 IF T<>.5 THEN 1450
1360 IF V=7 THEN 1400
1370 IF I<>6 THEN 1400
1380 PRINT "I'LL CHECK"
1390 GOTO 1460
1400 V=Z+FNA(0)
1410 GOSUB 3480
1420 PRINT "I'LL BET $";V
1430 K=V
1440 GOSUB 3060
1450 GOSUB 650
1460 PRINT
1470 PRINT "NOW WE COMPARE HANDS:"
1480 J$=H$
1490 K$=I$
1500 PRINT "MY HAND:"
1510 N=6
1520 GOSUB 1850
1530 N=1
1540 GOSUB 2170
1550 PRINT
1560 PRINT "YOU HAVE ";
1570 K=D
1580 GOSUB 3690
1590 H$=J$
1600 I$=K$
1610 K=M
1620 PRINT "AND I HAVE ";
1630 GOSUB 3690
1640 IF B>U THEN 670
1650 IF U>B THEN 780
1660 IF H$="A FLUS" THEN 1700
1662 IF FNB(M)<FNB(D) THEN 780
1664 IF FNB(M)>FNB(D) THEN 670
1670 PRINT "THE HAND IS DRAWN."
1680 PRINT "ALL $";P; " REMAINS IN THE POT."
1690 GOTO 140
1700 IF FNB(M)>FNB(D) THEN 670
1710 IF FNB(D)>FNB(M) THEN 780
1720 GOTO 1670
1730 Z=Z+1
1740 A(Z)=100*INT(4*RND(1))+INT(100*RND(1))
1750 IF INT(A(Z)/100)>3 THEN 1740
1760 IF A(Z)-100*INT(A(Z)/100)>12 THEN 1740
1765 IF Z=1 THEN 1840
1770 FOR K=1 TO Z-1
1780 IF A(Z)=A(K) THEN 1740
1790 NEXT K
1800 IF Z<=10 THEN 1840
1810 N=A(U)
1820 A(U)=A(Z)
1830 A(Z)=N
1840 RETURN
1850 FOR Z=N TO N+4
1860 PRINT Z;"--  ";
1870 GOSUB 1950
1880 PRINT " OF";
1890 GOSUB 2070
1900 IF Z/2<>INT(Z/2) THEN 1920
1910 PRINT
1920 NEXT Z
1930 PRINT
1940 RETURN
1950 K=FNB(A(Z))
1960 IF K<>9 THEN 1980
1970 PRINT "JACK";
1980 IF K<>10 THEN 2000
1990 PRINT "QUEEN";
2000 IF K<>11 THEN 2020
2010 PRINT "KING";
2020 IF K<>12 THEN 2040
2030 PRINT "ACE";
2040 IF K>=9 THEN 2060
2050 PRINT K+2;
2060 RETURN
2070 K=INT(A(Z)/100)
2080 IF K<>0 THEN 2100
2090 PRINT " CLUBS",
2100 IF K<>1 THEN 2120
2110 PRINT " DIAMONDS",
2120 IF K<>2 THEN 2140
2130 PRINT " HEARTS",
2140 IF K<>3 THEN 2160
2150 PRINT " SPADES",
2160 RETURN
2170 U=0
2180 FOR Z=N TO N+4
2190 B(Z)=FNB(A(Z))
2200 IF Z=N+4 THEN 2230
2210 IF INT(A(Z)/100)<>INT(A(Z+1)/100) THEN 2230
2220 U=U+1
2230 NEXT Z
2240 IF U<>4 THEN 2310
2250 X=11111
2260 D=A(N)
2270 H$="A FLUS"
2280 I$="H IN"
2290 U=15
2300 RETURN
2310 FOR Z=N TO N+3
2320 FOR K=Z+1 TO N+4
2330 IF B(Z)<=B(K) THEN 2390
2340 X=A(Z)
2350 A(Z)=A(K)
2360 B(Z)=B(K)
2370 A(K)=X
2380 B(K)=A(K)-100*INT(A(K)/100)
2390 NEXT K
2400 NEXT Z
2410 X=0
2420 FOR Z=N TO N+3
2430 IF B(Z)<>B(Z+1) THEN 2470
2440 X=X+11*10^(Z-N)
2450 D=A(Z)
2460 GOSUB 2760
2470 NEXT Z
2480 IF X<>0 THEN 2620
2490 IF B(N)+3<>B(N+3) THEN 2520
2500 X=1111
2510 U=10
2520 IF B(N+1)+3<>B(N+4) THEN 2620
2530 IF U<>10 THEN 2600
2540 U=14
2550 H$="STRAIG"
2560 I$="HT"
2570 X=11111
2580 D=A(N+4)
2590 RETURN
2600 U=10
2610 X=11110
2620 IF U>=10 THEN 2690
2630 D=A(N+4)
2640 H$="SCHMAL"
2650 I$="TZ, "
2660 U=9
2670 X=11000
2680 GOTO 2740
2690 IF U<>10 THEN 2720
2700 IF I=1 THEN 2740
2710 GOTO 2750
2720 IF U>12 THEN 2750
2730 IF FNB(D)>6 THEN 2750
2740 I=6
2750 RETURN
2760 IF U>=11 THEN 2810
2770 U=11
2780 H$="A PAIR"
2790 I$=" OF "
2800 RETURN
2810 IF U<>11 THEN 2910
2820 IF B(Z)<>B(Z-1) THEN 2870
2830 H$="THREE"
2840 I$=" "
2850 U=13
2860 RETURN
2870 H$="TWO P"
2880 I$="AIR, "
2890 U=12
2900 RETURN
2910 IF U>12 THEN 2960
2920 U=16
2930 H$="FULL H"
2940 I$="OUSE, "
2950 RETURN
2960 IF B(Z)<>B(Z-1) THEN 3010
2970 U=17
2980 H$="FOUR"
2990 I$=" "
3000 RETURN
3010 U=16
3020 H$="FULL H"
3030 I$="OUSE, "
3040 RETURN
3050 G=0
3060 PRINT:PRINT "WHAT IS YOUR BET";
3070 INPUT T
3080 IF T-INT(T)=0 THEN 3140
3090 IF K<>0 THEN 3120
3100 IF G<>0 THEN 3120
3110 IF T=.5 THEN 3410
3120 PRINT "NO SMALL CHANGE, PLEASE."
3130 GOTO 3060
3140 IF S-G-T>=0 THEN 3170
3150 GOSUB 3830
3160 GOTO 3060
3170 IF T<>0 THEN 3200
3180 I=3
3190 GOTO 3380
3200 IF G+T>=K THEN 3230
3210 PRINT "IF YOU CAN'T SEE MY BET, THEN FOLD."
3220 GOTO 3060
3230 G=G+T
3240 IF G=K THEN 3380
3250 IF Z<>1 THEN 3420
3260 IF G>5 THEN 3300
3270 IF Z>=2 THEN 3350
3280 V=5
3290 GOTO 3420
3300 IF Z=1 THEN 3320
3310 IF T<=25 THEN 3350
3320 I=4
3330 PRINT "I FOLD."
3340 RETURN
3350 IF Z=2 THEN 3430
3360 PRINT "I'LL SEE YOU."
3370 K=G
3380 S=S-G
3390 C=C-K
3400 P=P+G+K
3410 RETURN
3420 IF G>3*Z THEN 3350
3430 V=G-K+FNA(0)
3440 GOSUB 3480
3450 PRINT "I'LL SEE YOU, AND RAISE YOU ";V
3460 K=G+V
3470 GOTO 3060
3480 IF C-G-V>=0 THEN 3660
3490 IF G<>0 THEN 3520
3500 V=C
3510 RETURN
3520 IF C-G>=0 THEN 3360
3530 IF (O/2)<>INT(O/2) THEN 3600
3540 PRINT "WOULD YOU LIKE TO BUY BACK YOUR WATCH FOR $50";
3550 INPUT J$
3560 IF J$(1,1)="N" OR J$(1,1)="n" THEN 3600
3570 C=C+50
3580 O=O/2
3590 RETURN
3600 IF O/3<>INT(O/3) THEN 3670
3610 PRINT "WOULD YOU LIKE TO BUY BACK YOUR TIE TACK FOR $50";
3620 INPUT J$
3630 IF J$(1,1)="N" OR J$(1,1)="n" THEN 3670
3640 C=C+50
3650 O=O/3
3660 RETURN
3670 PRINT "I'M BUSTED.  CONGRATULATIONS!"
3680 STOP
3690 PRINT H$;I$;
3700 IF H$<>"A FLUS" THEN 3750
3710 K=INT(K/100)
3720 GOSUB 2080
3730 PRINT
3740 RETURN
3750 K=FNB(K)
3760 GOSUB 1960
3770 IF H$="SCHMAL" THEN 3790
3780 IF H$<>"STRAIG" THEN 3810
3790 PRINT " HIGH"
3800 RETURN
3810 PRINT "'S"
3820 RETURN
3830 PRINT
3840 PRINT "YOU CAN'T BET WITH WHAT YOU HAVEN'T GOT."
3850 IF O/2=INT(O/2) THEN 3970
3860 PRINT "WOULD YOU LIKE TO SELL YOUR WATCH";
3870 INPUT J$
3880 IF J$(1, 1)="N" OR J$(1, 1)="n" THEN 3970
3890 IF FNA(0)>=7 THEN 3930
3900 PRINT "I'LL GIVE YOU $75 FOR IT."
3910 S=S+75
3920 GOTO 3950
3930 PRINT "THAT'S A PRETTY CRUMMY WATCH - I'LL GIVE YOU $25."
3940 S=S+25
3950 O=O*2
3960 RETURN
3970 IF O/3<>INT(O/3) THEN 4090
3980 PRINT "WILL YOU PART WITH THAT DIAMOND TIE TACK":
3990 INPUT J$
4000 IF J$(1, 1)="N" OR J$(1, 1)="n" THEN 4080
4010 IF FNA(0)>=6 THEN 4050
4020 PRINT "YOU ARE NOW $100 RICHER."
4030 S=S+100
4040 GOTO 4070
4050 PRINT "IT'S PASTE.  $25."
4060 S=S+25
4070 O=O*3
4080 RETURN
4090 PRINT "YOUR WAD IS SHOT.  SO LONG, SUCKER!"
4100 END
