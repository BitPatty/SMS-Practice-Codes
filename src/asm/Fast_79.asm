@802A6710

lis r3, 0x803E
ori r3, r3, 0x9710
lbz r4, 2(r3)
cmpwi r4, 14
beq- setupCasino
cmpwi r4, 13
beq- setupPinna
cmpwi r4, 1
bgt- done

checkNextStage:

lis r3, 0x8057
ori r3, r3, 0x8988
lhz r4, 2(r3) #Gelato
andi. r5, r4, 0x4
beq+ 0x2C
lbz r4, 0xC(r3)
andi. r5, r4, 0x40
lhz r4, 2(r3)
beq+ 0xC
li r4, 0x3400
b loadStage
andi. r5, r4, 0x4000
beq+ 0xC
li r4, 0x402
b loadStage
li r6, 0
ori r6, r6, 0x8009
and r5, r6, r4
cmpw r5, r6
bne+ 0x1C
andi. r5, r4, 0x4000
beq+ 0xC
li r4, 0x406
b loadStage
li r4, 0x402
b loadStage
li r6, 0
ori r6, r6, 0x9
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x403
b loadStage
andi. r5, r4, 0x2
beq+ 0xC
li r4, 0x404
b loadStage
andi. r5, r4, 0x8
beq+ 0xC
li r4, 0x405
b loadStage
andi. r5, r4, 0x4000
beq+ 0xC
li r4, 0x403
b loadStage
andi. r5, r4, 0x2000
beq+ 0xC
li r4, 0x402
b loadStage
li r6, 0
ori r6, r6, 0x1030
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x401
b loadStage
lhz r4, 6(r3)
andi. r5, r4, 0x2
beq+ 0x20
lbz r4, 0xD(r3)
andi. r5, r4, 0x2
beq+ 0xC
li r4, 0x400
b loadStage
li r4, 0x901
b loadStage
andi. r5, r4, 0x1
beq+ 0xC
li r4, 0x907
b loadStage
li r6, 0
ori r6, r6, 0x8004
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x906
b loadStage
andi. r5, r4, 0x4000
beq+ 0xC
li r4, 0x905
b loadStage
andi. r5, r4, 0x2000
beq+ 0xC
li r4, 0x904
b loadStage
andi. r5, r4, 0x1000
beq+ 0xC
li r4, 0x903
b loadStage
li r6, 0
ori r6, r6, 0x808
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x902
b loadStage
andi. r5, r4, 0x400
beq+ 0xC
li r4, 0x901
b loadStage
lhz r4, 5(r3)
andi. r5, r4, 0x8000
beq+ 0x20
lbz r4, 0xD(r3)
andi. r5, r4, 0x1
beq+ 0xC
li r4, 0x900
b loadStage
li r4, 0x603
b loadStage
andi. r5, r4, 0x4000
beq+ 0xC
li r4, 0x607
b loadStage
andi. r5, r4, 0x2000
beq+ 0xC
li r4, 0x606
b loadStage
andi. r5, r4, 0x1000
beq+ 0xC
li r4, 0x605
b loadStage
li r6, 0
ori r6, r6, 0x802
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x604
b loadStage
andi. r5, r4, 0x400
beq+ 0xC
li r4, 0x603
b loadStage
li r6, 0
ori r6, r6, 0x201
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x602
b loadStage
andi. r5, r4, 0x100
beq+ 0xC
li r4, 0x601
b loadStage
lhz r4, 0(r3)
andi. r5, r4, 0x8000
beq+ 0x20
lbz r4, 0xC(r3)
andi. r5, r4, 0x10
beq+ 0xC
li r4, 0x600
b loadStage
li r4, 0x205
b loadStage
andi. r5, r4, 0x4000
beq+ 0xC
li r4, 0x207
b loadStage
li r6, 0
ori r6, r6, 0x2002
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x206
b loadStage
andi. r5, r4, 0x1000
beq+ 0xC
li r4, 0x205
b loadStage
andi. r5, r4, 0x800
beq+ 0xC
li r4, 0x204
b loadStage
lhz r4, 1(r3)
andi. r5, r4, 0x2
beq+ 0x20
lbz r4, 0xC(r3)
andi. r5, r4, 0x20
beq+ 0xC
li r4, 0x203
b loadStage
li r4, 0x305
b loadStage
andi. r5, r4, 0x1
beq+ 0xC
li r4, 0x307
b loadStage
andi. r5, r4, 0x8000
beq+ 0xC
li r4, 0x306
b loadStage
andi. r5, r4, 0x4000
beq+ 0xC
li r4, 0x305
b loadStage
li r6, 0
ori r6, r6, 0x2004
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x304
b loadStage
andi. r5, r4, 0x1000
beq+ 0xC
li r4, 0x303
b loadStage
li r6, 0
ori r6, r6, 0x808
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x302
b loadStage
andi. r5, r4, 0x400
beq+ 0xC
li r4, 0x301
b loadStage
lhz r4, 3(r3)
andi. r5, r4, 0x20
beq+ 0x20
lbz r4, 0xC(r3)
andi. r5, r4, 0x80
beq+ 0xC
li r4, 0x300
b loadStage
li r4, 0x504
b loadStage
andi. r5, r4, 0x10
beq+ 0xC
li r4, 0x507
b loadStage
li r6, 0
ori r6, r6, 0x88
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x506
b loadStage
andi. r5, r4, 0x4
beq+ 0xC
li r4, 0x505
b loadStage
andi. r5, r4, 0x2
beq+ 0xC
li r4, 0x504
b loadStage
andi. r5, r4, 0x1
beq+ 0xC
li r4, 0x503
b loadStage
li r6, 0
ori r6, r6, 0x8040
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x502
b loadStage
andi. r5, r4, 0x4000
beq+ 0xC
li r4, 0x501
b loadStage
lhz r4, 7(r3)
li r6, 0
ori r6, r6, 0x28
and r5, r6, r4
cmpw r5, r6
bne+ 0x20
lbz r4, 0xD(r3)
andi. r5, r4, 0x4
beq+ 0xC
li r4, 0x500
b loadStage
li r4, 0x804
b loadStage
andi. r5, r4, 0x4
beq+ 0xC
li r4, 0x807
b loadStage
andi. r5, r4, 0x2000
beq+ 0xC
li r4, 0x806
b loadStage
li r6, 0
ori r6, r6, 0x11
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x805
b loadStage
andi. r5, r4, 0x8000
beq+ 0xC
li r4, 0x804
b loadStage
andi. r5, r4, 0x4000
beq+ 0xC
li r4, 0x803
b loadStage
andi. r5, r4, 0x2
beq+ 0xC
li r4, 0x802
b loadStage
andi. r5, r4, 0x1000
beq+ 0xC
li r4, 0x801
b loadStage
lhz r4, 0(r3)
li r6, 0
ori r6, r6, 0x401
and r5, r6, r4
cmpw r5, r6
bne+ 0xC
li r4, 0x800
b loadStage
andi. r5, r4, 0x300
beq+ 0xC
li r4, 0x202
b loadStage
andi. r5, r4, 0x100
beq+ 0xC
li r4, 0x201
b loadStage
li r4, 0x200
b loadStage

loadPinna:

add r4, r8, r9

loadStage:

lis r3, 0x803E
ori r3, r3, 0x9710
stw r4, 0(r3)
rlwinm r5, r4, 0, 0xFF
lwz r3, -0x6060(r13)
stb r5, 0x00DF(r3)
b done

setupPinna:

li r8, 3328
lwz r4, -4(r3)
cmpwi r4, 1280
bne- 0x0C
li r9, 0
b loadPinna
cmpwi r4, 1282
bne- 0x0C
li r9, 1
b loadPinna
cmpwi r4, 1284
bne- 0x0C
li r9, 2
b loadPinna
cmpwi r4, 1285
bne- 0x0C
li r9, 3
b loadPinna
cmpwi r4, 1286
bne- 0x0C
li r9, 4
b loadPinna
cmpwi r4, 1287
bne+ done
li r9, 5
b loadPinna

setupCasino:

lis r3, 0x8057
ori r3, r3, 0x8988
lhz r4, 5(r3)
andi. r5, r4, 0x802
beq+ 0xC
li r4, 0xE01
b loadStage
li r4, 0xE00
b loadStage

done:

lwz r3, 32(r31)