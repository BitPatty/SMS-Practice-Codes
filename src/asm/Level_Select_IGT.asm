lis r3, 0x803E			
ori r3, r3, 0x9710	
lis r5, 0x8040
ori r5, r5, 0x4484  
lis r6, 0x817F
ori r6, r6, 0x0100 
li r7, 1
stw r7, 0(r6)
lbz r4, 2(r3)       
cmpwi r4, 1			
ble- checkInput			
cmpwi r4, 13			
beq- setupPinna				
cmpwi r4, 7 			
beq- setupHotel				
stw r7, 0(r6)
b done						

checkInput: 

lis r6, 0x817F		
ori r6, r6, 0x0100
li r7, 2
stw r7, 0(r6)
lis r6, 0x8034
ori r6, r6, 0x8048
lis r7, 0x7C08
ori r7, r7, 0x02A6
stw r7, 0(r6)
lbz r6, 1(r5)		
lhz r7, 2(r5)	
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
lis r3,-32385		
stw r8,0(r3)
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
bne+ loadStage			 
li r9,5					
b loadStage				

setupHotel:

li r8, 0x700 		
lwz r4, -4(r3)		
cmpwi r4,0x601		
bne- 0x0C				
li r9,0					 
b loadStage				
cmpwi r4,0x602		
bne- 0x0C				
li r9,1					
b loadStage				
cmpwi r4,0x603 		
bne- 0x0C				 
li r9,2					
b loadStage				
cmpwi r4,0x604		
bne- 0x0C				
li r9,2					
b loadStage				 
cmpwi r4,0x606		 
bne- 0x0C				
li r9,3					
b loadStage				
cmpwi r4,0x607		
bne+ loadStage			  
li r9,4					
b loadStage				

done:

lwz r3,32(r31)		