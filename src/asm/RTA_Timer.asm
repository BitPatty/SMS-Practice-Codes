Level Select inj@802A6710

lis r3, 0x803E
ori r3, r3, 0x9710
lis r5, 0x8040
ori r5, r5, 0x4484
lis r6, 0x817F
ori r6, r6, 0x0100
li r7, 1
stb r7, 1(r6)
lbz r4, 2(r3)
cmpwi r4, 1
ble- checkInput
cmpwi r4, 13
beq- setupPinna
b done

checkInput:

lis r6, 0x817F
ori r6, r6, 0x0100
li r7, 1
stb r7, 0(r6)
lis r6, 0x8034
ori r6, r6, 0x8048
lis r7, 0x7C08
ori r7, r7, 0x02A6
stw r7, 0(r6)
lbz r6, 1(r5)
lhz r7, 2(r5)
rlwinm r7, r7, 0, 0xFFFFFEFF
cmpwi r6, 0
bne- 0x18
cmpwi r7, 0
beq- done
cmpwi r7, 0x100
beq- done
b checkZ
cmpwi r6, 9
beq- checkSpecial
cmpwi r6,8
bne- 0x0C
li r8,512
b checkEpisode
cmpwi r6,10
bne- 0x0C
li r8,768
b checkEpisode
cmpwi r6,2
bne- 0x0C
li r8,1024
b checkEpisode
cmpwi r6,6
bne- 0x0C
li r8,1280
b checkEpisode
cmpwi r6,4
bne- 0x0C
li r8,1536
b checkEpisode
cmpwi r6,5
bne- 0x0C
li r8,2048
b checkEpisode
cmpwi r6,1
bne- done
li r8,2304

checkEpisode:

cmpwi r7,0
bne- 0x0C
li r9,0
b loadStage
cmpwi r7,64
bne- 0x0C
li r9,1
b loadStage
cmpwi r7,32
bne- 0x0C
li r9,2
b loadStage
cmpwi r7,96
bne- 0x0C
li r9,3
b loadStage
cmpwi r7,16
bne- 0x0C
li r9,4
b loadStage
cmpwi r7,80
bne- 0x0C
li r9,5
b loadStage
cmpwi r7,48
bne- 0x0C
li r9,6
b loadStage
cmpwi r7,112
bne- 0x0C
li r9,7
b loadStage
cmpwi r7, 0x400
bne- done
li r8, 0
cmpwi r6, 4
bne- 0x0C
li r9, 0x0E01
b loadStage
cmpwi r6, 10
bne- 0x0C
li r9, 0x1E00
b loadStage
cmpwi r6, 2
bne- 0x0C
li r9, 0x2100
b loadStage
cmpwi r6, 1
bne- 0x0C
li r9, 0x3900
b loadStage
cmpwi r6, 8
bne- 0x0C
li r9, 0x3700
b loadStage
cmpwi r6, 13
li r9, 0x3A00
b loadStage

checkZ:

cmpwi r7, 16
bne- checkSpecial
lis r10, -32385
lwz r8, 0(r10)
cmpwi r4, 1
beq- 0x0C
li r8, 257
b 0x10
cmpwi r8, 0
bne- 0x08
li r8, 258

loadSpecialStage:

li r9,0
b loadStage

checkSpecial:

cmpwi r7, 64
bne- 0x10
li r8, 0x1400
li r9, 0x2E00
b setupSpecialStage
cmpwi r7, 32
bne- 0x10
li r8, 0x1500
li r9, 0x3000
b setupSpecialStage
cmpwi r7, 96
bne- 0x10
li r8, 0x1600
li r9, 0x2000
b setupSpecialStage
cmpwi r7, 80
bne- 0x10
li r8, 0x1700
li r9, 0x2900
b setupSpecialStage
cmpwi r7, 48
bne- 0x10
li r8, 0x1800
li r9, 0x3300
b setupSpecialStage
cmpwi r7, 112
bne- 0x10
li r8, 0x1D00
li r9, 0x2800
b setupSpecialStage
cmpwi r7, 1024
bne- 0x10
li r8, 0x3400
li r9, 0x2A00
b setupSpecialStage
cmpwi r7, 1088
bne- 0x0C
li r9, 0x1F00
b setupSpecialStage
cmpwi r7, 2048
bne- 0x0C
li r9, 0x3A01
b setupSpecialStage
cmpwi r7, 2112
bne- 0x0C
li r9, 0x3C00
b setupSpecialStage
cmpwi r7, 16
li r9, 0x3200
beq- setupSpecialStage
li r9, 0x2F00

setupSpecialStage:

cmpwi r6, 9
beq- 0x08
b loadSpecialStage
li r8, 0

loadStage:

add r8,r8,r9
stw r8,0(r3)
lis r3,0x817F
stw r8,0(r3)
lwz r3,-0x6060(r13)
stb r9,0x00DF(r3)
b done

setupPinna:

li r8,3328
lwz r4,-4(r3)
cmpwi r4,1280
bne- 0x0C
li r9,0
b loadStage
cmpwi r4,1282
bne- 0x0C
li r9,1
b loadStage
cmpwi r4,1284
bne- 0x0C
li r9,2
b loadStage
cmpwi r4,1285
bne- 0x0C
li r9,3
b loadStage
cmpwi r4,1286
bne- 0x0C
li r9,4
b loadStage
cmpwi r4,1287
bne+ done
li r9,5
b loadStage

done:

lwz r3,32(r31)



====================================================

Start Stopwatch in Demo Mode inj@80031f68

lis r6, 0x817F
ori r6, r6, 0x0100
lbz r4, 0(r6)
cmpwi r4, 1
beq- resetStopwatch
lbz r4, 1(r6)
cmpwi r4, 1
bne+ done
lis r5, 0x803E
ori r5, r5, 0x9710
lbz r4, 2(r5)
cmpwi r4, 7
beq- done
cmpwi r4, 9
bgt- done

resetStopwatch:
lis r3, 0x8034
ori r3, r3, 0x94D8
mtlr r3
blrl
lis r5, 0x8090
ori r5, r5, 0x2B28
stw r3, 40(r5)
stw r3, 4(r6)
stw r4, 44(r5)
stw r4, 8(r6)
li r3, 0
stb r3, 0(r6)

done:
lwz r0, 0x24(sp)

====================================================

Set stop timer flag on shine touch inj@801BD3D8

lis r3, 0x817F
ori r3, r3, 0x0100
li r4, 1
stw r4, 0xC(r3)
blr

====================================================

Stop Timer on Shine Get Demo start (requires flag to be set) inj@802979d8

cmpwi r0, 3
bne+ done
lis r3, 0x817F
ori r3, r3, 0x0100
lwz r4, 0xC(r3)
cmpwi r4, 0
beq+ done
li r4, 0
stw r4, 0xC(r3)
mflr r15
lis r3,0x8056
ori r3,r3,0xDD00
mr r16,r29
lis r29,0x8028
ori r29,r29,0xE604
mtlr r29
blrl
mtlr r15
mr r29,r16
li r15,0
li r16,0

done:
lis r3, 0x803A

====================================================

Save/Load Stopwatch inj@8034802C


lis r15,0x817F
ori r15,r15,0x0100
lbz r16, 0(r15)
cmpwi r16, 1
beq- done
lwz r3,4(r15)
lwz r4,8(r15)

done:
li r16, 0
stb r16, 0(r15)
stw r3, 4(15)
stw r4, 8(r15)
stw r4,44(r31)
li r15,0

====================================================

Insert and start timer inj@80149148


mr r15, r3
mr r16, r29
lis r3, 0x817F
ori r3, r3, 0x0100
lbz r4, 1(r3)
cmpwi r4, 1
bne+ done
li r4, 0
stb r4, 1(r3)
lis r3, 0x803E
ori r3, r3, 0x9710
lhz r3, 2(r3)
cmpwi r3, 0x805
beq- done
cmpwi r3, 0x605
beq- done
cmpwi r3, 0x1E00
beq- done
lis r3, 0x8056
ori r3, r3, 0xDD00
lis r29, 0x8028
ori r29, r29, 0xE998
mtlr r29
blrl
lis r3, 0x8056
ori r3, r3, 0xDD00
lis r29, 0x8028
ori r29, r29, 0xE82C
mtlr r29
blrl

done:
mr r3, r15
mr r29, r16
li r15, 0
li r16, 0
lwz r0, 0xCC(sp)

====================================================

Set Stopwatch difference to 0 unless in stage with existing timer inj@8028E90C

lis r5, 0x803E
ori r5, r5, 0x9710
lhz r5, 2(r5)
cmpwi r5, 7680
beq- 0x34
cmpwi r5, 1025
beq- 0x2C
cmpwi r5, 2049
beq- 0x24
cmpwi r5, 2308
beq- 0x1C
cmpwi r5, 1541
beq- 0x14
cmpwi r5, 2053
beq- 0x0C
li r4,0
li r3,0
stw r4, 204(r30)
nop

====================================================

Disable stop stopwatch

04348048 blr

====================================================

Keep timer on screen:

0414A99C nop
0414D2E8 nop

====================================================


Disable argument checks

0428E9C8 nop
0428E854 nop
0428E624 nop

====================================================

Stopwatch struct

0456DD00 0
0456DD04 0
0456DD18 3
0456DD1C 2
0456DD20 8056DD24
0456DD24 0
0456DD28 1
0456DD2C 0
0456DD30 0xB4

====================================================

Pinna 8 patch

0414AC18 b 0x6C
