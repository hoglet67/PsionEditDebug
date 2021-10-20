l0000 = &0000
l0001 = &0001
l0003 = &0003
l0005 = &0005
l0008 = &0008
l0009 = &0009
ALTTOPL = &000a
ALTTOPH = &000b
ALTPAGEH = &000c
TOPL = &000d
TOPH = &000e
PAGEH = &0012
l0016 = &0016
l0025 = &0025
l0034 = &0034
l0043 = &0043
l0052 = &0052
l0053 = &0053
l0054 = &0054
l0055 = &0055
l0056 = &0056
l0057 = &0057
l0058 = &0058
l0059 = &0059
l005a = &005a
l005b = &005b
l0070 = &0070
l0071 = &0071
LINEPTRL = &0072
LINEPTRH = &0073
l0074 = &0074
l0075 = &0075
l0076 = &0076
l0077 = &0077
l0078 = &0078
l0079 = &0079
l007a = &007a
l007b = &007b
MARKER1L = &007c
MARKER1H = &007d
MARKER2L = &007e
MARKER2H = &007f
l0100 = &0100
l0101 = &0101
l0102 = &0102
l013f = &013f
l0150 = &0150
BRKVECL = &0202
BRKVECH = &0203
VARIABLE_AT = &0321
basic_search_for_comma = &c231
basic_warm_start = &c2cf
basic_copy_function_to_arithmetic_workspace = &c3c8
basic_pop_workspace_to_arithmetic_workspace = &c3cb
basic_pop_workspace_to_zeropage = &c3cd
basic_process_equals_and_expression = &c4de
basic_post_cmd_checks = &c4e4
basic_post_cmd_checks_and_next_cmd = &c558
basic_next_command = &c55b
basic_print_decimal = &c589
basic_search_for_line_number = &c62e
basic_push_function_to_workspace = &c8bc
basic_push_count_to_workspace = &c97c
basic_push_zeropage_to_workspace = &c99f
basic_error_29_unknown_or_missing_function = &ca1b
basic_return_next = &cbff
basic_process_goto_gosub_target = &cc1f
basic_end = &cd9b
print_string = &f7d1
print_bel = &fd1a
ossave = &ffdd
osload = &ffe0
osecho = &ffe6
osasci = &ffe9
oscrlf = &ffed
oswrch = &fff4
oscli = &fff7
    org &a000
    guard &b000
.pydis_start
    equb &40, &bf                                           ; a000: @.
    ldx #&00                                                ; a002: a2 00
    jsr ca019                                               ; a004: 20 19 a0
    bcc ca00c                                               ; a007: 90 03
    jmp ca713                                               ; a009: 4c 13 a7
; Referenced 1 time by &a007
.ca00c
    ldx #&05                                                ; a00c: a2 05
    jsr ca019                                               ; a00e: 20 19 a0
    bcc ca016                                               ; a011: 90 03
    jmp cae07                                               ; a013: 4c 07 ae
; Referenced 1 time by &a011
.ca016
    jmp basic_post_cmd_checks_and_next_cmd                  ; a016: 4c 58 c5
; Referenced 2 times by &a004, &a00e
.ca019
    ldy l0003                                               ; a019: a4 03
    dey                                                     ; a01b: 88
; Referenced 1 time by &a021
.ca01c
    iny                                                     ; a01c: c8
    lda (l0005),y                                           ; a01d: b1 05
    cmp #&20 ; ' '                                          ; a01f: c9 20
    beq ca01c                                               ; a021: f0 f9
    dex                                                     ; a023: ca
    dey                                                     ; a024: 88
; Referenced 1 time by &a030
.ca025
    inx                                                     ; a025: e8
    iny                                                     ; a026: c8
    lda la036,x                                             ; a027: bd 36 a0
    cmp #&0d                                                ; a02a: c9 0d
    beq ca034                                               ; a02c: f0 06
    cmp (l0005),y                                           ; a02e: d1 05
    beq ca025                                               ; a030: f0 f3
    clc                                                     ; a032: 18
    rts                                                     ; a033: 60
; Referenced 1 time by &a02c
.ca034
    sec                                                     ; a034: 38
    rts                                                     ; a035: 60
.la036
    equs "EDIT"                                             ; a036: 45 44 49 ...
    equb &0d                                                ; a03a: .
    equs "DEBUG"                                            ; a03b: 44 45 42 ...
    equb &0d                                                ; a040: .
; Referenced 6 times by &a426, &a087, &aa2a, &a04d, &ae71, &a055
.ca041
    ldy #&00                                                ; a041: a0 00
; Referenced 2 times by &a063, &a057
.ca043
    jsr osecho                                              ; a043: 20 e6 ff
    cmp #&18                                                ; a046: c9 18
    bne ca050                                               ; a048: d0 06
    jsr oscrlf                                              ; a04a: 20 ed ff
    jmp ca041                                               ; a04d: 4c 41 a0
; Referenced 1 time by &a048
.ca050
    cmp #&7f                                                ; a050: c9 7f
    bne ca059                                               ; a052: d0 05
    dey                                                     ; a054: 88
    bmi ca041                                               ; a055: 30 ea
    bpl ca043                                               ; a057: 10 ea
; Referenced 1 time by &a052
.ca059
    sta l0100,y                                             ; a059: 99 00 01
    iny                                                     ; a05c: c8
    cpy #&3f ; '?'                                          ; a05d: c0 3f
    beq ca06a                                               ; a05f: f0 09
    cmp #&0d                                                ; a061: c9 0d
    bne ca043                                               ; a063: d0 de
    dey                                                     ; a065: 88
    lda l0100                                               ; a066: ad 00 01
    rts                                                     ; a069: 60
; Referenced 1 time by &a05f
.ca06a
    jsr print_bel                                           ; a06a: 20 1a fd
    jsr oscrlf                                              ; a06d: 20 ed ff
    jsr print_string                                        ; a070: 20 d1 f7
    equs "TOO LONG, RETYPE"                                 ; a073: 54 4f 4f ...
    nop                                                     ; a083: ea
    jsr oscrlf                                              ; a084: 20 ed ff
    jmp ca041                                               ; a087: 4c 41 a0
; Referenced 1 time by &a135
.multiply_by_10
    lda l007b                                               ; a08a: a5 7b
    pha                                                     ; a08c: 48
    lda l007a                                               ; a08d: a5 7a
    pha                                                     ; a08f: 48
    asl l007a                                               ; a090: 06 7a
    rol l007b                                               ; a092: 26 7b
    asl l007a                                               ; a094: 06 7a
    rol l007b                                               ; a096: 26 7b
    clc                                                     ; a098: 18
    pla                                                     ; a099: 68
    adc l007a                                               ; a09a: 65 7a
    sta l007a                                               ; a09c: 85 7a
    pla                                                     ; a09e: 68
    adc l007b                                               ; a09f: 65 7b
    sta l007b                                               ; a0a1: 85 7b
    asl l007a                                               ; a0a3: 06 7a
    rol l007b                                               ; a0a5: 26 7b
    rts                                                     ; a0a7: 60
; Referenced 8 times by &a2a5, &a9ab, &a7b2, &a574, &a855, &a478, &a7f9, &a455
.set_lineptr_to_page
    lda #&00                                                ; a0a8: a9 00
    sta LINEPTRL                                            ; a0aa: 85 72
    lda PAGEH                                               ; a0ac: a5 12
    sta LINEPTRH                                            ; a0ae: 85 73
    rts                                                     ; a0b0: 60
; Referenced 16 times by &aac1, &a8a2, &aadb, &a7c4, &a921, &a3bc, &a10a, &a86c, &aad5, &a876, &a804, &a81a, &a93b, &a43c, &a11a, &ab55
.list_line
    lda #&05                                                ; a0b1: a9 05
    sta VARIABLE_AT                                         ; a0b3: 8d 21 03
    lda #&00                                                ; a0b6: a9 00
    sta l0043                                               ; a0b8: 85 43
    sta l0034                                               ; a0ba: 85 34
    ldy #&01                                                ; a0bc: a0 01
    lda (LINEPTRL),y                                        ; a0be: b1 72
    sta l0025                                               ; a0c0: 85 25
    cmp #&ff                                                ; a0c2: c9 ff
    beq ca0da                                               ; a0c4: f0 14
    iny                                                     ; a0c6: c8
    lda (LINEPTRL),y                                        ; a0c7: b1 72
    sta l0016                                               ; a0c9: 85 16
    jsr basic_print_decimal                                 ; a0cb: 20 89 c5
    ldy #&02                                                ; a0ce: a0 02
; Referenced 1 time by &a0d8
.ca0d0
    iny                                                     ; a0d0: c8
    lda (LINEPTRL),y                                        ; a0d1: b1 72
    jsr osasci                                              ; a0d3: 20 e9 ff
    cmp #&0d                                                ; a0d6: c9 0d
    bne ca0d0                                               ; a0d8: d0 f6
; Referenced 1 time by &a0c4
.ca0da
    rts                                                     ; a0da: 60
; Referenced 3 times by &a31b, &a64c, &a0e7
.compare_lineptr_with_top
    sec                                                     ; a0db: 38
    lda TOPL                                                ; a0dc: a5 0d
    sbc LINEPTRL                                            ; a0de: e5 72
    cmp #&03                                                ; a0e0: c9 03
    lda TOPH                                                ; a0e2: a5 0e
    sbc LINEPTRH                                            ; a0e4: e5 73
    rts                                                     ; a0e6: 60
; Referenced 12 times by &a182, &a344, &a945, &a80a, &a3cb, &a46d, &a115, &ab36, &a2b8, &a439, &a99a, &a66a
.inc_lineptr_by_y
    jsr compare_lineptr_with_top                            ; a0e7: 20 db a0
    bcs ca0fc                                               ; a0ea: b0 10
    jsr print_string                                        ; a0ec: 20 d1 f7
    equs "**END**"                                          ; a0ef: 2a 2a 45 ...
    nop                                                     ; a0f6: ea
    jsr oscrlf                                              ; a0f7: 20 ed ff
    sec                                                     ; a0fa: 38
    rts                                                     ; a0fb: 60
; Referenced 1 time by &a0ea
.ca0fc
    tya                                                     ; a0fc: 98
    clc                                                     ; a0fd: 18
    adc LINEPTRL                                            ; a0fe: 65 72
    sta LINEPTRL                                            ; a100: 85 72
    bcc ca106                                               ; a102: 90 02
    inc LINEPTRH                                            ; a104: e6 73
; Referenced 1 time by &a102
.ca106
    clc                                                     ; a106: 18
    rts                                                     ; a107: 60
; Referenced 3 times by &a849, &a835, &a7e6
.ca108
    stx l0078                                               ; a108: 86 78
    jsr list_line                                           ; a10a: 20 b1 a0
    ldx l0078                                               ; a10d: a6 78
    beq ca11f                                               ; a10f: f0 0e
; Referenced 1 time by &a11d
.ca111
    dec l0078                                               ; a111: c6 78
    beq ca11f                                               ; a113: f0 0a
    jsr inc_lineptr_by_y                                    ; a115: 20 e7 a0
    bcs ca11f                                               ; a118: b0 05
    jsr list_line                                           ; a11a: 20 b1 a0
    beq ca111                                               ; a11d: f0 f2
; Referenced 5 times by &a10f, &a113, &a12b, &a118, &a12f
.ca11f
    rts                                                     ; a11f: 60
; Referenced 6 times by &a8e1, &a3e8, &af12, &a812, &a956, &a8fe
.input_decimal_raw
    lda #&00                                                ; a120: a9 00
    sta l007a                                               ; a122: 85 7a
    sta l007b                                               ; a124: 85 7b
; Referenced 2 times by &a142, &a13e
.ca126
    lda l0100,y                                             ; a126: b9 00 01
    cmp #&30 ; '0'                                          ; a129: c9 30
    bcc ca11f                                               ; a12b: 90 f2
    cmp #&3a ; ':'                                          ; a12d: c9 3a
    bcs ca11f                                               ; a12f: b0 ee
    iny                                                     ; a131: c8
    and #&0f                                                ; a132: 29 0f
    pha                                                     ; a134: 48
    jsr multiply_by_10                                      ; a135: 20 8a a0
    pla                                                     ; a138: 68
    clc                                                     ; a139: 18
    adc l007a                                               ; a13a: 65 7a
    sta l007a                                               ; a13c: 85 7a
    bcc ca126                                               ; a13e: 90 e6
    inc l007b                                               ; a140: e6 7b
    bcs ca126                                               ; a142: b0 e2
; Referenced 1 time by &a1c0
.dec_lineptr_by_a
    sta l0074                                               ; a144: 85 74
    lda LINEPTRL                                            ; a146: a5 72
    cmp #&00                                                ; a148: c9 00
    bne ca162                                               ; a14a: d0 16
    lda LINEPTRH                                            ; a14c: a5 73
    cmp PAGEH                                               ; a14e: c5 12
    bne ca162                                               ; a150: d0 10
    jsr print_string                                        ; a152: 20 d1 f7
    equs "**TOP**"                                          ; a155: 2a 2a 54 ...
    nop                                                     ; a15c: ea
    jsr oscrlf                                              ; a15d: 20 ed ff
    sec                                                     ; a160: 38
    rts                                                     ; a161: 60
; Referenced 2 times by &a150, &a14a
.ca162
    sec                                                     ; a162: 38
    lda LINEPTRL                                            ; a163: a5 72
    sbc l0074                                               ; a165: e5 74
    sta LINEPTRL                                            ; a167: 85 72
    bcs ca16d                                               ; a169: b0 02
    dec LINEPTRH                                            ; a16b: c6 73
; Referenced 1 time by &a169
.ca16d
    clc                                                     ; a16d: 18
    rts                                                     ; a16e: 60
; Referenced 13 times by &a341, &a4a2, &a466, &a807, &a3c8, &a667, &a942, &ab33, &a3f4, &a2b5, &a436, &a997, &a17f
.get_line_length_in_y
    ldy #&03                                                ; a16f: a0 03
; Referenced 1 time by &a178
.ca171
    lda (LINEPTRL),y                                        ; a171: b1 72
    cmp #&0d                                                ; a173: c9 0d
    beq ca17a                                               ; a175: f0 03
    iny                                                     ; a177: c8
    bpl ca171                                               ; a178: 10 f7
; Referenced 1 time by &a175
.ca17a
    rts                                                     ; a17a: 60
; Referenced 8 times by &a869, &ab8c, &ab0d, &a1d1, &a7d6, &aa37, &ab5a, &a51e
.skip_forward_x_lines
    cpx #&00                                                ; a17b: e0 00
    beq ca18a                                               ; a17d: f0 0b
; Referenced 1 time by &a188
.ca17f
    jsr get_line_length_in_y                                ; a17f: 20 6f a1
    jsr inc_lineptr_by_y                                    ; a182: 20 e7 a0
    bcs ca18a                                               ; a185: b0 03
    dex                                                     ; a187: ca
    bne ca17f                                               ; a188: d0 f5
; Referenced 2 times by &a17d, &a185
.ca18a
    rts                                                     ; a18a: 60
; Referenced 1 time by &a1bd
.get_start_of_last_line
    ldy #&ff                                                ; a18b: a0 ff
    sec                                                     ; a18d: 38
    lda LINEPTRL                                            ; a18e: a5 72
    sbc #&ff                                                ; a190: e9 ff
    sta l0074                                               ; a192: 85 74
    lda LINEPTRH                                            ; a194: a5 73
    sbc #&00                                                ; a196: e9 00
    sta l0075                                               ; a198: 85 75
; Referenced 1 time by &a19f
.ca19a
    dey                                                     ; a19a: 88
    lda (l0074),y                                           ; a19b: b1 74
    cmp #&0d                                                ; a19d: c9 0d
    bne ca19a                                               ; a19f: d0 f9
    dey                                                     ; a1a1: 88
    dey                                                     ; a1a2: 88
    lda (l0074),y                                           ; a1a3: b1 74
    cmp #&0d                                                ; a1a5: c9 0d
    beq ca1b1                                               ; a1a7: f0 08
    iny                                                     ; a1a9: c8
    lda (l0074),y                                           ; a1aa: b1 74
    cmp #&0d                                                ; a1ac: c9 0d
    beq ca1b1                                               ; a1ae: f0 01
    iny                                                     ; a1b0: c8
; Referenced 2 times by &a1ae, &a1a7
.ca1b1
    sty l0074                                               ; a1b1: 84 74
    lda #&ff                                                ; a1b3: a9 ff
    sec                                                     ; a1b5: 38
    sbc l0074                                               ; a1b6: e5 74
    rts                                                     ; a1b8: 60
; Referenced 8 times by &a7e1, &ab45, &a7eb, &a82f, &a873, &a83a, &a8dc, &a91e
.skip_backwards_x_lines
    cpx #&00                                                ; a1b9: e0 00
    beq ca1c8                                               ; a1bb: f0 0b
; Referenced 1 time by &a1c6
.ca1bd
    jsr get_start_of_last_line                              ; a1bd: 20 8b a1
    jsr dec_lineptr_by_a                                    ; a1c0: 20 44 a1
    bcs ca1c8                                               ; a1c3: b0 03
    dex                                                     ; a1c5: ca
    bne ca1bd                                               ; a1c6: d0 f5
; Referenced 2 times by &a1bb, &a1c3
.ca1c8
    rts                                                     ; a1c8: 60
; Referenced 3 times by &ab4a, &a2e3, &a89f
.ca1c9
    lda LINEPTRL                                            ; a1c9: a5 72
    sta l0076                                               ; a1cb: 85 76
    lda LINEPTRH                                            ; a1cd: a5 73
    sta l0077                                               ; a1cf: 85 77
    jsr skip_forward_x_lines                                ; a1d1: 20 7b a1
    sec                                                     ; a1d4: 38
    lda LINEPTRL                                            ; a1d5: a5 72
    sbc l0076                                               ; a1d7: e5 76
    sta l0074                                               ; a1d9: 85 74
    lda LINEPTRH                                            ; a1db: a5 73
    sbc l0077                                               ; a1dd: e5 77
    sta l0075                                               ; a1df: 85 75
    lda l0076                                               ; a1e1: a5 76
    sta LINEPTRL                                            ; a1e3: 85 72
    lda l0077                                               ; a1e5: a5 77
    sta LINEPTRH                                            ; a1e7: 85 73
    jmp ca1ec                                               ; a1e9: 4c ec a1
; Referenced 3 times by &a1e9, &a3a3, &a539
.ca1ec
    sec                                                     ; a1ec: 38
    lda TOPL                                                ; a1ed: a5 0d
    sbc l0074                                               ; a1ef: e5 74
    sta TOPL                                                ; a1f1: 85 0d
    lda TOPH                                                ; a1f3: a5 0e
    sbc l0075                                               ; a1f5: e5 75
    sta TOPH                                                ; a1f7: 85 0e
    clc                                                     ; a1f9: 18
    lda l0076                                               ; a1fa: a5 76
    adc l0074                                               ; a1fc: 65 74
    sta l0074                                               ; a1fe: 85 74
    lda l0077                                               ; a200: a5 77
    adc l0075                                               ; a202: 65 75
    sta l0075                                               ; a204: 85 75
    ldy #&00                                                ; a206: a0 00
; Referenced 1 time by &a22a
.ca208
    sec                                                     ; a208: 38
    lda TOPL                                                ; a209: a5 0d
    sbc l0076                                               ; a20b: e5 76
    tax                                                     ; a20d: aa
    lda TOPH                                                ; a20e: a5 0e
    sbc l0077                                               ; a210: e5 77
    beq ca218                                               ; a212: f0 04
    ldx #&00                                                ; a214: a2 00
    beq ca21c                                               ; a216: f0 04
; Referenced 1 time by &a212
.ca218
    cpx #&00                                                ; a218: e0 00
    beq ca22c                                               ; a21a: f0 10
; Referenced 2 times by &a222, &a216
.ca21c
    lda (l0074),y                                           ; a21c: b1 74
    sta (l0076),y                                           ; a21e: 91 76
    iny                                                     ; a220: c8
    dex                                                     ; a221: ca
    bne ca21c                                               ; a222: d0 f8
    inc l0075                                               ; a224: e6 75
    inc l0077                                               ; a226: e6 77
    cpy #&00                                                ; a228: c0 00
    beq ca208                                               ; a22a: f0 dc
; Referenced 1 time by &a21a
.ca22c
    lda #&00                                                ; a22c: a9 00
    sta MARKER1L                                            ; a22e: 85 7c
    sta MARKER2L                                            ; a230: 85 7e
    lda PAGEH                                               ; a232: a5 12
    sta MARKER1H                                            ; a234: 85 7d
    sta MARKER2H                                            ; a236: 85 7f
    rts                                                     ; a238: 60
; Referenced 2 times by &a3c1, &a34c
.match_pattern
    ldx #&ff                                                ; a239: a2 ff
; Referenced 1 time by &a252
.ca23b
    inx                                                     ; a23b: e8
    lda l0102,x                                             ; a23c: bd 02 01
    cmp l0101                                               ; a23f: cd 01 01
    bne ca246                                               ; a242: d0 02
    sec                                                     ; a244: 38
    rts                                                     ; a245: 60
; Referenced 3 times by &a242, &a25b, &a255
.ca246
    iny                                                     ; a246: c8
    lda (LINEPTRL),y                                        ; a247: b1 72
    cmp #&0d                                                ; a249: c9 0d
    bne ca24f                                               ; a24b: d0 02
    clc                                                     ; a24d: 18
    rts                                                     ; a24e: 60
; Referenced 1 time by &a24b
.ca24f
    cmp l0102,x                                             ; a24f: dd 02 01
    beq ca23b                                               ; a252: f0 e7
    txa                                                     ; a254: 8a
    beq ca246                                               ; a255: f0 ef
; Referenced 1 time by &a259
.ca257
    dey                                                     ; a257: 88
    dex                                                     ; a258: ca
    bne ca257                                               ; a259: d0 fc
    beq ca246                                               ; a25b: f0 e9
; Referenced 4 times by &a380, &a5a9, &a4c2, &a2fe
.ca25d
    clc                                                     ; a25d: 18
    lda TOPL                                                ; a25e: a5 0d
    sta l0076                                               ; a260: 85 76
    adc l0074                                               ; a262: 65 74
    sta TOPL                                                ; a264: 85 0d
    sta l0074                                               ; a266: 85 74
    lda TOPH                                                ; a268: a5 0e
    sta l0077                                               ; a26a: 85 77
    adc l0075                                               ; a26c: 65 75
    sta TOPH                                                ; a26e: 85 0e
    sta l0075                                               ; a270: 85 75
    ldy #&ff                                                ; a272: a0 ff
; Referenced 1 time by &a296
.ca274
    sec                                                     ; a274: 38
    lda l0076                                               ; a275: a5 76
    sbc l0070                                               ; a277: e5 70
    tax                                                     ; a279: aa
    lda l0077                                               ; a27a: a5 77
    sbc l0071                                               ; a27c: e5 71
    beq ca284                                               ; a27e: f0 04
    ldx #&00                                                ; a280: a2 00
    beq ca288                                               ; a282: f0 04
; Referenced 1 time by &a27e
.ca284
    cpx #&00                                                ; a284: e0 00
    beq ca298                                               ; a286: f0 10
; Referenced 1 time by &a282
.ca288
    dec l0075                                               ; a288: c6 75
    dec l0077                                               ; a28a: c6 77
; Referenced 1 time by &a292
.ca28c
    lda (l0076),y                                           ; a28c: b1 76
    sta (l0074),y                                           ; a28e: 91 74
    dey                                                     ; a290: 88
    dex                                                     ; a291: ca
    bne ca28c                                               ; a292: d0 f8
    cpy #&ff                                                ; a294: c0 ff
    beq ca274                                               ; a296: f0 dc
; Referenced 1 time by &a286
.ca298
    lda #&00                                                ; a298: a9 00
    sta MARKER1L                                            ; a29a: 85 7c
    sta MARKER2L                                            ; a29c: 85 7e
    lda PAGEH                                               ; a29e: a5 12
    sta MARKER1H                                            ; a2a0: 85 7d
    sta MARKER2H                                            ; a2a2: 85 7f
    rts                                                     ; a2a4: 60
; Referenced 2 times by &a2dc, &a815
.ca2a5
    jsr set_lineptr_to_page                                 ; a2a5: 20 a8 a0
; Referenced 1 time by &a2bb
.ca2a8
    ldy #&02                                                ; a2a8: a0 02
    lda (LINEPTRL),y                                        ; a2aa: b1 72
    cmp l007a                                               ; a2ac: c5 7a
    dey                                                     ; a2ae: 88
    lda (LINEPTRL),y                                        ; a2af: b1 72
    sbc l007b                                               ; a2b1: e5 7b
    bcs ca2bf                                               ; a2b3: b0 0a
    jsr get_line_length_in_y                                ; a2b5: 20 6f a1
    jsr inc_lineptr_by_y                                    ; a2b8: 20 e7 a0
    bcc ca2a8                                               ; a2bb: 90 eb
    bcs ca2ca                                               ; a2bd: b0 0b
; Referenced 1 time by &a2b3
.ca2bf
    bne ca2ca                                               ; a2bf: d0 09
    iny                                                     ; a2c1: c8
    lda (LINEPTRL),y                                        ; a2c2: b1 72
    cmp l007a                                               ; a2c4: c5 7a
    bne ca2ca                                               ; a2c6: d0 02
    sec                                                     ; a2c8: 38
    rts                                                     ; a2c9: 60
; Referenced 3 times by &a2bd, &a2c6, &a2bf
.ca2ca
    clc                                                     ; a2ca: 18
    rts                                                     ; a2cb: 60
; Referenced 2 times by &a430, &a959
.ca2cc
    sty l0079                                               ; a2cc: 84 79
    dey                                                     ; a2ce: 88
    ldx #&00                                                ; a2cf: a2 00
; Referenced 1 time by &a2d8
.ca2d1
    iny                                                     ; a2d1: c8
    lda l0100,y                                             ; a2d2: b9 00 01
    inx                                                     ; a2d5: e8
    cmp #&0d                                                ; a2d6: c9 0d
    bne ca2d1                                               ; a2d8: d0 f7
    stx l0078                                               ; a2da: 86 78
    jsr ca2a5                                               ; a2dc: 20 a5 a2
    bcc ca2e6                                               ; a2df: 90 05
    ldx #&01                                                ; a2e1: a2 01
    jsr ca1c9                                               ; a2e3: 20 c9 a1
; Referenced 1 time by &a2df
.ca2e6
    lda l0078                                               ; a2e6: a5 78
    cmp #&01                                                ; a2e8: c9 01
    bne ca2ed                                               ; a2ea: d0 01
    rts                                                     ; a2ec: 60
; Referenced 1 time by &a2ea
.ca2ed
    clc                                                     ; a2ed: 18
    adc #&02                                                ; a2ee: 69 02
    sta l0074                                               ; a2f0: 85 74
    lda #&00                                                ; a2f2: a9 00
    sta l0075                                               ; a2f4: 85 75
    lda LINEPTRL                                            ; a2f6: a5 72
    sta l0070                                               ; a2f8: 85 70
    lda LINEPTRH                                            ; a2fa: a5 73
    sta l0071                                               ; a2fc: 85 71
    jsr ca25d                                               ; a2fe: 20 5d a2
    ldy #&01                                                ; a301: a0 01
    lda l007b                                               ; a303: a5 7b
    sta (LINEPTRL),y                                        ; a305: 91 72
    iny                                                     ; a307: c8
    lda l007a                                               ; a308: a5 7a
    sta (LINEPTRL),y                                        ; a30a: 91 72
    ldx l0079                                               ; a30c: a6 79
    iny                                                     ; a30e: c8
; Referenced 1 time by &a318
.ca30f
    lda l0100,x                                             ; a30f: bd 00 01
    inx                                                     ; a312: e8
    sta (LINEPTRL),y                                        ; a313: 91 72
    iny                                                     ; a315: c8
    cmp #&0d                                                ; a316: c9 0d
    bne ca30f                                               ; a318: d0 f5
    rts                                                     ; a31a: 60
; Referenced 3 times by &a919, &a616, &a347
.ca31b
    jsr compare_lineptr_with_top                            ; a31b: 20 db a0
    bcc ca349                                               ; a31e: 90 29
    ldy #&02                                                ; a320: a0 02
    lda l007a                                               ; a322: a5 7a
    cmp (LINEPTRL),y                                        ; a324: d1 72
    dey                                                     ; a326: 88
    lda l007b                                               ; a327: a5 7b
    sbc (LINEPTRL),y                                        ; a329: f1 72
    bcc ca349                                               ; a32b: 90 1c
    lda l007b                                               ; a32d: a5 7b
    sta (LINEPTRL),y                                        ; a32f: 91 72
    iny                                                     ; a331: c8
    lda l007a                                               ; a332: a5 7a
    sta (LINEPTRL),y                                        ; a334: 91 72
    clc                                                     ; a336: 18
    lda l007a                                               ; a337: a5 7a
    adc l0009                                               ; a339: 65 09
    sta l007a                                               ; a33b: 85 7a
    bcc ca341                                               ; a33d: 90 02
    inc l007b                                               ; a33f: e6 7b
; Referenced 1 time by &a33d
.ca341
    jsr get_line_length_in_y                                ; a341: 20 6f a1
    jsr inc_lineptr_by_y                                    ; a344: 20 e7 a0
    bcc ca31b                                               ; a347: 90 d2
; Referenced 3 times by &a32b, &a31e, &a34f
.ca349
    rts                                                     ; a349: 60
; Referenced 2 times by &a972, &a992
.ca34a
    ldy l0079                                               ; a34a: a4 79
    jsr match_pattern                                       ; a34c: 20 39 a2
    bcc ca349                                               ; a34f: 90 f8
    stx l0078                                               ; a351: 86 78
    sty l0079                                               ; a353: 84 79
    ldy #&ff                                                ; a355: a0 ff
; Referenced 1 time by &a35f
.ca357
    inx                                                     ; a357: e8
    iny                                                     ; a358: c8
    lda l0102,x                                             ; a359: bd 02 01
    cmp l0101                                               ; a35c: cd 01 01
    bne ca357                                               ; a35f: d0 f6
    tya                                                     ; a361: 98
    cmp l0078                                               ; a362: c5 78
    beq ca3a6                                               ; a364: f0 40
    bcc ca386                                               ; a366: 90 1e
    sbc l0078                                               ; a368: e5 78
    sta l0074                                               ; a36a: 85 74
    lda #&00                                                ; a36c: a9 00
    sta l0075                                               ; a36e: 85 75
    lda l0079                                               ; a370: a5 79
    sec                                                     ; a372: 38
    sbc l0078                                               ; a373: e5 78
    clc                                                     ; a375: 18
    adc LINEPTRL                                            ; a376: 65 72
    sta l0070                                               ; a378: 85 70
    lda LINEPTRH                                            ; a37a: a5 73
    adc #&00                                                ; a37c: 69 00
    sta l0071                                               ; a37e: 85 71
    jsr ca25d                                               ; a380: 20 5d a2
    jmp ca3a6                                               ; a383: 4c a6 a3
; Referenced 1 time by &a366
.ca386
    sta l0074                                               ; a386: 85 74
    lda l0078                                               ; a388: a5 78
    sec                                                     ; a38a: 38
    sbc l0074                                               ; a38b: e5 74
    sta l0074                                               ; a38d: 85 74
    lda #&00                                                ; a38f: a9 00
    sta l0075                                               ; a391: 85 75
    lda l0079                                               ; a393: a5 79
    sec                                                     ; a395: 38
    sbc l0078                                               ; a396: e5 78
    sec                                                     ; a398: 38
    adc LINEPTRL                                            ; a399: 65 72
    sta l0076                                               ; a39b: 85 76
    lda LINEPTRH                                            ; a39d: a5 73
    adc #&00                                                ; a39f: 69 00
    sta l0077                                               ; a3a1: 85 77
    jsr ca1ec                                               ; a3a3: 20 ec a1
; Referenced 2 times by &a383, &a364
.ca3a6
    lda l0079                                               ; a3a6: a5 79
    sec                                                     ; a3a8: 38
    sbc l0078                                               ; a3a9: e5 78
    tay                                                     ; a3ab: a8
    ldx l0078                                               ; a3ac: a6 78
; Referenced 1 time by &a3ba
.ca3ae
    iny                                                     ; a3ae: c8
    inx                                                     ; a3af: e8
    lda l0102,x                                             ; a3b0: bd 02 01
    cmp l0101                                               ; a3b3: cd 01 01
    beq ca3bc                                               ; a3b6: f0 04
    sta (LINEPTRL),y                                        ; a3b8: 91 72
    bne ca3ae                                               ; a3ba: d0 f2
; Referenced 1 time by &a3b6
.ca3bc
    jmp list_line                                           ; a3bc: 4c b1 a0
; Referenced 3 times by &a989, &a3ce, &a936
.ca3bf
    ldy #&02                                                ; a3bf: a0 02
    jsr match_pattern                                       ; a3c1: 20 39 a2
    bcc ca3c8                                               ; a3c4: 90 02
    clc                                                     ; a3c6: 18
    rts                                                     ; a3c7: 60
; Referenced 1 time by &a3c4
.ca3c8
    jsr get_line_length_in_y                                ; a3c8: 20 6f a1
    jsr inc_lineptr_by_y                                    ; a3cb: 20 e7 a0
    bcc ca3bf                                               ; a3ce: 90 ef
    rts                                                     ; a3d0: 60
; Referenced 13 times by &a89b, &a984, &a865, &a969, &aa0b, &ab4d, &aaee, &aeed, &a931, &aeb5, &a829, &a86f, &a845
.input_decimal
    ldy #&00                                                ; a3d1: a0 00
; Referenced 1 time by &a3d9
.ca3d3
    iny                                                     ; a3d3: c8
    lda l0100,y                                             ; a3d4: b9 00 01
    cmp #&0d                                                ; a3d7: c9 0d
    bne ca3d3                                               ; a3d9: d0 f8
; Referenced 1 time by &a3e5
.ca3db
    dey                                                     ; a3db: 88
    lda l0100,y                                             ; a3dc: b9 00 01
    cmp #&30 ; '0'                                          ; a3df: c9 30
    bcc ca3e7                                               ; a3e1: 90 04
    cmp #&3a ; ':'                                          ; a3e3: c9 3a
    bcc ca3db                                               ; a3e5: 90 f4
; Referenced 1 time by &a3e1
.ca3e7
    iny                                                     ; a3e7: c8
    jsr input_decimal_raw                                   ; a3e8: 20 20 a1
    lda #&00                                                ; a3eb: a9 00
    cmp l007a                                               ; a3ed: c5 7a
    adc l007a                                               ; a3ef: 65 7a
    sta l007a                                               ; a3f1: 85 7a
    rts                                                     ; a3f3: 60
; Referenced 2 times by &a433, &aa1b
.ca3f4
    jsr get_line_length_in_y                                ; a3f4: 20 6f a1
    iny                                                     ; a3f7: c8
    iny                                                     ; a3f8: c8
    clc                                                     ; a3f9: 18
    lda l007a                                               ; a3fa: a5 7a
    adc l0009                                               ; a3fc: 65 09
    sta l007a                                               ; a3fe: 85 7a
    bcc ca404                                               ; a400: 90 02
    inc l007b                                               ; a402: e6 7b
; Referenced 1 time by &a400
.ca404
    clc                                                     ; a404: 18
    lda (LINEPTRL),y                                        ; a405: b1 72
    sbc l007a                                               ; a407: e5 7a
    dey                                                     ; a409: 88
    lda (LINEPTRL),y                                        ; a40a: b1 72
    sbc l007b                                               ; a40c: e5 7b
    bcc ca436                                               ; a40e: 90 26
    lda #&05                                                ; a410: a9 05
    sta VARIABLE_AT                                         ; a412: 8d 21 03
    lda #&00                                                ; a415: a9 00
    sta l0043                                               ; a417: 85 43
    sta l0034                                               ; a419: 85 34
    lda l007a                                               ; a41b: a5 7a
    sta l0016                                               ; a41d: 85 16
    lda l007b                                               ; a41f: a5 7b
    sta l0025                                               ; a421: 85 25
    jsr basic_print_decimal                                 ; a423: 20 89 c5
    jsr ca041                                               ; a426: 20 41 a0
    cmp #&0d                                                ; a429: c9 0d
    bne ca42e                                               ; a42b: d0 01
    rts                                                     ; a42d: 60
; Referenced 1 time by &a42b
.ca42e
    ldy #&00                                                ; a42e: a0 00
    jsr ca2cc                                               ; a430: 20 cc a2
    jmp ca3f4                                               ; a433: 4c f4 a3
; Referenced 1 time by &a40e
.ca436
    jsr get_line_length_in_y                                ; a436: 20 6f a1
    jsr inc_lineptr_by_y                                    ; a439: 20 e7 a0
    jmp list_line                                           ; a43c: 4c b1 a0
; Referenced 17 times by &ac60, &aa00, &a9e2, &ae83, &ac64, &a9f6, &abf3, &a9e7, &adaa, &afcf, &af63, &afb6, &a9d8, &ac3b, &afdc, &ae7e, &aa05
.print_hex
    pha                                                     ; a43f: 48
    lsr a                                                   ; a440: 4a
    lsr a                                                   ; a441: 4a
    lsr a                                                   ; a442: 4a
    lsr a                                                   ; a443: 4a
    jsr ca448                                               ; a444: 20 48 a4
    pla                                                     ; a447: 68
; Referenced 1 time by &a444
.ca448
    and #&0f                                                ; a448: 29 0f
    cmp #&0a                                                ; a44a: c9 0a
    bcc ca450                                               ; a44c: 90 02
    adc #&06                                                ; a44e: 69 06
; Referenced 1 time by &a44c
.ca450
    adc #&30 ; '0'                                          ; a450: 69 30
    jmp osasci                                              ; a452: 4c e9 ff
; Referenced 3 times by &a721, &a85b, &a9b6
.set_top_to_end_of_program
    jsr set_lineptr_to_page                                 ; a455: 20 a8 a0
    lda #&ff                                                ; a458: a9 ff
    sta TOPL                                                ; a45a: 85 0d
    sta TOPH                                                ; a45c: 85 0e
; Referenced 1 time by &a472
.ca45e
    ldy #&01                                                ; a45e: a0 01
    lda (LINEPTRL),y                                        ; a460: b1 72
    cmp #&ff                                                ; a462: c9 ff
    beq ca474                                               ; a464: f0 0e
    jsr get_line_length_in_y                                ; a466: 20 6f a1
    cpy #&40 ; '@'                                          ; a469: c0 40
    bcs ca488                                               ; a46b: b0 1b
    jsr inc_lineptr_by_y                                    ; a46d: 20 e7 a0
    bcs ca488                                               ; a470: b0 16
    bcc ca45e                                               ; a472: 90 ea
; Referenced 2 times by &a464, &a49f
.ca474
    sec                                                     ; a474: 38
    jsr set_top_to_lineptr                                  ; a475: 20 7b a4
    jmp set_lineptr_to_page                                 ; a478: 4c a8 a0
; Referenced 2 times by &a884, &a475
.set_top_to_lineptr
    lda LINEPTRL                                            ; a47b: a5 72
    adc #&01                                                ; a47d: 69 01
    sta TOPL                                                ; a47f: 85 0d
    lda LINEPTRH                                            ; a481: a5 73
    adc #&00                                                ; a483: 69 00
    sta TOPH                                                ; a485: 85 0e
    rts                                                     ; a487: 60
; Referenced 2 times by &a470, &a46b
.ca488
    jsr print_string                                        ; a488: 20 d1 f7
    equs "END NOT FOUND"                                    ; a48b: 45 4e 44 ...
    nop                                                     ; a498: ea
    jsr oscrlf                                              ; a499: 20 ed ff
    jsr end_marker_at_lineptr                               ; a49c: 20 be a6
    jmp ca474                                               ; a49f: 4c 74 a4
; Referenced 1 time by &aabe
.ca4a2
    jsr get_line_length_in_y                                ; a4a2: 20 6f a1
    dey                                                     ; a4a5: 88
    tya                                                     ; a4a6: 98
    pha                                                     ; a4a7: 48
    clc                                                     ; a4a8: 18
    adc LINEPTRL                                            ; a4a9: 65 72
    sta l0070                                               ; a4ab: 85 70
    lda #&00                                                ; a4ad: a9 00
    adc LINEPTRH                                            ; a4af: 65 73
    sta l0071                                               ; a4b1: 85 71
    ldy #&00                                                ; a4b3: a0 00
    sty l0075                                               ; a4b5: 84 75
    lda #&0d                                                ; a4b7: a9 0d
; Referenced 1 time by &a4bd
.ca4b9
    iny                                                     ; a4b9: c8
    cmp l0100,y                                             ; a4ba: d9 00 01
    bne ca4b9                                               ; a4bd: d0 fa
    dey                                                     ; a4bf: 88
    sty l0074                                               ; a4c0: 84 74
    jsr ca25d                                               ; a4c2: 20 5d a2
    pla                                                     ; a4c5: 68
    tay                                                     ; a4c6: a8
    ldx #&00                                                ; a4c7: a2 00
; Referenced 1 time by &a4d2
.ca4c9
    iny                                                     ; a4c9: c8
    inx                                                     ; a4ca: e8
    lda l0100,x                                             ; a4cb: bd 00 01
    sta (LINEPTRL),y                                        ; a4ce: 91 72
    cmp #&0d                                                ; a4d0: c9 0d
    bne ca4c9                                               ; a4d2: d0 f5
    rts                                                     ; a4d4: 60
; Referenced 1 time by &aad2
.set_marker_1
    lda LINEPTRL                                            ; a4d5: a5 72
    sta MARKER1L                                            ; a4d7: 85 7c
    lda LINEPTRH                                            ; a4d9: a5 73
    sta MARKER1H                                            ; a4db: 85 7d
    lda MARKER2L                                            ; a4dd: a5 7e
    cmp MARKER1L                                            ; a4df: c5 7c
    lda MARKER2H                                            ; a4e1: a5 7f
    sbc MARKER1H                                            ; a4e3: e5 7d
    bcs ca4ef                                               ; a4e5: b0 08
    lda MARKER1L                                            ; a4e7: a5 7c
    sta MARKER2L                                            ; a4e9: 85 7e
    lda MARKER1H                                            ; a4eb: a5 7d
    sta MARKER2H                                            ; a4ed: 85 7f
; Referenced 1 time by &a4e5
.ca4ef
    rts                                                     ; a4ef: 60
; Referenced 1 time by &aad8
.set_marker_2
    lda LINEPTRL                                            ; a4f0: a5 72
    sta MARKER2L                                            ; a4f2: 85 7e
    lda LINEPTRH                                            ; a4f4: a5 73
    sta MARKER2H                                            ; a4f6: 85 7f
    lda MARKER2L                                            ; a4f8: a5 7e
    cmp MARKER1L                                            ; a4fa: c5 7c
    lda MARKER2H                                            ; a4fc: a5 7f
    sbc MARKER1H                                            ; a4fe: e5 7d
    bcs ca50a                                               ; a500: b0 08
    lda MARKER2L                                            ; a502: a5 7e
    sta MARKER1L                                            ; a504: 85 7c
    lda MARKER2H                                            ; a506: a5 7f
    sta MARKER1H                                            ; a508: 85 7d
; Referenced 1 time by &a500
.ca50a
    rts                                                     ; a50a: 60
; Referenced 1 time by &a88e
.ca50b
    lda MARKER1L                                            ; a50b: a5 7c
    sta l0076                                               ; a50d: 85 76
    lda MARKER1H                                            ; a50f: a5 7d
    sta l0077                                               ; a511: 85 77
    sec                                                     ; a513: 38
    lda MARKER2L                                            ; a514: a5 7e
    sta LINEPTRL                                            ; a516: 85 72
    lda MARKER2H                                            ; a518: a5 7f
    sta LINEPTRH                                            ; a51a: 85 73
    ldx #&01                                                ; a51c: a2 01
    jsr skip_forward_x_lines                                ; a51e: 20 7b a1
    lda LINEPTRL                                            ; a521: a5 72
    sbc l0076                                               ; a523: e5 76
    sta l0074                                               ; a525: 85 74
    lda LINEPTRH                                            ; a527: a5 73
    sbc l0077                                               ; a529: e5 77
    sta l0075                                               ; a52b: 85 75
    lda l0076                                               ; a52d: a5 76
    sta LINEPTRL                                            ; a52f: 85 72
    sta MARKER2L                                            ; a531: 85 7e
    lda l0077                                               ; a533: a5 77
    sta LINEPTRH                                            ; a535: 85 73
    sta MARKER2H                                            ; a537: 85 7f
    jmp ca1ec                                               ; a539: 4c ec a1
; Referenced 1 time by &aae8
.swap_text_spaces
    lda PAGEH                                               ; a53c: a5 12
    pha                                                     ; a53e: 48
    lda TOPL                                                ; a53f: a5 0d
    pha                                                     ; a541: 48
    lda TOPH                                                ; a542: a5 0e
    pha                                                     ; a544: 48
    lda ALTTOPL                                             ; a545: a5 0a
    sta TOPL                                                ; a547: 85 0d
    sta LINEPTRL                                            ; a549: 85 72
    lda ALTTOPH                                             ; a54b: a5 0b
    sta TOPH                                                ; a54d: 85 0e
    sta LINEPTRH                                            ; a54f: 85 73
    lda ALTPAGEH                                            ; a551: a5 0c
    sta PAGEH                                               ; a553: 85 12
    pla                                                     ; a555: 68
    sta ALTTOPH                                             ; a556: 85 0b
    pla                                                     ; a558: 68
    sta ALTTOPL                                             ; a559: 85 0a
    pla                                                     ; a55b: 68
    sta ALTPAGEH                                            ; a55c: 85 0c
    sec                                                     ; a55e: 38
    lda LINEPTRL                                            ; a55f: a5 72
    sbc #&02                                                ; a561: e9 02
    sta LINEPTRL                                            ; a563: 85 72
    bcs ca569                                               ; a565: b0 02
    dec LINEPTRH                                            ; a567: c6 73
; Referenced 1 time by &a565
.ca569
    ldy #&00                                                ; a569: a0 00
    lda #&0d                                                ; a56b: a9 0d
    sta (LINEPTRL),y                                        ; a56d: 91 72
    iny                                                     ; a56f: c8
    lda #&ff                                                ; a570: a9 ff
    sta (LINEPTRL),y                                        ; a572: 91 72
    jsr set_lineptr_to_page                                 ; a574: 20 a8 a0
    dey                                                     ; a577: 88
    lda #&0d                                                ; a578: a9 0d
    sta (LINEPTRL),y                                        ; a57a: 91 72
    rts                                                     ; a57c: 60
; Referenced 2 times by &ab10, &ab08
.insert_buffer
    lda LINEPTRL                                            ; a57d: a5 72
    sta l0070                                               ; a57f: 85 70
    lda LINEPTRH                                            ; a581: a5 73
    sta l0071                                               ; a583: 85 71
    sec                                                     ; a585: 38
    lda ALTTOPL                                             ; a586: a5 0a
    sbc #&02                                                ; a588: e9 02
    sta l0074                                               ; a58a: 85 74
    lda ALTTOPH                                             ; a58c: a5 0b
    sbc ALTPAGEH                                            ; a58e: e5 0c
    sta l0075                                               ; a590: 85 75
    ora l0074                                               ; a592: 05 74
    bne ca5a9                                               ; a594: d0 13
    jsr print_string                                        ; a596: 20 d1 f7
    equs "BUFFER EMPTY"                                     ; a599: 42 55 46 ...
    nop                                                     ; a5a5: ea
    jmp oscrlf                                              ; a5a6: 4c ed ff
; Referenced 1 time by &a594
.ca5a9
    jsr ca25d                                               ; a5a9: 20 5d a2
    lda l0070                                               ; a5ac: a5 70
    sta LINEPTRL                                            ; a5ae: 85 72
    lda l0071                                               ; a5b0: a5 71
    sta LINEPTRH                                            ; a5b2: 85 73
    lda #&00                                                ; a5b4: a9 00
    sta l0070                                               ; a5b6: 85 70
    lda ALTPAGEH                                            ; a5b8: a5 0c
    sta l0071                                               ; a5ba: 85 71
; Referenced 1 time by &a5fb
.ca5bc
    ldy #&01                                                ; a5bc: a0 01
    lda (l0070),y                                           ; a5be: b1 70
    cmp #&ff                                                ; a5c0: c9 ff
    beq ca5fe                                               ; a5c2: f0 3a
    dey                                                     ; a5c4: 88
    lda #&0d                                                ; a5c5: a9 0d
    sta (LINEPTRL),y                                        ; a5c7: 91 72
    iny                                                     ; a5c9: c8
    clc                                                     ; a5ca: 18
    lda l007a                                               ; a5cb: a5 7a
    adc l0009                                               ; a5cd: 65 09
    sta l007a                                               ; a5cf: 85 7a
    lda l007b                                               ; a5d1: a5 7b
    adc #&00                                                ; a5d3: 69 00
    sta l007b                                               ; a5d5: 85 7b
    sta (LINEPTRL),y                                        ; a5d7: 91 72
    iny                                                     ; a5d9: c8
    lda l007a                                               ; a5da: a5 7a
    sta (LINEPTRL),y                                        ; a5dc: 91 72
; Referenced 1 time by &a5e5
.ca5de
    iny                                                     ; a5de: c8
    lda (l0070),y                                           ; a5df: b1 70
    sta (LINEPTRL),y                                        ; a5e1: 91 72
    cmp #&0d                                                ; a5e3: c9 0d
    bne ca5de                                               ; a5e5: d0 f7
    clc                                                     ; a5e7: 18
    tya                                                     ; a5e8: 98
    adc LINEPTRL                                            ; a5e9: 65 72
    sta LINEPTRL                                            ; a5eb: 85 72
    bcc ca5f1                                               ; a5ed: 90 02
    inc LINEPTRH                                            ; a5ef: e6 73
; Referenced 1 time by &a5ed
.ca5f1
    clc                                                     ; a5f1: 18
    tya                                                     ; a5f2: 98
    adc l0070                                               ; a5f3: 65 70
    sta l0070                                               ; a5f5: 85 70
    bcc ca5fb                                               ; a5f7: 90 02
    inc l0071                                               ; a5f9: e6 71
; Referenced 1 time by &a5f7
.ca5fb
    jmp ca5bc                                               ; a5fb: 4c bc a5
; Referenced 1 time by &a5c2
.ca5fe
    iny                                                     ; a5fe: c8
    lda (LINEPTRL),y                                        ; a5ff: b1 72
    cmp l007a                                               ; a601: c5 7a
    dey                                                     ; a603: 88
    lda (LINEPTRL),y                                        ; a604: b1 72
    sbc l007b                                               ; a606: e5 7b
    bcc ca60b                                               ; a608: 90 01
    rts                                                     ; a60a: 60
; Referenced 1 time by &a608
.ca60b
    clc                                                     ; a60b: 18
    lda l007a                                               ; a60c: a5 7a
    adc l0009                                               ; a60e: 65 09
    sta l007a                                               ; a610: 85 7a
    bcc ca616                                               ; a612: 90 02
    inc l007b                                               ; a614: e6 7b
; Referenced 1 time by &a612
.ca616
    jmp ca31b                                               ; a616: 4c 1b a3
; Referenced 2 times by &ab52, &ab25
.append_line_from_text_to_buffer
    sec                                                     ; a619: 38
    lda ALTTOPL                                             ; a61a: a5 0a
    sbc #&02                                                ; a61c: e9 02
    sta ALTTOPL                                             ; a61e: 85 0a
    bcs ca624                                               ; a620: b0 02
    dec ALTTOPH                                             ; a622: c6 0b
; Referenced 1 time by &a620
.ca624
    ldy #&01                                                ; a624: a0 01
    lda (LINEPTRL),y                                        ; a626: b1 72
    sta (ALTTOPL),y                                         ; a628: 91 0a
    cmp #&ff                                                ; a62a: c9 ff
    beq ca641                                               ; a62c: f0 13
    iny                                                     ; a62e: c8
    lda (LINEPTRL),y                                        ; a62f: b1 72
    sta (ALTTOPL),y                                         ; a631: 91 0a
; Referenced 1 time by &a63a
.ca633
    iny                                                     ; a633: c8
    lda (LINEPTRL),y                                        ; a634: b1 72
    sta (ALTTOPL),y                                         ; a636: 91 0a
    cmp #&0d                                                ; a638: c9 0d
    bne ca633                                               ; a63a: d0 f7
    lda #&ff                                                ; a63c: a9 ff
    iny                                                     ; a63e: c8
    sta (ALTTOPL),y                                         ; a63f: 91 0a
; Referenced 1 time by &a62c
.ca641
    tya                                                     ; a641: 98
    sec                                                     ; a642: 38
    adc ALTTOPL                                             ; a643: 65 0a
    sta ALTTOPL                                             ; a645: 85 0a
    bcc ca64b                                               ; a647: 90 02
    inc ALTTOPH                                             ; a649: e6 0b
; Referenced 1 time by &a647
.ca64b
    rts                                                     ; a64b: 60
; Referenced 2 times by &a913, &a66d
.renumber_lines
    jsr compare_lineptr_with_top                            ; a64c: 20 db a0
    bcc ca66f                                               ; a64f: 90 1e
    ldy #&01                                                ; a651: a0 01
    lda l007b                                               ; a653: a5 7b
    sta (LINEPTRL),y                                        ; a655: 91 72
    iny                                                     ; a657: c8
    lda l007a                                               ; a658: a5 7a
    sta (LINEPTRL),y                                        ; a65a: 91 72
    clc                                                     ; a65c: 18
    lda l007a                                               ; a65d: a5 7a
    adc l0009                                               ; a65f: 65 09
    sta l007a                                               ; a661: 85 7a
    bcc ca667                                               ; a663: 90 02
    inc l007b                                               ; a665: e6 7b
; Referenced 1 time by &a663
.ca667
    jsr get_line_length_in_y                                ; a667: 20 6f a1
    jsr inc_lineptr_by_y                                    ; a66a: 20 e7 a0
    bcc renumber_lines                                      ; a66d: 90 dd
; Referenced 1 time by &a64f
.ca66f
    rts                                                     ; a66f: 60
; Referenced 1 time by &a68e
.ca670
    cmp #&30 ; '0'                                          ; a670: c9 30
    bcc ca683                                               ; a672: 90 0f
    cmp #&3a ; ':'                                          ; a674: c9 3a
    bcc ca680                                               ; a676: 90 08
    sbc #&07                                                ; a678: e9 07
    bcc ca683                                               ; a67a: 90 07
    cmp #&40 ; '@'                                          ; a67c: c9 40
    bcs ca684                                               ; a67e: b0 04
; Referenced 1 time by &a676
.ca680
    and #&0f                                                ; a680: 29 0f
    rts                                                     ; a682: 60
; Referenced 2 times by &a672, &a67a
.ca683
    sec                                                     ; a683: 38
; Referenced 1 time by &a67e
.ca684
    rts                                                     ; a684: 60
; Referenced 6 times by &aea0, &aff0, &a8b0, &ae92, &af75, &aeda
.input_hex
    lda #&00                                                ; a685: a9 00
    sta l0000,x                                             ; a687: 95 00
    sta l0001,x                                             ; a689: 95 01
; Referenced 1 time by &a6a6
.ca68b
    lda l0100,y                                             ; a68b: b9 00 01
    jsr ca670                                               ; a68e: 20 70 a6
    bcs ca6a8                                               ; a691: b0 15
    asl a                                                   ; a693: 0a
    asl a                                                   ; a694: 0a
    asl a                                                   ; a695: 0a
    asl a                                                   ; a696: 0a
    sty l0079                                               ; a697: 84 79
    ldy #&04                                                ; a699: a0 04
; Referenced 1 time by &a6a1
.ca69b
    asl a                                                   ; a69b: 0a
    rol l0000,x                                             ; a69c: 36 00
    rol l0001,x                                             ; a69e: 36 01
    dey                                                     ; a6a0: 88
    bne ca69b                                               ; a6a1: d0 f8
    ldy l0079                                               ; a6a3: a4 79
    iny                                                     ; a6a5: c8
    bne ca68b                                               ; a6a6: d0 e3
; Referenced 1 time by &a691
.ca6a8
    lda l0000,x                                             ; a6a8: b5 00
    rts                                                     ; a6aa: 60
; Referenced 3 times by &a97a, &a95f, &a927
.count_delimiters
    ldx #&00                                                ; a6ab: a2 00
    ldy #&ff                                                ; a6ad: a0 ff
; Referenced 1 time by &a6bb
.ca6af
    iny                                                     ; a6af: c8
    lda l0100,y                                             ; a6b0: b9 00 01
    cmp l0101                                               ; a6b3: cd 01 01
    bne ca6b9                                               ; a6b6: d0 01
    inx                                                     ; a6b8: e8
; Referenced 1 time by &a6b6
.ca6b9
    cmp #&0d                                                ; a6b9: c9 0d
    bne ca6af                                               ; a6bb: d0 f2
    rts                                                     ; a6bd: 60
; Referenced 3 times by &a880, &a858, &a49c
.end_marker_at_lineptr
    ldy #&01                                                ; a6be: a0 01
    lda #&ff                                                ; a6c0: a9 ff
    sta (LINEPTRL),y                                        ; a6c2: 91 72
    dey                                                     ; a6c4: 88
    lda #&0d                                                ; a6c5: a9 0d
    sta (LINEPTRL),y                                        ; a6c7: 91 72
    rts                                                     ; a6c9: 60
.la6ca
    equs "QTLNDBRH SCO?A*><+MXIEZ-"                         ; a6ca: 51 54 4c ...
    equb &0d                                                ; a6e2: .
.la6e3
    equb <(edit_cmd_Q)                                      ; a6e3: .
    equb <(edit_cmd_T)                                      ; a6e4: .
    equb <(edit_cmd_L)                                      ; a6e5: .
    equb <(edit_cmd_N)                                      ; a6e6: .
    equb <(edit_cmd_D)                                      ; a6e7: .
    equb <(edit_cmd_B)                                      ; a6e8: .
    equb <(edit_cmd_R)                                      ; a6e9: .
    equb <(edit_cmd_H)                                      ; a6ea: .
    equb <(edit_cmd_SPACE)                                  ; a6eb: .
    equb <(edit_cmd_S)                                      ; a6ec: .
    equb <(edit_cmd_C)                                      ; a6ed: .
    equb <(edit_cmd_O)                                      ; a6ee: .
    equb <(edit_cmd_QUERY)                                  ; a6ef: .
    equb <(edit_cmd_A)                                      ; a6f0: .
    equb <(edit_cmd_STAR)                                   ; a6f1: .
    equb <(edit_cmd_GT)                                     ; a6f2: .
    equb <(edit_cmd_LT)                                     ; a6f3: .
    equb <(edit_cmd_PLUS)                                   ; a6f4: .
    equb <(edit_cmd_M)                                      ; a6f5: .
    equb <(edit_cmd_X)                                      ; a6f6: .
    equb <(edit_cmd_I)                                      ; a6f7: .
    equb <(edit_cmd_E)                                      ; a6f8: .
    equb <(edit_cmd_Z)                                      ; a6f9: .
    equb <(edit_cmd_MINUS)                                  ; a6fa: .
.la6fb
    equb >(edit_cmd_Q)                                      ; a6fb: .
    equb >(edit_cmd_T)                                      ; a6fc: .
    equb >(edit_cmd_L)                                      ; a6fd: .
    equb >(edit_cmd_N)                                      ; a6fe: .
    equb >(edit_cmd_D)                                      ; a6ff: .
    equb >(edit_cmd_B)                                      ; a700: .
    equb >(edit_cmd_R)                                      ; a701: .
    equb >(edit_cmd_H)                                      ; a702: .
    equb >(edit_cmd_SPACE)                                  ; a703: .
    equb >(edit_cmd_S)                                      ; a704: .
    equb >(edit_cmd_C)                                      ; a705: .
    equb >(edit_cmd_O)                                      ; a706: .
    equb >(edit_cmd_QUERY)                                  ; a707: .
    equb >(edit_cmd_A)                                      ; a708: .
    equb >(edit_cmd_STAR)                                   ; a709: .
    equb >(edit_cmd_GT)                                     ; a70a: .
    equb >(edit_cmd_LT)                                     ; a70b: .
    equb >(edit_cmd_PLUS)                                   ; a70c: .
    equb >(edit_cmd_M)                                      ; a70d: .
    equb >(edit_cmd_X)                                      ; a70e: .
    equb >(edit_cmd_I)                                      ; a70f: .
    equb >(edit_cmd_E)                                      ; a710: .
    equb >(edit_cmd_Z)                                      ; a711: .
    equb >(edit_cmd_MINUS)                                  ; a712: .
; Referenced 1 time by &a009
.ca713
    lda #&5e ; '^'                                          ; a713: a9 5e
    sta l0008                                               ; a715: 85 08
    lda #&82                                                ; a717: a9 82
    sta ALTPAGEH                                            ; a719: 85 0c
    sta ALTTOPH                                             ; a71b: 85 0b
    lda #&02                                                ; a71d: a9 02
    sta ALTTOPL                                             ; a71f: 85 0a
; Referenced 1 time by &aaa3
.ca721
    jsr set_top_to_end_of_program                           ; a721: 20 55 a4
    lda LINEPTRH                                            ; a724: a5 73
    sta MARKER1H                                            ; a726: 85 7d
    sta MARKER2H                                            ; a728: 85 7f
    lda LINEPTRL                                            ; a72a: a5 72
    sta MARKER1L                                            ; a72c: 85 7c
    sta MARKER2L                                            ; a72e: 85 7e
    jsr caa53                                               ; a730: 20 53 aa
    jsr edit_cmd_QUERY                                      ; a733: 20 c5 a9
.yyy_handler
    lda #>(yyy_handler-1)                                   ; a736: a9 a7
    pha                                                     ; a738: 48
    lda #<(yyy_handler-1) ; '5'                             ; a739: a9 35
    pha                                                     ; a73b: 48
    ldy #&00                                                ; a73c: a0 00
; Referenced 1 time by &a744
.ca73e
    iny                                                     ; a73e: c8
    lda l0100,y                                             ; a73f: b9 00 01
    cmp #&0d                                                ; a742: c9 0d
    bne ca73e                                               ; a744: d0 f8
    lda l0101,y                                             ; a746: b9 01 01
    cmp #&ff                                                ; a749: c9 ff
    bne ca753                                               ; a74b: d0 06
    jsr caa21                                               ; a74d: 20 21 aa
    jmp ca761                                               ; a750: 4c 61 a7
; Referenced 1 time by &a74b
.ca753
    ldx #&00                                                ; a753: a2 00
; Referenced 1 time by &a75f
.ca755
    iny                                                     ; a755: c8
    lda l0100,y                                             ; a756: b9 00 01
    sta l0100,x                                             ; a759: 9d 00 01
    inx                                                     ; a75c: e8
    cmp #&ff                                                ; a75d: c9 ff
    bne ca755                                               ; a75f: d0 f4
; Referenced 3 times by &a750, &ab72, &ab8f
.ca761
    lda l0100                                               ; a761: ad 00 01
    cmp #&30 ; '0'                                          ; a764: c9 30
    bcc ca76f                                               ; a766: 90 07
    cmp #&3a ; ':'                                          ; a768: c9 3a
    bcs ca76f                                               ; a76a: b0 03
    jmp edit_cmd_SPACE                                      ; a76c: 4c 4b a9
; Referenced 2 times by &a76a, &a766
.ca76f
    ldx #&17                                                ; a76f: a2 17
; Referenced 1 time by &a777
.ca771
    cmp la6ca,x                                             ; a771: dd ca a6
    beq ca78b                                               ; a774: f0 15
    dex                                                     ; a776: ca
    bpl ca771                                               ; a777: 10 f8
; Referenced 10 times by &a981, &a8c4, &aae5, &a966, &a92e, &a7af, &a910, &aacf, &ab7c, &a79f
.error_what
    jsr print_bel                                           ; a779: 20 1a fd
    jsr print_string                                        ; a77c: 20 d1 f7
    equs "WHAT?"                                            ; a77f: 57 48 41 ...
    nop                                                     ; a784: ea
    jsr oscrlf                                              ; a785: 20 ed ff
    jmp caa53                                               ; a788: 4c 53 aa
; Referenced 1 time by &a774
.ca78b
    lda la6e3,x                                             ; a78b: bd e3 a6
    sta l0074                                               ; a78e: 85 74
    lda la6fb,x                                             ; a790: bd fb a6
    sta l0075                                               ; a793: 85 75
    jmp (l0074)                                             ; a795: 6c 74 00
.edit_cmd_Q
    lda l0101                                               ; a798: ad 01 01
    cmp #&0d                                                ; a79b: c9 0d
    beq ca7a2                                               ; a79d: f0 03
    jmp error_what                                          ; a79f: 4c 79 a7
; Referenced 1 time by &a79d
.ca7a2
    ldx #&ff                                                ; a7a2: a2 ff
    txs                                                     ; a7a4: 9a
    jmp basic_end                                           ; a7a5: 4c 9b cd
.edit_cmd_T
    lda l0101                                               ; a7a8: ad 01 01
    cmp #&0d                                                ; a7ab: c9 0d
    beq ca7b2                                               ; a7ad: f0 03
    jmp error_what                                          ; a7af: 4c 79 a7
; Referenced 1 time by &a7ad
.ca7b2
    jmp set_lineptr_to_page                                 ; a7b2: 4c a8 a0
; Referenced 2 times by &ab1a, &a88b
.edit_cmd_L
    lda l0101                                               ; a7b5: ad 01 01
    cmp #&4d ; 'M'                                          ; a7b8: c9 4d
    bne ca7db                                               ; a7ba: d0 1f
    lda MARKER1L                                            ; a7bc: a5 7c
    sta LINEPTRL                                            ; a7be: 85 72
    lda MARKER1H                                            ; a7c0: a5 7d
    sta LINEPTRH                                            ; a7c2: 85 73
; Referenced 1 time by &a7d9
.ca7c4
    jsr list_line                                           ; a7c4: 20 b1 a0
    lda MARKER2H                                            ; a7c7: a5 7f
    cmp LINEPTRH                                            ; a7c9: c5 73
    bne ca7d4                                               ; a7cb: d0 07
    lda MARKER2L                                            ; a7cd: a5 7e
    cmp LINEPTRL                                            ; a7cf: c5 72
    bne ca7d4                                               ; a7d1: d0 01
    rts                                                     ; a7d3: 60
; Referenced 2 times by &a7d1, &a7cb
.ca7d4
    ldx #&01                                                ; a7d4: a2 01
    jsr skip_forward_x_lines                                ; a7d6: 20 7b a1
    beq ca7c4                                               ; a7d9: f0 e9
; Referenced 1 time by &a7ba
.ca7db
    cmp #&41 ; 'A'                                          ; a7db: c9 41
    bne ca7ee                                               ; a7dd: d0 0f
    ldx #&04                                                ; a7df: a2 04
    jsr skip_backwards_x_lines                              ; a7e1: 20 b9 a1
    ldx #&0a                                                ; a7e4: a2 0a
    jsr ca108                                               ; a7e6: 20 08 a1
    ldx #&05                                                ; a7e9: a2 05
    jmp skip_backwards_x_lines                              ; a7eb: 4c b9 a1
; Referenced 1 time by &a7dd
.ca7ee
    cmp #&2e ; '.'                                          ; a7ee: c9 2e
    bne ca81d                                               ; a7f0: d0 2b
    lda l0102                                               ; a7f2: ad 02 01
    cmp #&0d                                                ; a7f5: c9 0d
    bne ca810                                               ; a7f7: d0 17
    jsr set_lineptr_to_page                                 ; a7f9: 20 a8 a0
; Referenced 1 time by &a80d
.ca7fc
    ldy #&01                                                ; a7fc: a0 01
    lda (LINEPTRL),y                                        ; a7fe: b1 72
    cmp #&ff                                                ; a800: c9 ff
    beq ca80f                                               ; a802: f0 0b
    jsr list_line                                           ; a804: 20 b1 a0
    jsr get_line_length_in_y                                ; a807: 20 6f a1
    jsr inc_lineptr_by_y                                    ; a80a: 20 e7 a0
    bcc ca7fc                                               ; a80d: 90 ed
; Referenced 1 time by &a802
.ca80f
    rts                                                     ; a80f: 60
; Referenced 1 time by &a7f7
.ca810
    ldy #&02                                                ; a810: a0 02
    jsr input_decimal_raw                                   ; a812: 20 20 a1
    jsr ca2a5                                               ; a815: 20 a5 a2
    bcc la81c                                               ; a818: 90 02
.ca81a
la81c = ca81a+2
    jmp list_line                                           ; a81a: 4c b1 a0
; overlapping: ldy #&c9                                     ; a81c: a0 c9
; Referenced 1 time by &a818
; Referenced 1 time by &a7f0
.ca81d
    cmp #&2d ; '-'                                          ; a81d: c9 2d
; overlapping: and l08f0                                    ; a81e: 2d f0 08
    beq ca829                                               ; a81f: f0 08
    cmp #&42 ; 'B'                                          ; a821: c9 42
    bne ca83d                                               ; a823: d0 18
    ldx #&09                                                ; a825: a2 09
    bne ca82d                                               ; a827: d0 04
; Referenced 1 time by &a81f
.ca829
    jsr input_decimal                                       ; a829: 20 d1 a3
    tax                                                     ; a82c: aa
; Referenced 1 time by &a827
.ca82d
    stx l0009                                               ; a82d: 86 09
    jsr skip_backwards_x_lines                              ; a82f: 20 b9 a1
    ldx l0009                                               ; a832: a6 09
    inx                                                     ; a834: e8
    jsr ca108                                               ; a835: 20 08 a1
    ldx l0009                                               ; a838: a6 09
    jmp skip_backwards_x_lines                              ; a83a: 4c b9 a1
; Referenced 1 time by &a823
.ca83d
    cmp #&46 ; 'F'                                          ; a83d: c9 46
    bne ca845                                               ; a83f: d0 04
    ldx #&0a                                                ; a841: a2 0a
    bne ca849                                               ; a843: d0 04
; Referenced 1 time by &a83f
.ca845
    jsr input_decimal                                       ; a845: 20 d1 a3
    tax                                                     ; a848: aa
; Referenced 1 time by &a843
.ca849
    jmp ca108                                               ; a849: 4c 08 a1
.edit_cmd_N
    ldy #&01                                                ; a84c: a0 01
    lda l0100,y                                             ; a84e: b9 00 01
    cmp #&45 ; 'E'                                          ; a851: c9 45
    bne ca861                                               ; a853: d0 0c
    jsr set_lineptr_to_page                                 ; a855: 20 a8 a0
    jsr end_marker_at_lineptr                               ; a858: 20 be a6
    jsr set_top_to_end_of_program                           ; a85b: 20 55 a4
    jmp edit_cmd_QUERY                                      ; a85e: 4c c5 a9
; Referenced 1 time by &a853
.ca861
    cmp #&2d ; '-'                                          ; a861: c9 2d
    beq ca86f                                               ; a863: f0 0a
    jsr input_decimal                                       ; a865: 20 d1 a3
    tax                                                     ; a868: aa
    jsr skip_forward_x_lines                                ; a869: 20 7b a1
    jmp list_line                                           ; a86c: 4c b1 a0
; Referenced 1 time by &a863
.ca86f
    jsr input_decimal                                       ; a86f: 20 d1 a3
    tax                                                     ; a872: aa
    jsr skip_backwards_x_lines                              ; a873: 20 b9 a1
    jmp list_line                                           ; a876: 4c b1 a0
.edit_cmd_D
    lda l0101                                               ; a879: ad 01 01
    cmp #&2e ; '.'                                          ; a87c: c9 2e
    bne ca887                                               ; a87e: d0 07
    jsr end_marker_at_lineptr                               ; a880: 20 be a6
    sec                                                     ; a883: 38
    jmp set_top_to_lineptr                                  ; a884: 4c 7b a4
; Referenced 1 time by &a87e
.ca887
    cmp #&4d ; 'M'                                          ; a887: c9 4d
    bne ca891                                               ; a889: d0 06
    jsr edit_cmd_L                                          ; a88b: 20 b5 a7
    jmp ca50b                                               ; a88e: 4c 0b a5
; Referenced 1 time by &a889
.ca891
    cmp #&3d ; '='                                          ; a891: c9 3d
    bne ca89b                                               ; a893: d0 06
    lda l0102                                               ; a895: ad 02 01
    sta l0008                                               ; a898: 85 08
    rts                                                     ; a89a: 60
; Referenced 1 time by &a893
.ca89b
    jsr input_decimal                                       ; a89b: 20 d1 a3
    tax                                                     ; a89e: aa
    jsr ca1c9                                               ; a89f: 20 c9 a1
    jmp list_line                                           ; a8a2: 4c b1 a0
.edit_cmd_B
    lda l0101                                               ; a8a5: ad 01 01
    cmp #&3d ; '='                                          ; a8a8: c9 3d
    bne ca8c0                                               ; a8aa: d0 14
    ldy #&02                                                ; a8ac: a0 02
    ldx #&0a                                                ; a8ae: a2 0a
    jsr input_hex                                           ; a8b0: 20 85 a6
    lda ALTTOPL                                             ; a8b3: a5 0a
    sta ALTTOPH                                             ; a8b5: 85 0b
    sta ALTPAGEH                                            ; a8b7: 85 0c
    lda #&02                                                ; a8b9: a9 02
    sta ALTTOPL                                             ; a8bb: 85 0a
    jmp edit_cmd_QUERY                                      ; a8bd: 4c c5 a9
; Referenced 1 time by &a8aa
.ca8c0
    cmp #&0d                                                ; a8c0: c9 0d
    beq ca8c7                                               ; a8c2: f0 03
    jmp error_what                                          ; a8c4: 4c 79 a7
; Referenced 1 time by &a8c2
.ca8c7
    lda TOPL                                                ; a8c7: a5 0d
    sta LINEPTRL                                            ; a8c9: 85 72
    lda TOPH                                                ; a8cb: a5 0e
    sta LINEPTRH                                            ; a8cd: 85 73
    sec                                                     ; a8cf: 38
    lda LINEPTRL                                            ; a8d0: a5 72
    sbc #&02                                                ; a8d2: e9 02
    sta LINEPTRL                                            ; a8d4: 85 72
    bcs ca8da                                               ; a8d6: b0 02
    dec LINEPTRH                                            ; a8d8: c6 73
; Referenced 1 time by &a8d6
.ca8da
    ldx #&01                                                ; a8da: a2 01
    jmp skip_backwards_x_lines                              ; a8dc: 4c b9 a1
.edit_cmd_R
    ldy #&01                                                ; a8df: a0 01
    jsr input_decimal_raw                                   ; a8e1: 20 20 a1
    lda l007a                                               ; a8e4: a5 7a
    sta l0009                                               ; a8e6: 85 09
    lda l0100,y                                             ; a8e8: b9 00 01
    cmp #&2c ; ','                                          ; a8eb: c9 2c
    beq ca8fd                                               ; a8ed: f0 0e
    ldy #&02                                                ; a8ef: a0 02
    lda (LINEPTRL),y                                        ; a8f1: b1 72
    sta l007a                                               ; a8f3: 85 7a
    dey                                                     ; a8f5: 88
    lda (LINEPTRL),y                                        ; a8f6: b1 72
    sta l007b                                               ; a8f8: 85 7b
    jmp ca919                                               ; a8fa: 4c 19 a9
; Referenced 1 time by &a8ed
.ca8fd
    iny                                                     ; a8fd: c8
    jsr input_decimal_raw                                   ; a8fe: 20 20 a1
    lda l0100,y                                             ; a901: b9 00 01
    cmp #&2c ; ','                                          ; a904: c9 2c
    bne ca919                                               ; a906: d0 11
    iny                                                     ; a908: c8
    lda l0100,y                                             ; a909: b9 00 01
    cmp #&46 ; 'F'                                          ; a90c: c9 46
    beq ca913                                               ; a90e: f0 03
    jmp error_what                                          ; a910: 4c 79 a7
; Referenced 1 time by &a90e
.ca913
    jsr renumber_lines                                      ; a913: 20 4c a6
    clc                                                     ; a916: 18
    bcc ca91c                                               ; a917: 90 03
; Referenced 2 times by &a8fa, &a906
.ca919
    jsr ca31b                                               ; a919: 20 1b a3
; Referenced 1 time by &a917
.ca91c
    ldx #&01                                                ; a91c: a2 01
    jsr skip_backwards_x_lines                              ; a91e: 20 b9 a1
    jsr list_line                                           ; a921: 20 b1 a0
    jmp caa53                                               ; a924: 4c 53 aa
.edit_cmd_H
    jsr count_delimiters                                    ; a927: 20 ab a6
    cpx #&02                                                ; a92a: e0 02
    beq ca931                                               ; a92c: f0 03
    jmp error_what                                          ; a92e: 4c 79 a7
; Referenced 1 time by &a92c
.ca931
    jsr input_decimal                                       ; a931: 20 d1 a3
    sta l0009                                               ; a934: 85 09
; Referenced 1 time by &a948
.ca936
    jsr ca3bf                                               ; a936: 20 bf a3
    bcs ca94a                                               ; a939: b0 0f
    jsr list_line                                           ; a93b: 20 b1 a0
    dec l0009                                               ; a93e: c6 09
    beq ca94a                                               ; a940: f0 08
    jsr get_line_length_in_y                                ; a942: 20 6f a1
    jsr inc_lineptr_by_y                                    ; a945: 20 e7 a0
    bcc ca936                                               ; a948: 90 ec
; Referenced 2 times by &a940, &a939
.ca94a
    rts                                                     ; a94a: 60
; Referenced 1 time by &a76c
.edit_cmd_SPACE
    ldy #&00                                                ; a94b: a0 00
; Referenced 1 time by &a953
.ca94d
    lda l0100,y                                             ; a94d: b9 00 01
    iny                                                     ; a950: c8
    cmp #&20 ; ' '                                          ; a951: c9 20
    beq ca94d                                               ; a953: f0 f8
    dey                                                     ; a955: 88
    jsr input_decimal_raw                                   ; a956: 20 20 a1
    jsr ca2cc                                               ; a959: 20 cc a2
    jmp caa53                                               ; a95c: 4c 53 aa
.edit_cmd_S
    jsr count_delimiters                                    ; a95f: 20 ab a6
    cpx #&03                                                ; a962: e0 03
    beq ca969                                               ; a964: f0 03
    jmp error_what                                          ; a966: 4c 79 a7
; Referenced 1 time by &a964
.ca969
    jsr input_decimal                                       ; a969: 20 d1 a3
    sta l0009                                               ; a96c: 85 09
    ldy #&02                                                ; a96e: a0 02
    sty l0079                                               ; a970: 84 79
; Referenced 1 time by &a977
.ca972
    jsr ca34a                                               ; a972: 20 4a a3
    dec l0009                                               ; a975: c6 09
    bne ca972                                               ; a977: d0 f9
    rts                                                     ; a979: 60
.edit_cmd_C
    jsr count_delimiters                                    ; a97a: 20 ab a6
    cpx #&03                                                ; a97d: e0 03
    beq ca984                                               ; a97f: f0 03
    jmp error_what                                          ; a981: 4c 79 a7
; Referenced 1 time by &a97f
.ca984
    jsr input_decimal                                       ; a984: 20 d1 a3
    sta l0009                                               ; a987: 85 09
; Referenced 1 time by &a99f
.ca989
    jsr ca3bf                                               ; a989: 20 bf a3
    bcs ca9a1                                               ; a98c: b0 13
    ldy #&02                                                ; a98e: a0 02
    sty l0079                                               ; a990: 84 79
; Referenced 1 time by &a995
.ca992
    jsr ca34a                                               ; a992: 20 4a a3
    bcs ca992                                               ; a995: b0 fb
    jsr get_line_length_in_y                                ; a997: 20 6f a1
    jsr inc_lineptr_by_y                                    ; a99a: 20 e7 a0
    dec l0009                                               ; a99d: c6 09
    bne ca989                                               ; a99f: d0 e8
; Referenced 1 time by &a98c
.ca9a1
    rts                                                     ; a9a1: 60
.edit_cmd_O
    ldx #&03                                                ; a9a2: a2 03
    lda l0101                                               ; a9a4: ad 01 01
    cmp #&4c ; 'L'                                          ; a9a7: c9 4c
    bne ca9bc                                               ; a9a9: d0 11
    jsr set_lineptr_to_page                                 ; a9ab: 20 a8 a0
    lda #&00                                                ; a9ae: a9 00
    ldy #&01                                                ; a9b0: a0 01
    lda #&00                                                ; a9b2: a9 00
    sta (LINEPTRL),y                                        ; a9b4: 91 72
    jsr set_top_to_end_of_program                           ; a9b6: 20 55 a4
    jmp edit_cmd_QUERY                                      ; a9b9: 4c c5 a9
; Referenced 1 time by &a9a9
.ca9bc
    cmp #&4e ; 'N'                                          ; a9bc: c9 4e
    bne ca9c1                                               ; a9be: d0 01
    dex                                                     ; a9c0: ca
; Referenced 1 time by &a9be
.ca9c1
    txa                                                     ; a9c1: 8a
    jmp osasci                                              ; a9c2: 4c e9 ff
; Referenced 5 times by &a9b9, &aaeb, &a8bd, &a85e, &a733
.edit_cmd_QUERY
    jsr print_string                                        ; a9c5: 20 d1 f7
    equs "PSION EDIT   "                                    ; a9c8: 50 53 49 ...
    nop                                                     ; a9d5: ea
    lda PAGEH                                               ; a9d6: a5 12
    jsr print_hex                                           ; a9d8: 20 3f a4
    lda #&2d ; '-'                                          ; a9db: a9 2d
    jsr osasci                                              ; a9dd: 20 e9 ff
    lda TOPH                                                ; a9e0: a5 0e
    jsr print_hex                                           ; a9e2: 20 3f a4
    lda TOPL                                                ; a9e5: a5 0d
    jsr print_hex                                           ; a9e7: 20 3f a4
    lda #&20 ; ' '                                          ; a9ea: a9 20
    ldx #&03                                                ; a9ec: a2 03
; Referenced 1 time by &a9f2
.ca9ee
    jsr osasci                                              ; a9ee: 20 e9 ff
    dex                                                     ; a9f1: ca
    bne ca9ee                                               ; a9f2: d0 fa
    lda ALTPAGEH                                            ; a9f4: a5 0c
    jsr print_hex                                           ; a9f6: 20 3f a4
    lda #&2d ; '-'                                          ; a9f9: a9 2d
    jsr osasci                                              ; a9fb: 20 e9 ff
    lda ALTTOPH                                             ; a9fe: a5 0b
    jsr print_hex                                           ; aa00: 20 3f a4
    lda ALTTOPL                                             ; aa03: a5 0a
    jsr print_hex                                           ; aa05: 20 3f a4
    jmp oscrlf                                              ; aa08: 4c ed ff
.edit_cmd_A
    jsr input_decimal                                       ; aa0b: 20 d1 a3
    sta l0009                                               ; aa0e: 85 09
    ldy #&02                                                ; aa10: a0 02
    lda (LINEPTRL),y                                        ; aa12: b1 72
    sta l007a                                               ; aa14: 85 7a
    dey                                                     ; aa16: 88
    lda (LINEPTRL),y                                        ; aa17: b1 72
    sta l007b                                               ; aa19: 85 7b
    jsr ca3f4                                               ; aa1b: 20 f4 a3
    jmp caa53                                               ; aa1e: 4c 53 aa
; Referenced 1 time by &a74d
.caa21
    lda #&3f ; '?'                                          ; aa21: a9 3f
    jsr osasci                                              ; aa23: 20 e9 ff
    lda l0100                                               ; aa26: ad 00 01
    pha                                                     ; aa29: 48
    jsr ca041                                               ; aa2a: 20 41 a0
    pla                                                     ; aa2d: 68
    cpy #&00                                                ; aa2e: c0 00
    bne caa3a                                               ; aa30: d0 08
    sta l0100                                               ; aa32: 8d 00 01
    ldx #&01                                                ; aa35: a2 01
    jmp skip_forward_x_lines                                ; aa37: 4c 7b a1
; Referenced 1 time by &aa30
.caa3a
    iny                                                     ; aa3a: c8
    lda #&ff                                                ; aa3b: a9 ff
    sta l0100,y                                             ; aa3d: 99 00 01
; Referenced 1 time by &aa4d
.caa40
    lda l0100,y                                             ; aa40: b9 00 01
    cmp l0008                                               ; aa43: c5 08
    bne caa4c                                               ; aa45: d0 05
    lda #&0d                                                ; aa47: a9 0d
    sta l0100,y                                             ; aa49: 99 00 01
; Referenced 1 time by &aa45
.caa4c
    dey                                                     ; aa4c: 88
    bne caa40                                               ; aa4d: d0 f1
    lda l0100                                               ; aa4f: ad 00 01
    rts                                                     ; aa52: 60
; Referenced 5 times by &a788, &a924, &a95c, &aa1e, &a730
.caa53
    lda #&54 ; 'T'                                          ; aa53: a9 54
    sta l0100                                               ; aa55: 8d 00 01
    lda #&0d                                                ; aa58: a9 0d
    sta l0101                                               ; aa5a: 8d 01 01
    lda #&ff                                                ; aa5d: a9 ff
    sta l0102                                               ; aa5f: 8d 02 01
    rts                                                     ; aa62: 60
.edit_cmd_STAR
    lda #&20 ; ' '                                          ; aa63: a9 20
    sta l0100                                               ; aa65: 8d 00 01
    jmp oscli                                               ; aa68: 4c f7 ff
.edit_cmd_GT
    jsr caaa6                                               ; aa6b: 20 a6 aa
    lda #&00                                                ; aa6e: a9 00
    sta l0054                                               ; aa70: 85 54
    sta l0058                                               ; aa72: 85 58
    lda PAGEH                                               ; aa74: a5 12
    sta l0055                                               ; aa76: 85 55
    sta l0059                                               ; aa78: 85 59
    lda #&b2                                                ; aa7a: a9 b2
    sta l0056                                               ; aa7c: 85 56
    lda #&c2                                                ; aa7e: a9 c2
    sta l0057                                               ; aa80: 85 57
    lda TOPL                                                ; aa82: a5 0d
    sta l005a                                               ; aa84: 85 5a
    lda TOPH                                                ; aa86: a5 0e
    sta l005b                                               ; aa88: 85 5b
    sec                                                     ; aa8a: 38
    jmp ossave                                              ; aa8b: 4c dd ff
.edit_cmd_LT
    jsr caaa6                                               ; aa8e: 20 a6 aa
    lda #&00                                                ; aa91: a9 00
    sta l0054                                               ; aa93: 85 54
    lda PAGEH                                               ; aa95: a5 12
    sta l0055                                               ; aa97: 85 55
    lda #&80                                                ; aa99: a9 80
    sta l0056                                               ; aa9b: 85 56
    sec                                                     ; aa9d: 38
    jsr osload                                              ; aa9e: 20 e0 ff
    pla                                                     ; aaa1: 68
    pla                                                     ; aaa2: 68
    jmp ca721                                               ; aaa3: 4c 21 a7
; Referenced 2 times by &aa6b, &aa8e
.caaa6
    ldy #&00                                                ; aaa6: a0 00
; Referenced 1 time by &aab1
.caaa8
    iny                                                     ; aaa8: c8
    lda l0100,y                                             ; aaa9: b9 00 01
    sta l013f,y                                             ; aaac: 99 3f 01
    cmp #&0d                                                ; aaaf: c9 0d
    bne caaa8                                               ; aab1: d0 f5
    lda #&40 ; '@'                                          ; aab3: a9 40
    sta l0052                                               ; aab5: 85 52
    lda #&01                                                ; aab7: a9 01
    sta l0053                                               ; aab9: 85 53
    ldx #&52 ; 'R'                                          ; aabb: a2 52
    rts                                                     ; aabd: 60
.edit_cmd_PLUS
    jsr ca4a2                                               ; aabe: 20 a2 a4
    jmp list_line                                           ; aac1: 4c b1 a0
.edit_cmd_M
    lda l0101                                               ; aac4: ad 01 01
    cmp #&32 ; '2'                                          ; aac7: c9 32
    beq caad8                                               ; aac9: f0 0d
    cmp #&31 ; '1'                                          ; aacb: c9 31
    beq caad2                                               ; aacd: f0 03
    jmp error_what                                          ; aacf: 4c 79 a7
; Referenced 1 time by &aacd
.caad2
    jsr set_marker_1                                        ; aad2: 20 d5 a4
    jmp list_line                                           ; aad5: 4c b1 a0
; Referenced 1 time by &aac9
.caad8
    jsr set_marker_2                                        ; aad8: 20 f0 a4
    jmp list_line                                           ; aadb: 4c b1 a0
.edit_cmd_X
    lda l0101                                               ; aade: ad 01 01
    cmp #&0d                                                ; aae1: c9 0d
    beq caae8                                               ; aae3: f0 03
    jmp error_what                                          ; aae5: 4c 79 a7
; Referenced 1 time by &aae3
.caae8
    jsr swap_text_spaces                                    ; aae8: 20 3c a5
    jmp edit_cmd_QUERY                                      ; aaeb: 4c c5 a9
.edit_cmd_I
    jsr input_decimal                                       ; aaee: 20 d1 a3
    sta l0009                                               ; aaf1: 85 09
    ldy #&02                                                ; aaf3: a0 02
    lda (LINEPTRL),y                                        ; aaf5: b1 72
    sta l007a                                               ; aaf7: 85 7a
    dey                                                     ; aaf9: 88
    lda (LINEPTRL),y                                        ; aafa: b1 72
    sta l007b                                               ; aafc: 85 7b
    cmp #&ff                                                ; aafe: c9 ff
    bne cab0b                                               ; ab00: d0 09
    lda #&00                                                ; ab02: a9 00
    sta l007a                                               ; ab04: 85 7a
    sta l007b                                               ; ab06: 85 7b
    jmp insert_buffer                                       ; ab08: 4c 7d a5
; Referenced 1 time by &ab00
.cab0b
    ldx #&01                                                ; ab0b: a2 01
    jsr skip_forward_x_lines                                ; ab0d: 20 7b a1
    jmp insert_buffer                                       ; ab10: 4c 7d a5
.edit_cmd_E
    lda l0101                                               ; ab13: ad 01 01
    cmp #&4d ; 'M'                                          ; ab16: c9 4d
    bne cab3c                                               ; ab18: d0 22
    jsr edit_cmd_L                                          ; ab1a: 20 b5 a7
    lda MARKER1L                                            ; ab1d: a5 7c
    sta LINEPTRL                                            ; ab1f: 85 72
    lda MARKER1H                                            ; ab21: a5 7d
    sta LINEPTRH                                            ; ab23: 85 73
; Referenced 1 time by &ab39
.cab25
    jsr append_line_from_text_to_buffer                     ; ab25: 20 19 a6
    clc                                                     ; ab28: 18
    lda MARKER2L                                            ; ab29: a5 7e
    sbc LINEPTRL                                            ; ab2b: e5 72
    lda MARKER2H                                            ; ab2d: a5 7f
    sbc LINEPTRH                                            ; ab2f: e5 73
    bcc cab3b                                               ; ab31: 90 08
    jsr get_line_length_in_y                                ; ab33: 20 6f a1
    jsr inc_lineptr_by_y                                    ; ab36: 20 e7 a0
    bcc cab25                                               ; ab39: 90 ea
; Referenced 1 time by &ab31
.cab3b
    rts                                                     ; ab3b: 60
; Referenced 1 time by &ab18
.cab3c
    cmp #&44 ; 'D'                                          ; ab3c: c9 44
    bne cab4d                                               ; ab3e: d0 0d
    jsr cab4d                                               ; ab40: 20 4d ab
    ldx l007a                                               ; ab43: a6 7a
    jsr skip_backwards_x_lines                              ; ab45: 20 b9 a1
    ldx l007a                                               ; ab48: a6 7a
    jmp ca1c9                                               ; ab4a: 4c c9 a1
; Referenced 2 times by &ab40, &ab3e
.cab4d
    jsr input_decimal                                       ; ab4d: 20 d1 a3
    sta l0009                                               ; ab50: 85 09
; Referenced 1 time by &ab5f
.cab52
    jsr append_line_from_text_to_buffer                     ; ab52: 20 19 a6
    jsr list_line                                           ; ab55: 20 b1 a0
    ldx #&01                                                ; ab58: a2 01
    jsr skip_forward_x_lines                                ; ab5a: 20 7b a1
    dec l0009                                               ; ab5d: c6 09
    bne cab52                                               ; ab5f: d0 f1
    rts                                                     ; ab61: 60
.edit_cmd_Z
    ldy #&ff                                                ; ab62: a0 ff
; Referenced 1 time by &ab70
.cab64
    iny                                                     ; ab64: c8
    lda l0101,y                                             ; ab65: b9 01 01
    sta l0100,y                                             ; ab68: 99 00 01
    sta l0150,y                                             ; ab6b: 99 50 01
    cmp #&ff                                                ; ab6e: c9 ff
    bne cab64                                               ; ab70: d0 f2
    jmp ca761                                               ; ab72: 4c 61 a7
.edit_cmd_MINUS
    lda l0101                                               ; ab75: ad 01 01
    cmp #&0d                                                ; ab78: c9 0d
    beq cab7f                                               ; ab7a: f0 03
    jmp error_what                                          ; ab7c: 4c 79 a7
; Referenced 1 time by &ab7a
.cab7f
    ldy #&2f ; '/'                                          ; ab7f: a0 2f
; Referenced 1 time by &ab88
.cab81
    lda l0150,y                                             ; ab81: b9 50 01
    sta l0100,y                                             ; ab84: 99 00 01
    dey                                                     ; ab87: 88
    bpl cab81                                               ; ab88: 10 f7
    ldx #&01                                                ; ab8a: a2 01
    jsr skip_forward_x_lines                                ; ab8c: 20 7b a1
    jmp ca761                                               ; ab8f: 4c 61 a7
; Referenced 3 times by &aef0, &aedf, &aecf
.cab92
    sta l0009                                               ; ab92: 85 09
; Referenced 1 time by &aba3
.cab94
    jsr caba6                                               ; ab94: 20 a6 ab
    jsr oscrlf                                              ; ab97: 20 ed ff
    jsr cac79                                               ; ab9a: 20 79 ac
    sta LINEPTRL                                            ; ab9d: 85 72
    sty LINEPTRH                                            ; ab9f: 84 73
    dec l0009                                               ; aba1: c6 09
    bne cab94                                               ; aba3: d0 ef
    rts                                                     ; aba5: 60
; Referenced 1 time by &ab94
.caba6
    jsr cac67                                               ; aba6: 20 67 ac
    lda (LINEPTRL,x)                                        ; aba9: a1 72
    tay                                                     ; abab: a8
    lsr a                                                   ; abac: 4a
    bcc cabba                                               ; abad: 90 0b
    lsr a                                                   ; abaf: 4a
    bcs cabc9                                               ; abb0: b0 17
    cmp #&22 ; '"'                                          ; abb2: c9 22
    beq cabc9                                               ; abb4: f0 13
    and #&07                                                ; abb6: 29 07
    ora #&80                                                ; abb8: 09 80
; Referenced 1 time by &abad
.cabba
    lsr a                                                   ; abba: 4a
    tax                                                     ; abbb: aa
    lda lac8d,x                                             ; abbc: bd 8d ac
    bcs cabc5                                               ; abbf: b0 04
    lsr a                                                   ; abc1: 4a
    lsr a                                                   ; abc2: 4a
    lsr a                                                   ; abc3: 4a
    lsr a                                                   ; abc4: 4a
; Referenced 1 time by &abbf
.cabc5
    and #&0f                                                ; abc5: 29 0f
    bne cabcd                                               ; abc7: d0 04
; Referenced 2 times by &abb0, &abb4
.cabc9
    ldy #&80                                                ; abc9: a0 80
    lda #&00                                                ; abcb: a9 00
; Referenced 1 time by &abc7
.cabcd
    tax                                                     ; abcd: aa
    lda lacd1,x                                             ; abce: bd d1 ac
    sta l0078                                               ; abd1: 85 78
    and #&03                                                ; abd3: 29 03
    sta l0074                                               ; abd5: 85 74
    tya                                                     ; abd7: 98
    and #&8f                                                ; abd8: 29 8f
    tax                                                     ; abda: aa
    tya                                                     ; abdb: 98
    ldy #&03                                                ; abdc: a0 03
    cpx #&8a                                                ; abde: e0 8a
    beq cabed                                               ; abe0: f0 0b
; Referenced 1 time by &abee
.cabe2
    lsr a                                                   ; abe2: 4a
    bcc cabed                                               ; abe3: 90 08
    lsr a                                                   ; abe5: 4a
; Referenced 1 time by &abea
.cabe6
    lsr a                                                   ; abe6: 4a
    ora #&20 ; ' '                                          ; abe7: 09 20
    dey                                                     ; abe9: 88
    bne cabe6                                               ; abea: d0 fa
    iny                                                     ; abec: c8
; Referenced 2 times by &abe0, &abe3
.cabed
    dey                                                     ; abed: 88
    bne cabe2                                               ; abee: d0 f2
    pha                                                     ; abf0: 48
; Referenced 1 time by &abfe
.cabf1
    lda (LINEPTRL),y                                        ; abf1: b1 72
    jsr print_hex                                           ; abf3: 20 3f a4
    ldx #&01                                                ; abf6: a2 01
; Referenced 1 time by &ac04
.cabf8
    jsr cac70                                               ; abf8: 20 70 ac
    cpy l0074                                               ; abfb: c4 74
    iny                                                     ; abfd: c8
    bcc cabf1                                               ; abfe: 90 f1
    ldx #&03                                                ; ac00: a2 03
    cpy #&04                                                ; ac02: c0 04
    bcc cabf8                                               ; ac04: 90 f2
    pla                                                     ; ac06: 68
    tay                                                     ; ac07: a8
    lda laceb,y                                             ; ac08: b9 eb ac
    sta l0075                                               ; ac0b: 85 75
    lda lad2b,y                                             ; ac0d: b9 2b ad
    sta l0076                                               ; ac10: 85 76
; Referenced 1 time by &ac24
.cac12
    lda #&00                                                ; ac12: a9 00
    ldy #&05                                                ; ac14: a0 05
; Referenced 1 time by &ac1c
.cac16
    asl l0076                                               ; ac16: 06 76
    rol l0075                                               ; ac18: 26 75
    rol a                                                   ; ac1a: 2a
    dey                                                     ; ac1b: 88
    bne cac16                                               ; ac1c: d0 f8
    adc #&bf                                                ; ac1e: 69 bf
    jsr cac88                                               ; ac20: 20 88 ac
    dex                                                     ; ac23: ca
    bne cac12                                               ; ac24: d0 ec
    jsr cac6e                                               ; ac26: 20 6e ac
    ldx #&06                                                ; ac29: a2 06
; Referenced 1 time by &ac54
.cac2b
    cpx #&03                                                ; ac2b: e0 03
    bne cac41                                               ; ac2d: d0 12
    ldy l0074                                               ; ac2f: a4 74
    beq cac41                                               ; ac31: f0 0e
; Referenced 1 time by &ac3f
.cac33
    lda l0078                                               ; ac33: a5 78
    cmp #&e8                                                ; ac35: c9 e8
    lda (LINEPTRL),y                                        ; ac37: b1 72
    bcs cac57                                               ; ac39: b0 1c
    jsr print_hex                                           ; ac3b: 20 3f a4
    dey                                                     ; ac3e: 88
    bne cac33                                               ; ac3f: d0 f2
; Referenced 2 times by &ac31, &ac2d
.cac41
    asl l0078                                               ; ac41: 06 78
    bcc cac53                                               ; ac43: 90 0e
    lda lacde,x                                             ; ac45: bd de ac
    jsr cac88                                               ; ac48: 20 88 ac
    lda lace4,x                                             ; ac4b: bd e4 ac
    beq cac53                                               ; ac4e: f0 03
    jsr cac88                                               ; ac50: 20 88 ac
; Referenced 2 times by &ac43, &ac4e
.cac53
    dex                                                     ; ac53: ca
    bne cac2b                                               ; ac54: d0 d5
    rts                                                     ; ac56: 60
; Referenced 1 time by &ac39
.cac57
    jsr cac7c                                               ; ac57: 20 7c ac
    tax                                                     ; ac5a: aa
    inx                                                     ; ac5b: e8
    bne cac5f                                               ; ac5c: d0 01
    iny                                                     ; ac5e: c8
; Referenced 1 time by &ac5c
.cac5f
    tya                                                     ; ac5f: 98
; Referenced 1 time by &ac6b
.cac60
    jsr print_hex                                           ; ac60: 20 3f a4
    txa                                                     ; ac63: 8a
    jmp print_hex                                           ; ac64: 4c 3f a4
; Referenced 4 times by &ada3, &afd5, &aba6, &afaf
.cac67
    lda LINEPTRH                                            ; ac67: a5 73
    ldx LINEPTRL                                            ; ac69: a6 72
    jsr cac60                                               ; ac6b: 20 60 ac
; Referenced 1 time by &ac26
.cac6e
    ldx #&02                                                ; ac6e: a2 02
; Referenced 3 times by &abf8, &adbc, &ac76
.cac70
    lda #&a0                                                ; ac70: a9 a0
; Referenced 1 time by &ada0
.cac72
    jsr cac88                                               ; ac72: 20 88 ac
    dex                                                     ; ac75: ca
    bne cac70                                               ; ac76: d0 f8
    rts                                                     ; ac78: 60
; Referenced 1 time by &ab9a
.cac79
    lda l0074                                               ; ac79: a5 74
    sec                                                     ; ac7b: 38
; Referenced 1 time by &ac57
.cac7c
    ldy LINEPTRH                                            ; ac7c: a4 73
    tax                                                     ; ac7e: aa
    bpl cac82                                               ; ac7f: 10 01
    dey                                                     ; ac81: 88
; Referenced 1 time by &ac7f
.cac82
    adc LINEPTRL                                            ; ac82: 65 72
    bcc cac87                                               ; ac84: 90 01
    iny                                                     ; ac86: c8
; Referenced 1 time by &ac84
.cac87
    rts                                                     ; ac87: 60
; Referenced 4 times by &ac20, &ac48, &ac72, &ac50
.cac88
    and #&7f                                                ; ac88: 29 7f
    jmp osasci                                              ; ac8a: 4c e9 ff
.lac8d
    equb &40, &02, &45, &03, &d0, &08, &40, &09             ; ac8d: @.E...@.
    equb &30, &22, &45, &33, &d0, &08, &40, &09             ; ac95: 0"E3..@.
    equb &40, &02, &45, &33, &d0, &08, &40, &09             ; ac9d: @.E3..@.
    equb &40, &02, &45, &b3, &d0, &08, &40, &09             ; aca5: @.E...@.
    equb &00, &22, &44, &33, &d0, &8c, &44, &00             ; acad: ."D3..D.
    equb &11, &22, &44, &33, &d0, &8c, &44, &9a             ; acb5: ."D3..D.
    equb &10, &22, &44, &33, &d0, &08, &40, &09             ; acbd: ."D3..@.
    equb &10, &22, &44, &33, &d0, &08, &40, &09             ; acc5: ."D3..@.
    equb &62, &13, &78, &a9                                 ; accd: b.x.
.lacd1
    equb &00, &21, &81, &82, &00, &00, &59, &4d             ; acd1: .!....YM
    equb &91, &92, &86, &4a, &85                            ; acd9: ...J.
.lacde
    equb &9d, &ac, &a9, &ac, &40, &a8                       ; acde: ....@.
.lace4
    equb &a3, &d9, &00, &d8, &a3, &a3, &00                  ; ace4: .......
.laceb
    equb &1c, &8a, &1c, &23, &5d, &8b, &1b, &a1             ; aceb: ...#]...
    equb &9d, &8a, &1d, &23, &9d, &8b, &1d, &a1             ; acf3: ...#....
    equb &00, &29, &19, &ae, &69, &a8, &19, &23             ; acfb: .)..i..#
    equb &24, &53, &1b, &23, &24, &53, &19, &a1             ; ad03: $S.#$S..
    equb &00, &1a, &5b, &5b, &a5, &69, &24, &24             ; ad0b: ..[[.i$$
    equb &ae, &ae, &a8, &ad, &29, &00, &7c, &00             ; ad13: ....).|.
    equb &15, &9c, &6d, &9c, &a5, &69, &29, &53             ; ad1b: ..m..i)S
    equb &84, &13, &34, &11, &a5, &69, &23, &a0             ; ad23: ..4..i#.
.lad2b
    equb &d8, &62, &5a, &48, &26, &62, &94, &88             ; ad2b: .bZH&b..
    equb &54, &44, &c8, &54, &68, &44, &e8, &94             ; ad33: TD.ThD..
    equb &00, &b4, &08, &84, &74, &b4, &28, &6e             ; ad3b: ....t.(n
    equb &74, &f4, &cc, &4a, &72, &f2, &a4, &8a             ; ad43: t..Jr...
    equb &00, &aa, &a2, &a2, &74, &74, &74, &72             ; ad4b: ....tttr
    equb &44, &68, &b2, &32, &b2, &00, &22, &00             ; ad53: Dh.2..".
    equb &1a, &1a, &26, &26, &72, &72, &88, &c8             ; ad5b: ..&&rr..
    equb &c4, &ca, &26, &48, &44, &44, &a2, &c8             ; ad63: ..&HDD..
.lad6b
    equs "QWDCFOBGAXYPRM"                                   ; ad6b: 51 57 44 ...
    equb &0d                                                ; ad79: .
.lad7a
    equb <(debug_cmd_Q)                                     ; ad7a: .
    equb <(debug_cmd_W)                                     ; ad7b: .
    equb <(debug_cmd_D)                                     ; ad7c: .
    equb <(debug_cmd_C)                                     ; ad7d: .
    equb <(debug_cmd_F)                                     ; ad7e: .
    equb <(debug_cmd_O)                                     ; ad7f: .
    equb <(debug_cmd_B)                                     ; ad80: .
    equb <(debug_cmd_G)                                     ; ad81: .
    equb <(debug_cmd_A)                                     ; ad82: .
    equb <(debug_cmd_X)                                     ; ad83: .
    equb <(debug_cmd_Y)                                     ; ad84: .
    equb <(debug_cmd_P)                                     ; ad85: .
    equb <(debug_cmd_R)                                     ; ad86: .
    equb <(debug_cmd_M)                                     ; ad87: .
.lad88
    equb >(debug_cmd_Q)                                     ; ad88: .
    equb >(debug_cmd_W)                                     ; ad89: .
    equb >(debug_cmd_D)                                     ; ad8a: .
    equb >(debug_cmd_C)                                     ; ad8b: .
    equb >(debug_cmd_F)                                     ; ad8c: .
    equb >(debug_cmd_O)                                     ; ad8d: .
    equb >(debug_cmd_B)                                     ; ad8e: .
    equb >(debug_cmd_G)                                     ; ad8f: .
    equb >(debug_cmd_A)                                     ; ad90: .
    equb >(debug_cmd_X)                                     ; ad91: .
    equb >(debug_cmd_Y)                                     ; ad92: .
    equb >(debug_cmd_P)                                     ; ad93: .
    equb >(debug_cmd_R)                                     ; ad94: .
    equb >(debug_cmd_M)                                     ; ad95: .
; Referenced 1 time by &adc5
.cad96
    cmp #&20 ; ' '                                          ; ad96: c9 20
    bcc cad9e                                               ; ad98: 90 04
    cmp #&80                                                ; ad9a: c9 80
    bcc cada0                                               ; ad9c: 90 02
; Referenced 1 time by &ad98
.cad9e
    lda #&20 ; ' '                                          ; ad9e: a9 20
; Referenced 1 time by &ad9c
.cada0
    jmp cac72                                               ; ada0: 4c 72 ac
; Referenced 2 times by &aea3, &aebe
.cada3
    jsr cac67                                               ; ada3: 20 67 ac
    ldy #&00                                                ; ada6: a0 00
; Referenced 1 time by &adb5
.cada8
    lda (LINEPTRL),y                                        ; ada8: b1 72
    jsr print_hex                                           ; adaa: 20 3f a4
    lda #&20 ; ' '                                          ; adad: a9 20
    jsr osasci                                              ; adaf: 20 e9 ff
    iny                                                     ; adb2: c8
    cpy l0008                                               ; adb3: c4 08
    bne cada8                                               ; adb5: d0 f1
    jsr oscrlf                                              ; adb7: 20 ed ff
    ldx #&06                                                ; adba: a2 06
    jsr cac70                                               ; adbc: 20 70 ac
    ldy #&00                                                ; adbf: a0 00
; Referenced 1 time by &adcb
.cadc1
    lda (LINEPTRL),y                                        ; adc1: b1 72
    ldx #&03                                                ; adc3: a2 03
    jsr cad96                                               ; adc5: 20 96 ad
    iny                                                     ; adc8: c8
    cpy l0008                                               ; adc9: c4 08
    bne cadc1                                               ; adcb: d0 f4
    clc                                                     ; adcd: 18
    lda LINEPTRL                                            ; adce: a5 72
    adc l0008                                               ; add0: 65 08
    sta LINEPTRL                                            ; add2: 85 72
    bcc cadd8                                               ; add4: 90 02
    inc LINEPTRH                                            ; add6: e6 73
; Referenced 1 time by &add4
.cadd8
    jmp oscrlf                                              ; add8: 4c ed ff
.brk_handler
    sta MARKER1L                                            ; addb: 85 7c
    pla                                                     ; addd: 68
    sta MARKER2H                                            ; adde: 85 7f
    pla                                                     ; ade0: 68
    sec                                                     ; ade1: 38
    sbc #&02                                                ; ade2: e9 02
    sta LINEPTRL                                            ; ade4: 85 72
    pla                                                     ; ade6: 68
    sbc #&00                                                ; ade7: e9 00
    sta LINEPTRH                                            ; ade9: 85 73
    stx MARKER1H                                            ; adeb: 86 7d
    sty MARKER2L                                            ; aded: 84 7e
    tsx                                                     ; adef: ba
    stx l0079                                               ; adf0: 86 79
    jsr debug_cmd_R                                         ; adf2: 20 8e af
    jmp zzz_handler                                         ; adf5: 4c 50 af
; Referenced 1 time by &afc5
.cadf8
    ldx #&08                                                ; adf8: a2 08
; Referenced 1 time by &ae04
.cadfa
    asl a                                                   ; adfa: 0a
    pha                                                     ; adfb: 48
    lda #&18                                                ; adfc: a9 18
    rol a                                                   ; adfe: 2a
    jsr osasci                                              ; adff: 20 e9 ff
    pla                                                     ; ae02: 68
    dex                                                     ; ae03: ca
    bne cadfa                                               ; ae04: d0 f4
    rts                                                     ; ae06: 60
; Referenced 1 time by &a013
.cae07
    cld                                                     ; ae07: d8
    lda #&08                                                ; ae08: a9 08
    sta l0008                                               ; ae0a: 85 08
    lda #&00                                                ; ae0c: a9 00
    sta ALTTOPL                                             ; ae0e: 85 0a
    sta ALTTOPH                                             ; ae10: 85 0b
    sta ALTPAGEH                                            ; ae12: 85 0c
    sta MARKER1L                                            ; ae14: 85 7c
    sta MARKER1H                                            ; ae16: 85 7d
    sta MARKER2L                                            ; ae18: 85 7e
    lda #&20 ; ' '                                          ; ae1a: a9 20
    sta MARKER2H                                            ; ae1c: 85 7f
    sta l0100                                               ; ae1e: 8d 00 01
    lda #<brk_handler                                       ; ae21: a9 db
    sta BRKVECL                                             ; ae23: 8d 02 02
    lda #>brk_handler                                       ; ae26: a9 ad
    sta BRKVECH                                             ; ae28: 8d 03 02
.xxx_handler
    lda #>(xxx_handler-1)                                   ; ae2b: a9 ae
    pha                                                     ; ae2d: 48
    lda #<(xxx_handler-1) ; '*'                             ; ae2e: a9 2a
    pha                                                     ; ae30: 48
    lda l0100                                               ; ae31: ad 00 01
    pha                                                     ; ae34: 48
    lda #&2d ; '-'                                          ; ae35: a9 2d
    jsr cae6e                                               ; ae37: 20 6e ae
    pla                                                     ; ae3a: 68
    ldx l0100                                               ; ae3b: ae 00 01
    cpx #&0d                                                ; ae3e: e0 0d
    bne cae45                                               ; ae40: d0 03
    sta l0100                                               ; ae42: 8d 00 01
; Referenced 1 time by &ae40
.cae45
    lda l0100                                               ; ae45: ad 00 01
    ldx #&0d                                                ; ae48: a2 0d
; Referenced 1 time by &ae50
.cae4a
    cmp lad6b,x                                             ; ae4a: dd 6b ad
    beq cae61                                               ; ae4d: f0 12
    dex                                                     ; ae4f: ca
    bpl cae4a                                               ; ae50: 10 f8
    jsr print_bel                                           ; ae52: 20 1a fd
    jsr print_string                                        ; ae55: 20 d1 f7
    equs "WHAT?"                                            ; ae58: 57 48 41 ...
    nop                                                     ; ae5d: ea
    jmp oscrlf                                              ; ae5e: 4c ed ff
; Referenced 1 time by &ae4d
.cae61
    lda lad7a,x                                             ; ae61: bd 7a ad
    sta l0074                                               ; ae64: 85 74
    lda lad88,x                                             ; ae66: bd 88 ad
    sta l0075                                               ; ae69: 85 75
    jmp (l0074)                                             ; ae6b: 6c 74 00
; Referenced 5 times by &af68, &afe1, &ae88, &af09, &ae37
.cae6e
    jsr osasci                                              ; ae6e: 20 e9 ff
    jmp ca041                                               ; ae71: 4c 41 a0
.debug_cmd_Q
    ldx #&ff                                                ; ae74: a2 ff
    txs                                                     ; ae76: 9a
    jmp basic_end                                           ; ae77: 4c 9b cd
.debug_cmd_W
    ldx #&72 ; 'r'                                          ; ae7a: a2 72
; Referenced 1 time by &af2a
.cae7c
    lda l0001,x                                             ; ae7c: b5 01
    jsr print_hex                                           ; ae7e: 20 3f a4
    lda l0000,x                                             ; ae81: b5 00
    jsr print_hex                                           ; ae83: 20 3f a4
    lda #&3f ; '?'                                          ; ae86: a9 3f
    jsr cae6e                                               ; ae88: 20 6e ae
    cmp #&0d                                                ; ae8b: c9 0d
    bne cae90                                               ; ae8d: d0 01
    rts                                                     ; ae8f: 60
; Referenced 1 time by &ae8d
.cae90
    ldy #&00                                                ; ae90: a0 00
    jmp input_hex                                           ; ae92: 4c 85 a6
.debug_cmd_D
    lda l0101                                               ; ae95: ad 01 01
    cmp #&2c ; ','                                          ; ae98: c9 2c
    bne caeb1                                               ; ae9a: d0 15
    ldy #&02                                                ; ae9c: a0 02
    ldx #&7a ; 'z'                                          ; ae9e: a2 7a
    jsr input_hex                                           ; aea0: 20 85 a6
; Referenced 1 time by &aeae
.caea3
    jsr cada3                                               ; aea3: 20 a3 ad
    lda l007a                                               ; aea6: a5 7a
    cmp LINEPTRL                                            ; aea8: c5 72
    lda l007b                                               ; aeaa: a5 7b
    sbc LINEPTRH                                            ; aeac: e5 73
    bcs caea3                                               ; aeae: b0 f3
    rts                                                     ; aeb0: 60
; Referenced 1 time by &ae9a
.caeb1
    cmp #&0d                                                ; aeb1: c9 0d
    beq caeba                                               ; aeb3: f0 05
    jsr input_decimal                                       ; aeb5: 20 d1 a3
    bne caebe                                               ; aeb8: d0 04
; Referenced 1 time by &aeb3
.caeba
    lda #&07                                                ; aeba: a9 07
    sta l007a                                               ; aebc: 85 7a
; Referenced 2 times by &aeb8, &aec3
.caebe
    jsr cada3                                               ; aebe: 20 a3 ad
    dec l007a                                               ; aec1: c6 7a
    bne caebe                                               ; aec3: d0 f9
    rts                                                     ; aec5: 60
.debug_cmd_C
    lda l0101                                               ; aec6: ad 01 01
    cmp #&0d                                                ; aec9: c9 0d
    bne caed2                                               ; aecb: d0 05
    lda #&0f                                                ; aecd: a9 0f
    jmp cab92                                               ; aecf: 4c 92 ab
; Referenced 1 time by &aecb
.caed2
    cmp #&2c ; ','                                          ; aed2: c9 2c
    bne caeed                                               ; aed4: d0 17
    ldy #&02                                                ; aed6: a0 02
    ldx #&7a ; 'z'                                          ; aed8: a2 7a
    jsr input_hex                                           ; aeda: 20 85 a6
; Referenced 1 time by &aeea
.caedd
    lda #&01                                                ; aedd: a9 01
    jsr cab92                                               ; aedf: 20 92 ab
    lda l007a                                               ; aee2: a5 7a
    cmp LINEPTRL                                            ; aee4: c5 72
    lda l007b                                               ; aee6: a5 7b
    sbc LINEPTRH                                            ; aee8: e5 73
    bcs caedd                                               ; aeea: b0 f1
    rts                                                     ; aeec: 60
; Referenced 1 time by &aed4
.caeed
    jsr input_decimal                                       ; aeed: 20 d1 a3
    jmp cab92                                               ; aef0: 4c 92 ab
.debug_cmd_F
    lda #&03                                                ; aef3: a9 03
    sta VARIABLE_AT                                         ; aef5: 8d 21 03
    lda #&00                                                ; aef8: a9 00
    sta l0043                                               ; aefa: 85 43
    sta l0034                                               ; aefc: 85 34
    sta l0025                                               ; aefe: 85 25
    lda l0008                                               ; af00: a5 08
    sta l0016                                               ; af02: 85 16
    jsr basic_print_decimal                                 ; af04: 20 89 c5
    lda #&3f ; '?'                                          ; af07: a9 3f
    jsr cae6e                                               ; af09: 20 6e ae
    cmp #&0d                                                ; af0c: c9 0d
    beq caf19                                               ; af0e: f0 09
    ldy #&00                                                ; af10: a0 00
    jsr input_decimal_raw                                   ; af12: 20 20 a1
    lda l007a                                               ; af15: a5 7a
    sta l0008                                               ; af17: 85 08
; Referenced 1 time by &af0e
.caf19
    rts                                                     ; af19: 60
.debug_cmd_O
    lda #&02                                                ; af1a: a9 02
    ldx l0101                                               ; af1c: ae 01 01
    cpx #&4e ; 'N'                                          ; af1f: e0 4e
    beq caf25                                               ; af21: f0 02
    lda #&03                                                ; af23: a9 03
; Referenced 1 time by &af21
.caf25
    jmp osasci                                              ; af25: 4c e9 ff
.debug_cmd_B
    ldx #&0a                                                ; af28: a2 0a
    jmp cae7c                                               ; af2a: 4c 7c ae
.debug_cmd_G
    lda ALTTOPL                                             ; af2d: a5 0a
    ora ALTTOPH                                             ; af2f: 05 0b
    beq caf3d                                               ; af31: f0 0a
    ldy #&00                                                ; af33: a0 00
    lda (ALTTOPL),y                                         ; af35: b1 0a
    sta ALTPAGEH                                            ; af37: 85 0c
    lda #&00                                                ; af39: a9 00
    sta (ALTTOPL),y                                         ; af3b: 91 0a
; Referenced 1 time by &af31
.caf3d
    lda #>zzz_handler                                       ; af3d: a9 af
    pha                                                     ; af3f: 48
    lda #<zzz_handler ; 'P'                                 ; af40: a9 50
    pha                                                     ; af42: 48
    lda MARKER2H                                            ; af43: a5 7f
    pha                                                     ; af45: 48
    lda MARKER1L                                            ; af46: a5 7c
    ldx MARKER1H                                            ; af48: a6 7d
    ldy MARKER2L                                            ; af4a: a4 7e
    plp                                                     ; af4c: 28
    jmp (LINEPTRL)                                          ; af4d: 6c 72 00
; Referenced 1 time by &adf5
.zzz_handler
    nop                                                     ; af50: ea
    cld                                                     ; af51: d8
    lda ALTTOPL                                             ; af52: a5 0a
    ora ALTTOPH                                             ; af54: 05 0b
    beq caf5e                                               ; af56: f0 06
    ldy #&00                                                ; af58: a0 00
    lda ALTPAGEH                                            ; af5a: a5 0c
    sta (ALTTOPL),y                                         ; af5c: 91 0a
; Referenced 1 time by &af56
.caf5e
    rts                                                     ; af5e: 60
.debug_cmd_A
    ldx #&7c ; '|'                                          ; af5f: a2 7c
; Referenced 3 times by &af81, &af8b, &af86
.caf61
    lda l0000,x                                             ; af61: b5 00
    jsr print_hex                                           ; af63: 20 3f a4
    lda #&3f ; '?'                                          ; af66: a9 3f
    jsr cae6e                                               ; af68: 20 6e ae
    cmp #&0d                                                ; af6b: c9 0d
    beq caf7e                                               ; af6d: f0 0f
    ldy #&00                                                ; af6f: a0 00
    stx l0078                                               ; af71: 86 78
    ldx #&74 ; 't'                                          ; af73: a2 74
    jsr input_hex                                           ; af75: 20 85 a6
    ldx l0078                                               ; af78: a6 78
    lda l0074                                               ; af7a: a5 74
    sta l0000,x                                             ; af7c: 95 00
; Referenced 1 time by &af6d
.caf7e
    rts                                                     ; af7e: 60
.debug_cmd_X
    ldx #&7d ; '}'                                          ; af7f: a2 7d
    jmp caf61                                               ; af81: 4c 61 af
.debug_cmd_Y
    ldx #&7e ; '~'                                          ; af84: a2 7e
    jmp caf61                                               ; af86: 4c 61 af
.debug_cmd_P
    ldx #&7f                                                ; af89: a2 7f
    jmp caf61                                               ; af8b: 4c 61 af
; Referenced 1 time by &adf2
.debug_cmd_R
    jsr print_string                                        ; af8e: 20 d1 f7
    equs "PC    A  X  Y  NV BDIZC SP"                       ; af91: 50 43 20 ...
    nop                                                     ; afab: ea
    jsr oscrlf                                              ; afac: 20 ed ff
    jsr cac67                                               ; afaf: 20 67 ac
    ldx #&00                                                ; afb2: a2 00
; Referenced 1 time by &afc1
.cafb4
    lda MARKER1L,x                                          ; afb4: b5 7c
    jsr print_hex                                           ; afb6: 20 3f a4
    lda #&20 ; ' '                                          ; afb9: a9 20
    jsr osasci                                              ; afbb: 20 e9 ff
    inx                                                     ; afbe: e8
    cpx #&03                                                ; afbf: e0 03
    bcc cafb4                                               ; afc1: 90 f1
    lda MARKER2H                                            ; afc3: a5 7f
    jsr cadf8                                               ; afc5: 20 f8 ad
    lda #&20 ; ' '                                          ; afc8: a9 20
    jsr osasci                                              ; afca: 20 e9 ff
    lda l0079                                               ; afcd: a5 79
    jsr print_hex                                           ; afcf: 20 3f a4
    jmp oscrlf                                              ; afd2: 4c ed ff
; Referenced 2 times by &aff9, &affd
.debug_cmd_M
    jsr cac67                                               ; afd5: 20 67 ac
    ldy #&00                                                ; afd8: a0 00
    lda (LINEPTRL),y                                        ; afda: b1 72
    jsr print_hex                                           ; afdc: 20 3f a4
    lda #&3f ; '?'                                          ; afdf: a9 3f
    jsr cae6e                                               ; afe1: 20 6e ae
    cmp #&0d                                                ; afe4: c9 0d
    beq cafff                                               ; afe6: f0 17
    cmp #&20 ; ' '                                          ; afe8: c9 20
    beq caff7                                               ; afea: f0 0b
    ldy #&00                                                ; afec: a0 00
    ldx #&74 ; 't'                                          ; afee: a2 74
    jsr input_hex                                           ; aff0: 20 85 a6
    ldy #&00                                                ; aff3: a0 00
    sta (LINEPTRL),y                                        ; aff5: 91 72
; Referenced 1 time by &afea
.caff7
    inc LINEPTRL                                            ; aff7: e6 72
    bne debug_cmd_M                                         ; aff9: d0 da
    inc LINEPTRH                                            ; affb: e6 73
    bne debug_cmd_M                                         ; affd: d0 d6
; Referenced 1 time by &afe6
.cafff
    rts                                                     ; afff: 60
.pydis_end

; Label references by decreasing frequency:
;     print_hex:                           17
;     list_line:                           16
;     oscrlf:                              15
;     osasci:                              14
;     get_line_length_in_y:                13
;     input_decimal:                       13
;     inc_lineptr_by_y:                    12
;     error_what:                          10
;     print_string:                         9
;     set_lineptr_to_page:                  8
;     skip_forward_x_lines:                 8
;     skip_backwards_x_lines:               8
;     ca041:                                6
;     input_decimal_raw:                    6
;     input_hex:                            6
;     ca11f:                                5
;     edit_cmd_QUERY:                       5
;     caa53:                                5
;     cae6e:                                5
;     ca25d:                                4
;     cac67:                                4
;     cac88:                                4
;     compare_lineptr_with_top:             3
;     ca108:                                3
;     ca1c9:                                3
;     ca1ec:                                3
;     ca246:                                3
;     ca2ca:                                3
;     ca31b:                                3
;     ca349:                                3
;     ca3bf:                                3
;     set_top_to_end_of_program:            3
;     count_delimiters:                     3
;     end_marker_at_lineptr:                3
;     ca761:                                3
;     cab92:                                3
;     cac70:                                3
;     caf61:                                3
;     basic_print_decimal:                  3
;     print_bel:                            3
;     ca019:                                2
;     ca043:                                2
;     ca126:                                2
;     ca162:                                2
;     ca18a:                                2
;     ca1b1:                                2
;     ca1c8:                                2
;     ca21c:                                2
;     match_pattern:                        2
;     ca2a5:                                2
;     ca2cc:                                2
;     ca34a:                                2
;     ca3a6:                                2
;     ca3f4:                                2
;     ca474:                                2
;     set_top_to_lineptr:                   2
;     ca488:                                2
;     insert_buffer:                        2
;     append_line_from_text_to_buffer:      2
;     renumber_lines:                       2
;     ca683:                                2
;     ca76f:                                2
;     edit_cmd_L:                           2
;     ca7d4:                                2
;     ca919:                                2
;     ca94a:                                2
;     caaa6:                                2
;     cab4d:                                2
;     cabc9:                                2
;     cabed:                                2
;     cac41:                                2
;     cac53:                                2
;     cada3:                                2
;     caebe:                                2
;     debug_cmd_M:                          2
;     basic_end:                            2
;     ca00c:                                1
;     ca016:                                1
;     ca01c:                                1
;     ca025:                                1
;     ca034:                                1
;     ca050:                                1
;     ca059:                                1
;     ca06a:                                1
;     multiply_by_10:                       1
;     ca0d0:                                1
;     ca0da:                                1
;     ca0fc:                                1
;     ca106:                                1
;     ca111:                                1
;     dec_lineptr_by_a:                     1
;     ca16d:                                1
;     ca171:                                1
;     ca17a:                                1
;     ca17f:                                1
;     get_start_of_last_line:               1
;     ca19a:                                1
;     ca1bd:                                1
;     ca208:                                1
;     ca218:                                1
;     ca22c:                                1
;     ca23b:                                1
;     ca24f:                                1
;     ca257:                                1
;     ca274:                                1
;     ca284:                                1
;     ca288:                                1
;     ca28c:                                1
;     ca298:                                1
;     ca2a8:                                1
;     ca2bf:                                1
;     ca2d1:                                1
;     ca2e6:                                1
;     ca2ed:                                1
;     ca30f:                                1
;     ca341:                                1
;     ca357:                                1
;     ca386:                                1
;     ca3ae:                                1
;     ca3bc:                                1
;     ca3c8:                                1
;     ca3d3:                                1
;     ca3db:                                1
;     ca3e7:                                1
;     ca404:                                1
;     ca42e:                                1
;     ca436:                                1
;     ca448:                                1
;     ca450:                                1
;     ca45e:                                1
;     ca4a2:                                1
;     ca4b9:                                1
;     ca4c9:                                1
;     set_marker_1:                         1
;     ca4ef:                                1
;     set_marker_2:                         1
;     ca50a:                                1
;     ca50b:                                1
;     swap_text_spaces:                     1
;     ca569:                                1
;     ca5a9:                                1
;     ca5bc:                                1
;     ca5de:                                1
;     ca5f1:                                1
;     ca5fb:                                1
;     ca5fe:                                1
;     ca60b:                                1
;     ca616:                                1
;     ca624:                                1
;     ca633:                                1
;     ca641:                                1
;     ca64b:                                1
;     ca667:                                1
;     ca66f:                                1
;     ca670:                                1
;     ca680:                                1
;     ca684:                                1
;     ca68b:                                1
;     ca69b:                                1
;     ca6a8:                                1
;     ca6af:                                1
;     ca6b9:                                1
;     ca713:                                1
;     ca721:                                1
;     ca73e:                                1
;     ca753:                                1
;     ca755:                                1
;     ca771:                                1
;     ca78b:                                1
;     ca7a2:                                1
;     ca7b2:                                1
;     ca7c4:                                1
;     ca7db:                                1
;     ca7ee:                                1
;     ca7fc:                                1
;     ca80f:                                1
;     ca810:                                1
;     la81c:                                1
;     ca81d:                                1
;     ca829:                                1
;     ca82d:                                1
;     ca83d:                                1
;     ca845:                                1
;     ca849:                                1
;     ca861:                                1
;     ca86f:                                1
;     ca887:                                1
;     ca891:                                1
;     ca89b:                                1
;     ca8c0:                                1
;     ca8c7:                                1
;     ca8da:                                1
;     ca8fd:                                1
;     ca913:                                1
;     ca91c:                                1
;     ca931:                                1
;     ca936:                                1
;     edit_cmd_SPACE:                       1
;     ca94d:                                1
;     ca969:                                1
;     ca972:                                1
;     ca984:                                1
;     ca989:                                1
;     ca992:                                1
;     ca9a1:                                1
;     ca9bc:                                1
;     ca9c1:                                1
;     ca9ee:                                1
;     caa21:                                1
;     caa3a:                                1
;     caa40:                                1
;     caa4c:                                1
;     caaa8:                                1
;     caad2:                                1
;     caad8:                                1
;     caae8:                                1
;     cab0b:                                1
;     cab25:                                1
;     cab3b:                                1
;     cab3c:                                1
;     cab52:                                1
;     cab64:                                1
;     cab7f:                                1
;     cab81:                                1
;     cab94:                                1
;     caba6:                                1
;     cabba:                                1
;     cabc5:                                1
;     cabcd:                                1
;     cabe2:                                1
;     cabe6:                                1
;     cabf1:                                1
;     cabf8:                                1
;     cac12:                                1
;     cac16:                                1
;     cac2b:                                1
;     cac33:                                1
;     cac57:                                1
;     cac5f:                                1
;     cac60:                                1
;     cac6e:                                1
;     cac72:                                1
;     cac79:                                1
;     cac7c:                                1
;     cac82:                                1
;     cac87:                                1
;     cad96:                                1
;     cad9e:                                1
;     cada0:                                1
;     cada8:                                1
;     cadc1:                                1
;     cadd8:                                1
;     cadf8:                                1
;     cadfa:                                1
;     cae07:                                1
;     cae45:                                1
;     cae4a:                                1
;     cae61:                                1
;     cae7c:                                1
;     cae90:                                1
;     caea3:                                1
;     caeb1:                                1
;     caeba:                                1
;     caed2:                                1
;     caedd:                                1
;     caeed:                                1
;     caf19:                                1
;     caf25:                                1
;     caf3d:                                1
;     zzz_handler:                          1
;     caf5e:                                1
;     caf7e:                                1
;     debug_cmd_R:                          1
;     cafb4:                                1
;     caff7:                                1
;     cafff:                                1
;     basic_post_cmd_checks_and_next_cmd:   1
;     ossave:                               1
;     osload:                               1
;     osecho:                               1
;     oscli:                                1
    assert <(debug_cmd_A) == &5f
    assert <(debug_cmd_B) == &28
    assert <(debug_cmd_C) == &c6
    assert <(debug_cmd_D) == &95
    assert <(debug_cmd_F) == &f3
    assert <(debug_cmd_G) == &2d
    assert <(debug_cmd_M) == &d5
    assert <(debug_cmd_O) == &1a
    assert <(debug_cmd_P) == &89
    assert <(debug_cmd_Q) == &74
    assert <(debug_cmd_R) == &8e
    assert <(debug_cmd_W) == &7a
    assert <(debug_cmd_X) == &7f
    assert <(debug_cmd_Y) == &84
    assert <(edit_cmd_A) == &0b
    assert <(edit_cmd_B) == &a5
    assert <(edit_cmd_C) == &7a
    assert <(edit_cmd_D) == &79
    assert <(edit_cmd_E) == &13
    assert <(edit_cmd_GT) == &6b
    assert <(edit_cmd_H) == &27
    assert <(edit_cmd_I) == &ee
    assert <(edit_cmd_L) == &b5
    assert <(edit_cmd_LT) == &8e
    assert <(edit_cmd_M) == &c4
    assert <(edit_cmd_MINUS) == &75
    assert <(edit_cmd_N) == &4c
    assert <(edit_cmd_O) == &a2
    assert <(edit_cmd_PLUS) == &be
    assert <(edit_cmd_Q) == &98
    assert <(edit_cmd_QUERY) == &c5
    assert <(edit_cmd_R) == &df
    assert <(edit_cmd_S) == &5f
    assert <(edit_cmd_SPACE) == &4b
    assert <(edit_cmd_STAR) == &63
    assert <(edit_cmd_T) == &a8
    assert <(edit_cmd_X) == &de
    assert <(edit_cmd_Z) == &62
    assert <(xxx_handler-1) == &2a
    assert <(yyy_handler-1) == &35
    assert <brk_handler == &db
    assert <zzz_handler == &50
    assert >(debug_cmd_A) == &af
    assert >(debug_cmd_B) == &af
    assert >(debug_cmd_C) == &ae
    assert >(debug_cmd_D) == &ae
    assert >(debug_cmd_F) == &ae
    assert >(debug_cmd_G) == &af
    assert >(debug_cmd_M) == &af
    assert >(debug_cmd_O) == &af
    assert >(debug_cmd_P) == &af
    assert >(debug_cmd_Q) == &ae
    assert >(debug_cmd_R) == &af
    assert >(debug_cmd_W) == &ae
    assert >(debug_cmd_X) == &af
    assert >(debug_cmd_Y) == &af
    assert >(edit_cmd_A) == &aa
    assert >(edit_cmd_B) == &a8
    assert >(edit_cmd_C) == &a9
    assert >(edit_cmd_D) == &a8
    assert >(edit_cmd_E) == &ab
    assert >(edit_cmd_GT) == &aa
    assert >(edit_cmd_H) == &a9
    assert >(edit_cmd_I) == &aa
    assert >(edit_cmd_L) == &a7
    assert >(edit_cmd_LT) == &aa
    assert >(edit_cmd_M) == &aa
    assert >(edit_cmd_MINUS) == &ab
    assert >(edit_cmd_N) == &a8
    assert >(edit_cmd_O) == &a9
    assert >(edit_cmd_PLUS) == &aa
    assert >(edit_cmd_Q) == &a7
    assert >(edit_cmd_QUERY) == &a9
    assert >(edit_cmd_R) == &a8
    assert >(edit_cmd_S) == &a9
    assert >(edit_cmd_SPACE) == &a9
    assert >(edit_cmd_STAR) == &aa
    assert >(edit_cmd_T) == &a7
    assert >(edit_cmd_X) == &aa
    assert >(edit_cmd_Z) == &ab
    assert >(xxx_handler-1) == &ae
    assert >(yyy_handler-1) == &a7
    assert >brk_handler == &ad
    assert >zzz_handler == &af

save pydis_start, pydis_end
