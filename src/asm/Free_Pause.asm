; Pressing Start in mid-air will softlock the game unless the following Gecko code line is used!
;    PAL: C628F948 8028F954
; NTSC-U: C6297AB0 80297ABC
; NTSC-J: C60EB06C 800EB078

@8028F86C (PAL)
@802979D4 (NTSC-U)
@800EAF90 (NTSC-J)
 
lbz     r3, 0x007C (r31)
cmplwi  r3, 15
beq     0x28              ; do nothing if on title screen
lwz     r3, 0x0018 (r31)
lwz     r3, 0 (r3)
lwz     r3, 0x00D4 (r3)
rlwinm. r3, r3, 0, 31, 31
beq     0x14              ; do nothing if not requesting pause
lis     r3, 0x8028        ; 0x8029 for NTSC-U, 0x800E for NTSC-J
ori     r3, r3, 0xF914    ; 0x7A7C for NTSC-U, 0xB038 for NTSC-J
mtlr    r3
blr
lbz     r0, 0x0124 (r31)  ; run replaced code
