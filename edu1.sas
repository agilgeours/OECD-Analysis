data testscores;
input location $ Gender Reading Math;
datalines;
AUS	0	487	494
AUS	1	519	488
AUT	0	471	505
AUT	1	499	492
BEL	0	482	514
BEL	1	504	502
CAN	0	506	514
CAN	1	535	510
CZE	0	474	501
CZE	1	507	498
DNK	0	486	511
DNK	1	516	507
FIN	0	495	504
FIN	1	546	510
FRA	0	480	499
FRA	1	505	492
DEU	0	486	503
DEU	1	512	496
GRC	0	437	452
GRC	1	479	451
HUN	0	463	486
HUN	1	489	477
ISL	0	454	490
ISL	1	494	500
IRL	0	506	503
IRL	1	530	497
ITA	0	464	494
ITA	1	489	479
JPN	0	493	532
JPN	1	514	522
KOR	0	503	528
KOR	1	526	524
LUX	0	456	487
LUX	1	485	480
MEX	0	415	415
MEX	1	426	403
NLD	0	470	520
NLD	1	499	519
NZL	0	491	499
NZL	1	520	490
NOR	0	476	497
NOR	1	523	505
POL	0	495	516
POL	1	528	515
PRT	0	480	497
PRT	1	504	488
SVK	0	441	488
SVK	1	475	484
SWE	0	489	502
SWE	1	523	503
CHE	0	469	519
CHE	1	500	512
TUR	0	453	456
TUR	1	478	451
GBR	0	494	508
GBR	1	514	496
USA	0	494	482
USA	1	517	474
BRA	0	400	388
BRA	1	426	379
CHL	0	442	421
CHL	1	462	414
EST	0	508	528
EST	1	538	519
IDN	0	358	374
IDN	1	383	383
ISR	0	445	458
ISR	1	493	467
RUS	0	466	490
RUS	1	491	485
SVN	0	475	509
SVN	1	517	509
LVA	0	462	500
LVA	1	495	493
COL	0	407	401
COL	1	417	381
CRI	0	419	411
CRI	1	434	394
LTU	0	457	480
LTU	1	496	482
;
proc sgplot data=testscores;
	title 'Math Score as a Confounding Factor Related to Reading Score' ;
	reg x= Reading y=Math / Group = Gender;
run;
proc anova data=testscores;
	class gender;
	model reading = gender;
	means gender;
run;

proc reg data=testscores;
	title 'Regression Analysis Reading Score by Math Score';
	model Reading = Math;
	plot Reading*Math;
run;

