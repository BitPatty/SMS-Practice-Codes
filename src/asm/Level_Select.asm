lis r3, 0x803E			
ori r3, r3, 0x9710	#stageInfo US
lis r5, 0x8040
ori r5, r5, 0x4484  #Input US 
lbz r4, 2(r3)       #currentStage
cmpwi r4, 1			#if Currentstage <= 1
ble- checkInput			#jmp checkInput
cmpwi r4, 13			#elif pinnaLoadingZone
beq- setupPinna				#jmp setupPinna
cmpwi r4, 7 			#elif hotelLoadingZone
beq- setupHotel				#jmp setupHotel
lis r6, 0x817F		#Keep igt running
ori r6, r6, 0x0100
li r7, 1
stw r7, 0(r6)
b done						#else jmp end 

checkInput: 

lis r6, 0x817F		#Reset igt
ori r6, r6, 0x0100
li r7, 0
stw r7, 0(r6)
lbz r6, 1(r5)		#cStick
lhz r7, 2(r5)		#buttons
cmpwi r6, 0			#if cstick not neutral  
bne- 0x18				#continue 
cmpwi r7, 0				#if buttons neutral
beq- done					#jmp end 
cmpwi r7, 0x100			#if buttons a 
beq- done					#jmp end 
b checkZ		
cmpwi r6, 9			#if cStick up left 
beq- checkSpecial			#jmp checkSpecial 
cmpwi r6,8			#if cStick != 8  (up)
bne- 0x0C				#continue 
li r8,512				#else next stage = 0x200  (bianco)
b checkEpisode				#jmp checkEpisode 
cmpwi r6,10 		#if cStick != 10 (up, right)
bne- 0x0C				#continue 
li r8,768				#else next stage = 0x300  (ricco)
b checkEpisode			#jmp checkEpisode 
cmpwi r6,2			#if cStick != 2 (right)
bne- 0x0C				#continue 
li r8,1024				#else next stage = 0x400  (gelato)
b checkEpisode			#jmp checkEpisode
cmpwi r6,6			#if cStick != 6 (down, right)
bne- 0x0C				#continue 
li r8,1280				#else next stage = 0x500  (pinna)
b checkEpisode			#jmp checkEpisode
cmpwi r6,4			#if cStick != 4 (down) 
bne- 0x0C				#continue 
li r8,1536				#else next stage = 0x600  (sirena)
b checkEpisode			#jmp checkEpisode
cmpwi r6,5			#if cStick != 5 (down, left)
bne- 0x0C				#continue 
li r8,2048				#else next stage = 0x800  (pianta)
b checkEpisode			#jmp checkEpisode
cmpwi r6,1			#if cStick != 1 
bne- done				#invalid value, jmp done  
li r8,2304				#else next stage = 0x900  (noki)

checkEpisode:

cmpwi r7,0			#if buttons not neutral 
bne- 0x0C				#continue
li r9,0					#load episode 1 
b loadStage				#jmp loadStage
cmpwi r7,64			#if buttons != L
bne- 0x0C				#continue 
li r9,1					#load episode 2 
b loadStage				#jmp loadStage
cmpwi r7,32			#if buttons != R 
bne- 0x0C				#continue 
li r9,2					#load episode 3 
b loadStage				#jmp loadStage
cmpwi r7,96			#if buttons != LR 
bne- 0x0C				#continue 
li r9,3					#load episode 4	 
b loadStage				#jmp loadStage
cmpwi r7,16			#if buttons != Z
bne- 0x0C				#continue 
li r9,4					#load episode 5 
b loadStage				#jmp loadStage
cmpwi r7,80			#if buttons != ZL
bne- 0x0C				#continue 
li r9,5					#load episode 6 
b loadStage				#jmp loadStage
cmpwi r7,48			#if buttons != ZR 
bne- 0x0C				#continue 
li r9,6					#load episode 7 
b loadStage				#jmp loadStage
cmpwi r7,112		#if buttons != ZLR 
bne- 0x0C				#continue 
li r9,7					#load episode 8 
b loadStage				#jmp loadStage 
cmpwi r7, 0x400		#if buttons != X 
bne- done				#jmp done 
li r8, 0			#clear stage 
cmpwi r6, 4			#if stage != sirena 
bne- 0x0C				#continue 
li r9, 0x0E01			#else load king boo casino 
b loadStage				#jmp loadStage
cmpwi r6, 10		#if stage != ricco 
bne- 0x0C				#continue 
li r9, 0x1E00			#else load underground 
b loadStage				#jmp loadStage
cmpwi r6, 2			#if stage != gelato 
bne- 0x0C				#continue 
li r9, 0x2100			#else load sandbird 
b loadStage				#jmp loadStage
cmpwi r6, 1			#if stage !=  noki 
bne- 0x0C				#jmp continue 
li r9, 0x3900			#else load eel  
b loadStage				#jmp loadstage 
cmpwi r6, 8 		#if stage != bianco 
bne- done 				#jmp done 
li r9, 0x3700			#else load petey 
b loadStage				#jmp loadStage 

checkZ:

cmpwi r7, 16		#LevelReset 
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

li r9,0				#clear secretStage
b loadStage				#jmp loadStage

checkSpecial:

cmpwi r7, 64		#if buttons != L 
bne- 0x10				#continue 
li r8, 0x1400			#special = airstrip 
li r9, 0x2E00			#secret = bianco 3 
b setupSpecialStage		#jmp setupSpecialStage
cmpwi r7, 32		#if buttons  != R 
bne- 0x10				#continue 
li r8, 0x1500			#special = gelato pipe 
li r9, 0x3000			#secret = bianco 6 
b setupSpecialStage		#jmp setupSpecialStage
cmpwi r7, 96		#if buttons != LR 
bne- 0x10				#continue 
li r8, 0x1600			#special = pachinko 
li r9, 0x2000			#secret = ricco 4 
b setupSpecialStage		#jmp setupSpecialStage
cmpwi r7, 80		#if buttons != ZL 
bne- 0x10				#continue 
li r8, 0x1700			#special = grass pipe 
li r9, 0x2900			#secret = pinna 6 
b setupSpecialStage		#jmp setupSpecialStage
cmpwi r7, 48		#if buttons != ZR 
bne- 0x10				#continue 
li r8, 0x1800			#special = lilypad 
li r9, 0x3300			#secret = sirena 2 
b setupSpecialStage		#jmp setupSpecialStage
cmpwi r7, 112		#if buttons != ZLR 
bne- 0x10				#continue 
li r8, 0x1D00			#special = jail secret 
li r9, 0x2800			#secret = sirena 4 
b setupSpecialStage		#jmp setupSpecialStage
cmpwi r7, 1024		#if buttons != X
bne- 0x10				#continue 
li r8, 0x3400			#special = corona 
li r9, 0x2A00			#secret = pianta 5 
b setupSpecialStage		#jmp setupSpecialStage
cmpwi r7, 1088		#if buttons != XL 
bne- 0x0C				#continue 
li r9, 0x1F00			#secret = noki 6 
b setupSpecialStage		#jmp setupSpecialStage
cmpwi r7, 2048		#if buttons != Y 
bne- 0x0C				#continue 
li r9, 0x3A01			#secret = mecha bowser 
b setupSpecialStage		#jmp setupSpecialStage
cmpwi r7, 2112		#if buttons != YL 
bne- 0x0C				# continue 
li r9, 0x3C00			#secret = bowser 
b setupSpecialStage		#jmp setupSpecialStage
cmpwi r7, 16		#if buttons = Z 
li r9, 0x3200		#secret = pinna 2 
beq- setupSpecialStage	#jmp setupSpecialStage
li r9, 0x2F00		#else secret = bianco 3 

setupSpecialStage:

cmpwi r6, 9			#if secret stage 
beq- 0x08				#continue 
b loadSpecialStage		#jmp loadSpecialStage	
li r8, 0			#load secret stage 

loadStage:

add r8,r8,r9		#store next stage 
stw r8,0(r3)
lis r3,-32385		#backup next stage for reset 
stw r8,0(r3)
lwz r3,-0x6060(r13)	#set episode flag (use -0x6138 for PAL or -0x6830 for JP)
stb r9,0x00DF(r3)
b done

setupPinna: 

li r8,3328			#set stage = 0x0D00
lwz r4,-4(r3)		#r4 = previousstage USE LHZ FOR JP
cmpwi r4,1280		#if previousstage != pinna 1 
bne- 0x0C				#continue 
li r9,0					#episode = 0 
b loadStage				#jmp loadStage
cmpwi r4,1282		#if previousstage != pinna 3 
bne- 0x0C				#continue 
li r9,1					#episode = 1 
b loadStage				#jmp loadStage 
cmpwi r4,1284 		#if previousstage != pinna 5 
bne- 0x0C				#continue 
li r9,2					#episode = 2 
b loadStage				#jmp loadStage
cmpwi r4,1285		#if previousstage != pinna 6 
bne- 0x0C				#continue 
li r9,3					#episode = 3 
b loadStage				#jmp loadStage 
cmpwi r4,1286		#if previousstage != pinna 7 
bne- 0x0C				#continue 
li r9,4					#episode = 4 
b loadStage				#jmp loadStage
cmpwi r4,1287		#if previousstage != pinna 8
bne+ loadStage			#jmp loadStage  
li r9,5					#episode = 5 
b loadStage				#jmp loadStage 

setupHotel:

li r8, 0x700 		#set stage = 0x700 
lwz r4, -4(r3)		#r4 = previousstage USE LHZ FOR JP 
cmpwi r4,0x601		#if previousstage != sirena 2  
bne- 0x0C				#continue 
li r9,0					#episode = 0 
b loadStage				#jmp loadStage
cmpwi r4,0x602		#if previousstage != sirena 3 
bne- 0x0C				#continue 
li r9,1					#episode = 1 
b loadStage				#jmp loadStage 
cmpwi r4,0x603 		#if previousstage != sirena 4 
bne- 0x0C				#continue 
li r9,2					#episode = 2 
b loadStage				#jmp loadStage
cmpwi r4,0x604		#if previousstage != sirena 5 
bne- 0x0C				#continue 
li r9,2					#episode = 2 
b loadStage				#jmp loadStage 
cmpwi r4,0x606		#if previousstage != sirena 7 
bne- 0x0C				#continue 
li r9,3					#episode = 3 
b loadStage				#jmp loadStage
cmpwi r4,0x607		#if previousstage != sirena 8
bne+ loadStage			#jmp loadStage  
li r9,4					#episode = 4 
b loadStage				#jmp loadStage 

done:

lwz r3,32(r31)		#Replaced function