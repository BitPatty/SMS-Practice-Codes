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
 
randStage:
 
mftbl r3
rlwinm r4, r3, 29, 29, 31
andi. r5, r3, 7
addi r4, r4, 2
cmpwi r4, 7
bne+ 0x28
li r4, 0x14
cmpwi r5, 6
bne+ 0x8
xori r4, r4, 3
cmpwi r5, 7
bne+ 0x8
slwi r5, r5, 1
add r4, r4, r5
li r5, 0
slwi r4, r4, 8
xor r4, r4, r5
b loadStage
 
loadPinna:
 
add r4, r8, r9
 
loadStage:
 
lis r3, 0x803E
ori r3, r3, 0x9710
stw r4, 0(r3)
b done
 
setupPinna:
 
li r8,3328
lwz r4,-4(r3)
cmpwi r4,1280
bne- 0x0C
li r9,0
b loadPinna
cmpwi r4,1282
bne- 0x0C
li r9,1
b loadPinna
cmpwi r4,1284
bne- 0x0C
li r9,2
b loadPinna
cmpwi r4,1285
bne- 0x0C
li r9,3
b loadPinna
cmpwi r4,1286
bne- 0x0C
li r9,4
b loadPinna
cmpwi r4,1287
bne+ done
li r9,5
b loadPinna
 
setupCasino:
 
lis r3, 0x803E
ori r3, r3, 0x9710
lbz r4, -12(r3)
andi. r5, r4, 0x8
beq+ 0xC
li r4, 0xE01
b loadStage
li r4, 0xE00
b loadStage
 
done:
 
lwz r3,32(r31)