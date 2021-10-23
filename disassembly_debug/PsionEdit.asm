l0000 = &0000
l0001 = &0001
l0003 = &0003
l0005 = &0005
l0006 = &0006
l0008 = &0008
l0009 = &0009
ALTTOPX = &000a
BRKADRL = &000a
ALTTOLH = &000b
BRLADRH = &000b
ALTPAGEH = &000c
BRKINSTR = &000c
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
REGPCL = &0072
LINEPTRH = &0073
REGPCH = &0073
l0074 = &0074
l0075 = &0075
l0076 = &0076
l0077 = &0077
l0078 = &0078
l0079 = &0079
REGSP = &0079
l007a = &007a
l007b = &007b
MARKER1L = &007c
REGA = &007c
MARKER1H = &007d
REGX = &007d
MARKER2L = &007e
REGY = &007e
MARKER2H = &007f
REGP = &007f
l0100 = &0100
l0101 = &0101
l0102 = &0102
l0150 = &0150
BRKVECL = &0202
BRKVECH = &0203
VARIABLE_AT = &0321
edit_cmd_AT = &2800
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
osrdch = &ffe3
osecho = &ffe6
osasci = &ffe9
oscrlf = &ffed
oswrch = &fff4
oscli = &fff7
    org &a000
    guard &b000
.pydis_start
    equb &40, &bf                                           ; a000: @.
    ldx l0006
    dex
    beq ca00a
    jmp basic_post_cmd_checks_and_next_cmd
; Referenced 1 time by &a005
.ca00a
    dex
; Referenced 1 time by &a01f
.ca00b
    ldy l0003
    dey
; Referenced 1 time by &a017
.ca00e
    inx
    iny
    lda command_table,x
    bmi ca021
    cmp (l0005),y
    beq ca00e
; Referenced 1 time by &a01d
.ca019
    inx
    lda command_table-1,x
    bpl ca019
    bmi ca00b
; Referenced 1 time by &a013
.ca021
    pha
    lda command_table+1,x
    pha
    jmp basic_post_cmd_checks+2
.command_table
    equs "EDX"
    equb >(edit_cmd-1)                                      ; a02c: .
    equb <(edit_cmd-1)                                      ; a02d: .
    equs "DEBUG"
    equb >(debug_cmd-1)                                     ; a033: .
    equb <(debug_cmd-1)                                     ; a034: .
    equb >(basic_next_command-1)                            ; a035: .
    equb <(basic_next_command-1)                            ; a036: .
; Referenced 1 time by &aff4
.ca037
    lda LINEPTRL
    bne ca03d
    dec LINEPTRH
; Referenced 1 time by &a039
.ca03d
    dec LINEPTRL
    bcs ca089
; Referenced 5 times by &ae71, &aa2a, &a04d, &a426, &a055
.ca041
    ldy #&00
; Referenced 2 times by &a063, &a057
.ca043
    jsr osecho
    cmp #&18
    bne ca050
    jsr oscrlf
    jmp ca041
; Referenced 1 time by &a048
.ca050
    cmp #&7f
    bne ca059
    dey
    bmi ca041
    bpl ca043
; Referenced 2 times by &a052, &a087
.ca059
    sta l0100,y
    iny
    cpy #&7e ; '~'
    beq ca06a
    cmp #&0d
    bne ca043
    dey
    lda l0100
    rts
; Referenced 1 time by &a05f
.ca06a
    jsr print_string
    equs &07, &0a, &0d, "FULL, HIT CR", &0a, &0d
    ldy #&7e ; '~'
; Referenced 1 time by &a085
.ca080
    jsr osrdch
    cmp #&0d
    bne ca080
    beq ca059
; Referenced 1 time by &a03f
.ca089
    jmp debug_cmd_M
; Referenced 1 time by &a135
.multiply_by_10
    lda l007b
    pha
    lda l007a
    pha
    jsr ca0a3
    jsr ca0a3
    clc
    pla
    adc l007a
    sta l007a
    pla
    adc l007b
    sta l007b
; Referenced 2 times by &a092, &a095
.ca0a3
    asl l007a
    rol l007b
    rts
; Referenced 8 times by &a2a5, &a9ab, &a7b2, &a574, &a855, &a478, &a7f9, &a455
.set_lineptr_to_page
    lda #&00
    sta LINEPTRL
    lda PAGEH
    sta LINEPTRH
    rts
; Referenced 16 times by &aac1, &a8a2, &aadb, &a7c4, &a921, &a3bc, &a10a, &a86c, &aad5, &a876, &a804, &a81a, &a93b, &a43c, &a11a, &ab55
.list_line
    lda #&05
    sta VARIABLE_AT
    lda #&00
    sta l0043
    sta l0034
    ldy #&01
    lda (LINEPTRL),y
    sta l0025
    cmp #&80
    bcs ca0da
    iny
    lda (LINEPTRL),y
    sta l0016
    jsr basic_print_decimal
    ldy #&02
; Referenced 1 time by &a0d8
.ca0d0
    iny
    lda (LINEPTRL),y
    jsr osasci
    cmp #&0d
    bne ca0d0
; Referenced 1 time by &a0c4
.ca0da
    rts
; Referenced 3 times by &a31b, &a64c, &a0e7
.compare_lineptr_with_top
    sec
    lda TOPL
    sbc LINEPTRL
    cmp #&03
    lda TOPH
    sbc LINEPTRH
    rts
; Referenced 12 times by &a182, &a344, &a945, &a66a, &a3cb, &a46d, &a115, &ab36, &a2b8, &a439, &a99a, &aaba
.inc_lineptr_by_y
    jsr compare_lineptr_with_top
    bcs ca0fc
    jsr print_string
    equs "**END**"
    nop
    jsr oscrlf
    sec
    rts
; Referenced 1 time by &a0ea
.ca0fc
    tya
    clc
    adc LINEPTRL
    sta LINEPTRL
    bcc ca106
    inc LINEPTRH
; Referenced 1 time by &a102
.ca106
    clc
    rts
; Referenced 3 times by &a849, &a835, &a7e6
.ca108
    stx l0078
    jsr list_line
    ldx l0078
    beq ca11f
; Referenced 1 time by &a11d
.ca111
    dec l0078
    beq ca11f
    jsr inc_lineptr_by_y
    bcs ca11f
    jsr list_line
    beq ca111
; Referenced 5 times by &a10f, &a113, &a12b, &a118, &a12f
.ca11f
    rts
; Referenced 6 times by &a8e1, &a3e8, &af12, &a812, &a956, &a8fe
.input_decimal_raw
    lda #&00
    sta l007a
    sta l007b
; Referenced 2 times by &a142, &a13e
.ca126
    lda l0100,y
    cmp #&30 ; '0'
    bcc ca11f
    cmp #&3a ; ':'
    bcs ca11f
    iny
    and #&0f
    pha
    jsr multiply_by_10
    pla
    clc
    adc l007a
    sta l007a
    bcc ca126
    inc l007b
    bcs ca126
; Referenced 1 time by &a1c0
.dec_lineptr_by_a
    sta l0074
    lda LINEPTRL
    cmp #&00
    bne ca162
    lda LINEPTRH
    cmp PAGEH
    bne ca162
    jsr print_string
    equs "*BEGIN*"
    nop
    jsr oscrlf
    sec
    rts
; Referenced 2 times by &a150, &a14a
.ca162
    sec
    lda LINEPTRL
    sbc l0074
    sta LINEPTRL
    bcs ca16d
    dec LINEPTRH
; Referenced 1 time by &a169
.ca16d
    clc
    rts
; Referenced 13 times by &a341, &a4a2, &a466, &a807, &a3c8, &a667, &a942, &ab33, &a3f4, &a2b5, &a436, &a997, &a17f
.get_line_length_in_y
    ldy #&03
; Referenced 1 time by &a178
.ca171
    lda (LINEPTRL),y
    cmp #&0d
    beq ca17a
    iny
    bpl ca171
; Referenced 1 time by &a175
.ca17a
    rts
; Referenced 8 times by &a869, &ab8c, &ab0d, &a1d1, &a7d6, &aa37, &ab5a, &a51d
.skip_forward_x_lines
    cpx #&00
    beq ca18a
; Referenced 1 time by &a188
.ca17f
    jsr get_line_length_in_y
    jsr inc_lineptr_by_y
    bcs ca18a
    dex
    bne ca17f
; Referenced 2 times by &a17d, &a185
.ca18a
    rts
; Referenced 1 time by &a1bd
.get_start_of_last_line
    ldy #&ff
    sec
    lda LINEPTRL
    sbc #&ff
    sta l0074
    lda LINEPTRH
    sbc #&00
    sta l0075
; Referenced 1 time by &a19f
.ca19a
    dey
    lda (l0074),y
    cmp #&0d
    bne ca19a
    dey
    dey
    lda (l0074),y
    cmp #&0d
    beq ca1b1
    iny
    lda (l0074),y
    cmp #&0d
    beq ca1b1
    iny
; Referenced 2 times by &a1ae, &a1a7
.ca1b1
    sty l0074
    lda #&ff
    sec
    sbc l0074
    rts
; Referenced 8 times by &a7e1, &ab45, &a7eb, &a82f, &a873, &a83a, &a8dc, &a91e
.skip_backwards_x_lines
    cpx #&00
    beq ca1c8
; Referenced 1 time by &a1c6
.ca1bd
    jsr get_start_of_last_line
    jsr dec_lineptr_by_a
    bcs ca1c8
    dex
    bne ca1bd
; Referenced 2 times by &a1bb, &a1c3
.ca1c8
    rts
; Referenced 3 times by &ab4a, &a2e3, &a89f
.ca1c9
    lda LINEPTRL
    sta l0076
    lda LINEPTRH
    sta l0077
    jsr skip_forward_x_lines
    sec
    lda LINEPTRL
    sbc l0076
    sta l0074
    lda LINEPTRH
    sbc l0077
    sta l0075
    lda l0076
    sta LINEPTRL
    lda l0077
    sta LINEPTRH
    jmp ca1ec
; Referenced 3 times by &a1e9, &a3a3, &a539
.ca1ec
    sec
    lda TOPL
    sbc l0074
    sta TOPL
    lda TOPH
    sbc l0075
    sta TOPH
    clc
    lda l0076
    adc l0074
    sta l0074
    lda l0077
    adc l0075
    sta l0075
    ldy #&00
; Referenced 1 time by &a22a
.ca208
    sec
    lda TOPL
    sbc l0076
    tax
    lda TOPH
    sbc l0077
    beq ca218
    ldx #&00
    beq ca21c
; Referenced 1 time by &a212
.ca218
    cpx #&00
    beq ca22c
; Referenced 2 times by &a222, &a216
.ca21c
    lda (l0074),y
    sta (l0076),y
    iny
    dex
    bne ca21c
    inc l0075
    inc l0077
    cpy #&00
    beq ca208
; Referenced 1 time by &a21a
.ca22c
    lda #&00
    sta MARKER1L
    sta MARKER2L
    lda PAGEH
    sta MARKER1H
    sta MARKER2H
    rts
; Referenced 2 times by &a3c1, &a34c
.match_pattern
    ldx #&ff
; Referenced 1 time by &a252
.ca23b
    inx
    lda l0102,x
    cmp l0101
    bne ca246
    sec
    rts
; Referenced 3 times by &a242, &a25b, &a255
.ca246
    iny
    lda (LINEPTRL),y
    cmp #&0d
    bne ca24f
    clc
    rts
; Referenced 1 time by &a24b
.ca24f
    cmp l0102,x
    beq ca23b
    txa
    beq ca246
; Referenced 1 time by &a259
.ca257
    dey
    dex
    bne ca257
    beq ca246
; Referenced 4 times by &a380, &a5a9, &a4c2, &a2fe
.ca25d
    clc
    lda TOPL
    sta l0076
    adc l0074
    sta TOPL
    sta l0074
    lda TOPH
    sta l0077
    adc l0075
    sta TOPH
    sta l0075
    ldy #&ff
; Referenced 1 time by &a296
.ca274
    sec
    lda l0076
    sbc l0070
    tax
    lda l0077
    sbc l0071
    beq ca284
    ldx #&00
    beq ca288
; Referenced 1 time by &a27e
.ca284
    cpx #&00
    beq ca298
; Referenced 1 time by &a282
.ca288
    dec l0075
    dec l0077
; Referenced 1 time by &a292
.ca28c
    lda (l0076),y
    sta (l0074),y
    dey
    dex
    bne ca28c
    cpy #&ff
    beq ca274
; Referenced 1 time by &a286
.ca298
    lda #&00
    sta MARKER1L
    sta MARKER2L
    lda PAGEH
    sta MARKER1H
    sta MARKER2H
    rts
; Referenced 2 times by &a2dc, &a815
.ca2a5
    jsr set_lineptr_to_page
; Referenced 1 time by &a2bb
.ca2a8
    ldy #&02
    lda (LINEPTRL),y
    cmp l007a
    dey
    lda (LINEPTRL),y
    sbc l007b
    bcs ca2bf
    jsr get_line_length_in_y
    jsr inc_lineptr_by_y
    bcc ca2a8
    bcs ca2ca
; Referenced 1 time by &a2b3
.ca2bf
    bne ca2ca
    iny
    lda (LINEPTRL),y
    cmp l007a
    bne ca2ca
    sec
    rts
; Referenced 3 times by &a2bd, &a2c6, &a2bf
.ca2ca
    clc
    rts
; Referenced 2 times by &a430, &a959
.ca2cc
    sty l0079
    dey
    ldx #&00
; Referenced 1 time by &a2d8
.ca2d1
    iny
    lda l0100,y
    inx
    cmp #&0d
    bne ca2d1
    stx l0078
    jsr ca2a5
    bcc ca2e6
    ldx #&01
    jsr ca1c9
; Referenced 1 time by &a2df
.ca2e6
    lda l0078
    cmp #&01
    bne ca2ed
    rts
; Referenced 1 time by &a2ea
.ca2ed
    clc
    adc #&02
    sta l0074
    lda #&00
    sta l0075
    lda LINEPTRL
    sta l0070
    lda LINEPTRH
    sta l0071
    jsr ca25d
    ldy #&01
    lda l007b
    sta (LINEPTRL),y
    iny
    lda l007a
    sta (LINEPTRL),y
    ldx l0079
    iny
; Referenced 1 time by &a318
.ca30f
    lda l0100,x
    inx
    sta (LINEPTRL),y
    iny
    cmp #&0d
    bne ca30f
    rts
; Referenced 3 times by &a919, &a616, &a347
.ca31b
    jsr compare_lineptr_with_top
    bcc ca349
    ldy #&02
    lda l007a
    cmp (LINEPTRL),y
    dey
    lda l007b
    sbc (LINEPTRL),y
    bcc ca349
    lda l007b
    sta (LINEPTRL),y
    iny
    lda l007a
    sta (LINEPTRL),y
    clc
    lda l007a
    adc l0009
    sta l007a
    bcc ca341
    inc l007b
; Referenced 1 time by &a33d
.ca341
    jsr get_line_length_in_y
    jsr inc_lineptr_by_y
    bcc ca31b
; Referenced 3 times by &a32b, &a31e, &a34f
.ca349
    rts
; Referenced 2 times by &a972, &a992
.ca34a
    ldy l0079
    jsr match_pattern
    bcc ca349
    stx l0078
    sty l0079
    ldy #&ff
; Referenced 1 time by &a35f
.ca357
    inx
    iny
    lda l0102,x
    cmp l0101
    bne ca357
    tya
    cmp l0078
    beq ca3a6
    bcc ca386
    sbc l0078
    sta l0074
    lda #&00
    sta l0075
    lda l0079
    sec
    sbc l0078
    clc
    adc LINEPTRL
    sta l0070
    lda LINEPTRH
    adc #&00
    sta l0071
    jsr ca25d
    jmp ca3a6
; Referenced 1 time by &a366
.ca386
    sta l0074
    lda l0078
    sec
    sbc l0074
    sta l0074
    lda #&00
    sta l0075
    lda l0079
    sec
    sbc l0078
    sec
    adc LINEPTRL
    sta l0076
    lda LINEPTRH
    adc #&00
    sta l0077
    jsr ca1ec
; Referenced 2 times by &a383, &a364
.ca3a6
    lda l0079
    sec
    sbc l0078
    tay
    ldx l0078
; Referenced 1 time by &a3ba
.ca3ae
    iny
    inx
    lda l0102,x
    cmp l0101
    beq ca3bc
    sta (LINEPTRL),y
    bne ca3ae
; Referenced 1 time by &a3b6
.ca3bc
    jmp list_line
; Referenced 3 times by &a989, &a3ce, &a936
.ca3bf
    ldy #&02
    jsr match_pattern
    bcc ca3c8
    clc
    rts
; Referenced 1 time by &a3c4
.ca3c8
    jsr get_line_length_in_y
    jsr inc_lineptr_by_y
    bcc ca3bf
    rts
; Referenced 13 times by &a89b, &a984, &a865, &a969, &aa0b, &ab4d, &aaee, &aeed, &a931, &aeb5, &a829, &a86f, &a845
.input_decimal
    ldy #&00
; Referenced 1 time by &a3d9
.ca3d3
    iny
    lda l0100,y
    cmp #&0d
    bne ca3d3
; Referenced 1 time by &a3e5
.ca3db
    dey
    lda l0100,y
    cmp #&30 ; '0'
    bcc ca3e7
    cmp #&3a ; ':'
    bcc ca3db
; Referenced 1 time by &a3e1
.ca3e7
    iny
    jsr input_decimal_raw
    lda #&00
    cmp l007a
    adc l007a
    sta l007a
    rts
; Referenced 2 times by &a433, &aa1b
.ca3f4
    jsr get_line_length_in_y
    iny
    iny
    clc
    lda l007a
    adc l0009
    sta l007a
    bcc ca404
    inc l007b
; Referenced 1 time by &a400
.ca404
    clc
    lda (LINEPTRL),y
    sbc l007a
    dey
    lda (LINEPTRL),y
    sbc l007b
    bcc ca436
    lda #&05
    sta VARIABLE_AT
    lda #&00
    sta l0043
    sta l0034
    lda l007a
    sta l0016
    lda l007b
    sta l0025
    jsr basic_print_decimal
    jsr ca041
    cmp #&0d
    bne ca42e
    rts
; Referenced 1 time by &a42b
.ca42e
    ldy #&00
    jsr ca2cc
    jmp ca3f4
; Referenced 1 time by &a40e
.ca436
    jsr get_line_length_in_y
    jsr inc_lineptr_by_y
    jmp list_line
; Referenced 17 times by &ac60, &aa00, &a9e2, &af63, &ac64, &aa05, &a9e7, &adaa, &afcc, &ae83, &a9f6, &a9d8, &ac3b, &afdc, &afb3, &ae7e, &abf3
.print_hex
    pha
    lsr a
    lsr a
    lsr a
    lsr a
    jsr ca448
    pla
; Referenced 1 time by &a444
.ca448
    and #&0f
    cmp #&0a
    bcc ca450
    adc #&06
; Referenced 1 time by &a44c
.ca450
    adc #&30 ; '0'
    jmp osasci
; Referenced 3 times by &a721, &a85b, &a9b6
.set_top_to_end_of_program
    jsr set_lineptr_to_page
    lda #&ff
    sta TOPL
    sta TOPH
; Referenced 1 time by &a472
.ca45e
    ldy #&01
    lda (LINEPTRL),y
    cmp #&80
    bcs ca474
    jsr get_line_length_in_y
    cpy #&80
    bcs ca488
    jsr inc_lineptr_by_y
    bcs ca488
    bcc ca45e
; Referenced 2 times by &a464, &a49f
.ca474
    sec
    jsr set_top_to_lineptr
    jmp set_lineptr_to_page
; Referenced 2 times by &a884, &a475
.set_top_to_lineptr
    lda LINEPTRL
    adc #&01
    sta TOPL
    lda LINEPTRH
    adc #&00
    sta TOPH
    rts
; Referenced 2 times by &a470, &a46b
.ca488
    jsr print_string
    equs "END NOT FOUND"
    nop
    jsr oscrlf
    jsr end_marker_at_lineptr
    jmp ca474
; Referenced 1 time by &aabe
.ca4a2
    jsr get_line_length_in_y
    dey
    tya
    pha
    clc
    adc LINEPTRL
    sta l0070
    lda #&00
    adc LINEPTRH
    sta l0071
    ldy #&00
    sty l0075
    lda #&0d
; Referenced 1 time by &a4bd
.ca4b9
    iny
    cmp l0100,y
    bne ca4b9
    dey
    sty l0074
    jsr ca25d
    pla
    tay
    ldx #&00
; Referenced 1 time by &a4d2
.ca4c9
    iny
    inx
    lda l0100,x
    sta (LINEPTRL),y
    cmp #&0d
    bne ca4c9
    rts
; Referenced 1 time by &aad2
.set_marker_1
    lda LINEPTRL
    sta MARKER1L
    lda LINEPTRH
    sta MARKER1H
    lda MARKER2L
    cmp MARKER1L
    lda MARKER2H
    sbc MARKER1H
    bcs ca4ef
    lda MARKER1L
    sta MARKER2L
    lda MARKER1H
    sta MARKER2H
; Referenced 1 time by &a4e5
.ca4ef
    rts
; Referenced 1 time by &aad8
.set_marker_2
    lda LINEPTRL
    sta MARKER2L
    lda LINEPTRH
    sta MARKER2H
    lda MARKER2L
    cmp MARKER1L
    lda MARKER2H
    sbc MARKER1H
    bcs ca50a
    lda MARKER2L
    sta MARKER1L
    lda MARKER2H
    sta MARKER1H
; Referenced 1 time by &a500
.ca50a
    rts
; Referenced 1 time by &a88e
.ca50b
    lda MARKER1L
    sta l0076
    lda MARKER1H
    sta l0077
    lda MARKER2L
    sta LINEPTRL
    lda MARKER2H
    sta LINEPTRH
    ldx #&01
    jsr skip_forward_x_lines
    sec
    lda LINEPTRL
    sbc l0076
    sta l0074
    lda LINEPTRH
    sbc l0077
    sta l0075
    lda l0076
    sta LINEPTRL
    sta MARKER2L
    lda l0077
    sta LINEPTRH
    sta MARKER2H
    jmp ca1ec
; Referenced 1 time by &aae8
.swap_text_spaces
    lda PAGEH
    pha
    lda TOPL
    pha
    lda TOPH
    pha
    lda ALTTOPX
    sta TOPL
    sta LINEPTRL
    lda ALTTOLH
    sta TOPH
    sta LINEPTRH
    lda ALTPAGEH
    sta PAGEH
    pla
    sta ALTTOLH
    pla
    sta ALTTOPX
    pla
    sta ALTPAGEH
    sec
    lda LINEPTRL
    sbc #&02
    sta LINEPTRL
    bcs ca569
    dec LINEPTRH
; Referenced 1 time by &a565
.ca569
    ldy #&00
    lda #&0d
    sta (LINEPTRL),y
    iny
    lda #&ff
    sta (LINEPTRL),y
    jsr set_lineptr_to_page
    dey
    lda #&0d
    sta (LINEPTRL),y
    rts
; Referenced 2 times by &ab10, &ab08
.insert_buffer
    lda LINEPTRL
    sta l0070
    lda LINEPTRH
    sta l0071
    sec
    lda ALTTOPX
    sbc #&02
    sta l0074
    lda ALTTOLH
    sbc ALTPAGEH
    sta l0075
    ora l0074
    bne ca5a9
    jsr print_string
    equs "BUFFER EMPTY"
    nop
    jmp oscrlf
; Referenced 1 time by &a594
.ca5a9
    jsr ca25d
    lda l0070
    sta LINEPTRL
    lda l0071
    sta LINEPTRH
    lda #&00
    sta l0070
    lda ALTPAGEH
    sta l0071
; Referenced 1 time by &a5fb
.ca5bc
    ldy #&01
    lda (l0070),y
    cmp #&80
    bcs ca5fe
    dey
    lda #&0d
    sta (LINEPTRL),y
    iny
    clc
    lda l007a
    adc l0009
    sta l007a
    lda l007b
    adc #&00
    sta l007b
    sta (LINEPTRL),y
    iny
    lda l007a
    sta (LINEPTRL),y
; Referenced 1 time by &a5e5
.ca5de
    iny
    lda (l0070),y
    sta (LINEPTRL),y
    cmp #&0d
    bne ca5de
    clc
    tya
    adc LINEPTRL
    sta LINEPTRL
    bcc ca5f1
    inc LINEPTRH
; Referenced 1 time by &a5ed
.ca5f1
    clc
    tya
    adc l0070
    sta l0070
    bcc ca5fb
    inc l0071
; Referenced 1 time by &a5f7
.ca5fb
    jmp ca5bc
; Referenced 1 time by &a5c2
.ca5fe
    iny
    lda (LINEPTRL),y
    cmp l007a
    dey
    lda (LINEPTRL),y
    sbc l007b
    bcc ca60b
    rts
; Referenced 1 time by &a608
.ca60b
    clc
    lda l007a
    adc l0009
    sta l007a
    bcc ca616
    inc l007b
; Referenced 1 time by &a612
.ca616
    jmp ca31b
; Referenced 2 times by &ab52, &ab25
.append_line_from_text_to_buffer
    sec
    lda ALTTOPX
    sbc #&02
    sta ALTTOPX
    bcs ca624
    dec ALTTOLH
; Referenced 1 time by &a620
.ca624
    ldy #&01
    lda (LINEPTRL),y
    sta (ALTTOPX),y
    cmp #&ff
    beq ca641
    iny
    lda (LINEPTRL),y
    sta (ALTTOPX),y
; Referenced 1 time by &a63a
.ca633
    iny
    lda (LINEPTRL),y
    sta (ALTTOPX),y
    cmp #&0d
    bne ca633
    lda #&ff
    iny
    sta (ALTTOPX),y
; Referenced 1 time by &a62c
.ca641
    tya
    sec
    adc ALTTOPX
    sta ALTTOPX
    bcc ca64b
    inc ALTTOLH
; Referenced 1 time by &a647
.ca64b
    rts
; Referenced 2 times by &a913, &a66d
.renumber_lines
    jsr compare_lineptr_with_top
    bcc ca66f
    ldy #&01
    lda l007b
    sta (LINEPTRL),y
    iny
    lda l007a
    sta (LINEPTRL),y
    clc
    lda l007a
    adc l0009
    sta l007a
    bcc ca667
    inc l007b
; Referenced 1 time by &a663
.ca667
    jsr get_line_length_in_y
    jsr inc_lineptr_by_y
    bcc renumber_lines
; Referenced 1 time by &a64f
.ca66f
    rts
; Referenced 1 time by &a68e
.ca670
    cmp #&30 ; '0'
    bcc ca683
    cmp #&3a ; ':'
    bcc ca680
    sbc #&07
    bcc ca683
    cmp #&40 ; '@'
    bcs ca684
; Referenced 1 time by &a676
.ca680
    and #&0f
    rts
; Referenced 2 times by &a672, &a67a
.ca683
    sec
; Referenced 1 time by &a67e
.ca684
    rts
; Referenced 6 times by &aea0, &a783, &a8b0, &ae92, &af75, &aeda
.input_hex
    lda #&00
    sta l0000,x
    sta l0001,x
; Referenced 1 time by &a6a6
.ca68b
    lda l0100,y
    jsr ca670
    bcs ca6a8
    asl a
    asl a
    asl a
    asl a
    sty l0079
    ldy #&04
; Referenced 1 time by &a6a1
.ca69b
    asl a
    rol l0000,x
    rol l0001,x
    dey
    bne ca69b
    ldy l0079
    iny
    bne ca68b
; Referenced 1 time by &a691
.ca6a8
    lda l0000,x
    rts
; Referenced 3 times by &a97a, &a95f, &a927
.count_delimiters
    ldx #&00
    ldy #&ff
; Referenced 1 time by &a6bb
.ca6af
    iny
    lda l0100,y
    cmp l0101
    bne ca6b9
    inx
; Referenced 1 time by &a6b6
.ca6b9
    cmp #&0d
    bne ca6af
    rts
; Referenced 3 times by &a880, &a858, &a49c
.end_marker_at_lineptr
    ldy #&01
    lda #&ff
    sta (LINEPTRL),y
    dey
    lda #&0d
    sta (LINEPTRL),y
    rts
.la6ca
    equs "QBLNDTRF SCO@A*><+MXIEZ-"
    equb &0d                                                ; a6e2: .
.la6e3
    equb <(edit_cmd_Q)                                      ; a6e3: .
    equb <(edit_cmd_B)                                      ; a6e4: .
    equb <(edit_cmd_L)                                      ; a6e5: .
    equb <(edit_cmd_N)                                      ; a6e6: .
    equb <(edit_cmd_D)                                      ; a6e7: .
    equb <(edit_cmd_T)                                      ; a6e8: .
    equb <(edit_cmd_R)                                      ; a6e9: .
    equb <(edit_cmd_F)                                      ; a6ea: .
    equb <(edit_cmd_SPACE)                                  ; a6eb: .
    equb <(edit_cmd_S)                                      ; a6ec: .
    equb <(edit_cmd_C)                                      ; a6ed: .
    equb <(edit_cmd_O)                                      ; a6ee: .
    equb <(edit_cmd_AT)                                     ; a6ef: .
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
    equb >(edit_cmd_B)                                      ; a6fc: .
    equb >(edit_cmd_L)                                      ; a6fd: .
    equb >(edit_cmd_N)                                      ; a6fe: .
    equb >(edit_cmd_D)                                      ; a6ff: .
    equb >(edit_cmd_T)                                      ; a700: .
    equb >(edit_cmd_R)                                      ; a701: .
    equb >(edit_cmd_F)                                      ; a702: .
    equb >(edit_cmd_SPACE)                                  ; a703: .
    equb >(edit_cmd_S)                                      ; a704: .
    equb >(edit_cmd_C)                                      ; a705: .
    equb >(edit_cmd_O)                                      ; a706: .
    equb >(edit_cmd_AT)                                     ; a707: .
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
.edit_cmd
    lda #&5e ; '^'
    sta l0008
    lda #&82
    sta ALTPAGEH
    sta ALTTOLH
    lda #&02
    sta ALTTOPX
; Referenced 1 time by &aaa3
.ca721
    jsr set_top_to_end_of_program
    lda LINEPTRH
    sta MARKER1H
    sta MARKER2H
    lda LINEPTRL
    sta MARKER1L
    sta MARKER2L
    jsr caa53
    jsr edit_print_space_info
.edit_cmd_loop
    lda #>(edit_cmd_loop-1)
    pha
    lda #<(edit_cmd_loop-1) ; '5'
    pha
    ldy #&00
; Referenced 1 time by &a744
.ca73e
    iny
    lda l0100,y
    cmp #&0d
    bne ca73e
    lda l0101,y
    cmp #&ff
    bne ca753
    jsr caa21
    jmp ca761
; Referenced 1 time by &a74b
.ca753
    ldx #&00
; Referenced 1 time by &a75f
.ca755
    iny
    lda l0100,y
    sta l0100,x
    inx
    cmp #&ff
    bne ca755
; Referenced 3 times by &a750, &ab72, &ab8f
.ca761
    lda l0100
    cmp #&30 ; '0'
    bcc ca76f
    cmp #&3a ; ':'
    bcs ca76f
    jmp edit_cmd_SPACE
; Referenced 2 times by &a76a, &a766
.ca76f
    ldx #&17
; Referenced 1 time by &a777
.ca771
    cmp la6ca,x
    beq ca78b
    dex
    bpl ca771
; Referenced 9 times by &a981, &a8c4, &aae5, &a966, &a92e, &a7af, &a910, &aacf, &ab7c
.error_what
    jsr cae52
    jmp caa53
; Referenced 1 time by &afee
.ca77f
    ldy #&00
    ldx #&74 ; 't'
    jsr input_hex
    ldy #&00
    sta (LINEPTRL),y
    rts
; Referenced 1 time by &a774
.ca78b
    lda la6e3,x
    sta l0074
    lda la6fb,x
    sta l0075
    jmp (l0074)
.edit_cmd_Q
    lda l0101
    cmp #&0d
    beq debug_cmd_Q
    jsr edit_cmd_GT
; Referenced 1 time by &a79d
.debug_cmd_Q
    ldx #&ff
    txs
    jmp basic_end
.edit_cmd_B
    lda l0101
    cmp #&0d
    beq ca7b2
    jmp error_what
; Referenced 1 time by &a7ad
.ca7b2
    jmp set_lineptr_to_page
; Referenced 2 times by &ab1a, &a88b
.edit_cmd_L
    lda l0101
    cmp #&4d ; 'M'
    bne ca7db
    lda MARKER1L
    sta LINEPTRL
    lda MARKER1H
    sta LINEPTRH
; Referenced 1 time by &a7d9
.ca7c4
    jsr list_line
    lda MARKER2H
    cmp LINEPTRH
    bne ca7d4
    lda MARKER2L
    cmp LINEPTRL
    bne ca7d4
    rts
; Referenced 2 times by &a7d1, &a7cb
.ca7d4
    ldx #&01
    jsr skip_forward_x_lines
    beq ca7c4
; Referenced 1 time by &a7ba
.ca7db
    cmp #&41 ; 'A'
    bne ca7ee
    ldx #&04
    jsr skip_backwards_x_lines
    ldx #&0a
    jsr ca108
    ldx #&05
    jmp skip_backwards_x_lines
; Referenced 1 time by &a7dd
.ca7ee
    cmp #&2e ; '.'
    bne ca81d
    lda l0102
    cmp #&0d
    bne ca810
    jsr set_lineptr_to_page
; Referenced 1 time by &a80d
.ca7fc
    ldy #&01
    lda (LINEPTRL),y
    cmp #&80
    bcs ca80f
    jsr list_line
    jsr get_line_length_in_y
    jsr check_escape_and_inc_lineptr_by_y
    bcc ca7fc
; Referenced 2 times by &a818, &a802
.ca80f
    rts
; Referenced 1 time by &a7f7
.ca810
    ldy #&02
    jsr input_decimal_raw
    jsr ca2a5
    bcc ca80f
    jmp list_line
; Referenced 1 time by &a7f0
.ca81d
    cmp #&2d ; '-'
    beq ca829
    cmp #&42 ; 'B'
    bne ca83d
    ldx #&09
    bne ca82d
; Referenced 1 time by &a81f
.ca829
    jsr input_decimal
    tax
; Referenced 1 time by &a827
.ca82d
    stx l0009
    jsr skip_backwards_x_lines
    ldx l0009
    inx
    jsr ca108
    ldx l0009
    jmp skip_backwards_x_lines
; Referenced 1 time by &a823
.ca83d
    cmp #&46 ; 'F'
    bne ca845
    ldx #&0a
    bne ca849
; Referenced 1 time by &a83f
.ca845
    jsr input_decimal
    tax
; Referenced 1 time by &a843
.ca849
    jmp ca108
.edit_cmd_N
    ldy #&01
    lda l0100,y
    cmp #&45 ; 'E'
    bne ca861
    jsr set_lineptr_to_page
    jsr end_marker_at_lineptr
    jsr set_top_to_end_of_program
    jmp edit_print_space_info
; Referenced 1 time by &a853
.ca861
    cmp #&2d ; '-'
    beq ca86f
    jsr input_decimal
    tax
    jsr skip_forward_x_lines
    jmp list_line
; Referenced 1 time by &a863
.ca86f
    jsr input_decimal
    tax
    jsr skip_backwards_x_lines
    jmp list_line
.edit_cmd_D
    lda l0101
    cmp #&2e ; '.'
    bne ca887
    jsr end_marker_at_lineptr
    sec
    jmp set_top_to_lineptr
; Referenced 1 time by &a87e
.ca887
    cmp #&4d ; 'M'
    bne ca891
    jsr edit_cmd_L
    jmp ca50b
; Referenced 1 time by &a889
.ca891
    cmp #&3d ; '='
    bne ca89b
    lda l0102
    sta l0008
    rts
; Referenced 1 time by &a893
.ca89b
    jsr input_decimal
    tax
    jsr ca1c9
    jmp list_line
.edit_cmd_T
    lda l0101
    cmp #&3d ; '='
    bne ca8c0
    ldy #&02
    ldx #&0a
    jsr input_hex
    lda ALTTOPX
    sta ALTTOLH
    sta ALTPAGEH
    lda #&02
    sta ALTTOPX
    jmp edit_print_space_info
; Referenced 1 time by &a8aa
.ca8c0
    cmp #&0d
    beq ca8c7
    jmp error_what
; Referenced 1 time by &a8c2
.ca8c7
    lda TOPL
    sta LINEPTRL
    lda TOPH
    sta LINEPTRH
    sec
    lda LINEPTRL
    sbc #&02
    sta LINEPTRL
    bcs ca8da
    dec LINEPTRH
; Referenced 1 time by &a8d6
.ca8da
    ldx #&01
    jmp skip_backwards_x_lines
.edit_cmd_R
    ldy #&01
    jsr input_decimal_raw
    lda l007a
    sta l0009
    lda l0100,y
    cmp #&2c ; ','
    beq ca8fd
    ldy #&02
    lda (LINEPTRL),y
    sta l007a
    dey
    lda (LINEPTRL),y
    sta l007b
    jmp ca919
; Referenced 1 time by &a8ed
.ca8fd
    iny
    jsr input_decimal_raw
    lda l0100,y
    cmp #&2c ; ','
    bne ca919
    iny
    lda l0100,y
    cmp #&46 ; 'F'
    beq ca913
    jmp error_what
; Referenced 1 time by &a90e
.ca913
    jsr renumber_lines
    clc
    bcc ca91c
; Referenced 2 times by &a8fa, &a906
.ca919
    jsr ca31b
; Referenced 1 time by &a917
.ca91c
    ldx #&01
    jsr skip_backwards_x_lines
    jsr list_line
    jmp caa53
.edit_cmd_F
    jsr count_delimiters
    cpx #&02
    beq ca931
    jmp error_what
; Referenced 1 time by &a92c
.ca931
    jsr input_decimal
    sta l0009
; Referenced 1 time by &a948
.ca936
    jsr ca3bf
    bcs ca94a
    jsr list_line
    dec l0009
    beq ca94a
    jsr get_line_length_in_y
    jsr inc_lineptr_by_y
    bcc ca936
; Referenced 2 times by &a940, &a939
.ca94a
    rts
; Referenced 1 time by &a76c
.edit_cmd_SPACE
    ldy #&00
; Referenced 1 time by &a953
.ca94d
    lda l0100,y
    iny
    cmp #&20 ; ' '
    beq ca94d
    dey
    jsr input_decimal_raw
    jsr ca2cc
    jmp caa53
.edit_cmd_S
    jsr count_delimiters
    cpx #&03
    beq ca969
    jmp error_what
; Referenced 1 time by &a964
.ca969
    jsr input_decimal
    sta l0009
    ldy #&02
    sty l0079
; Referenced 1 time by &a977
.ca972
    jsr ca34a
    dec l0009
    bne ca972
    rts
.edit_cmd_C
    jsr count_delimiters
    cpx #&03
    beq ca984
    jmp error_what
; Referenced 1 time by &a97f
.ca984
    jsr input_decimal
    sta l0009
; Referenced 1 time by &a99f
.ca989
    jsr ca3bf
    bcs ca9a1
    ldy #&02
    sty l0079
; Referenced 1 time by &a995
.ca992
    jsr ca34a
    bcs ca992
    jsr get_line_length_in_y
    jsr inc_lineptr_by_y
    dec l0009
    bne ca989
; Referenced 1 time by &a98c
.ca9a1
    rts
.edit_cmd_O
    ldx #&03
    lda l0101
    cmp #&4c ; 'L'
    bne ca9bc
    jsr set_lineptr_to_page
    lda #&00
    ldy #&01
    lda #&00
    sta (LINEPTRL),y
    jsr set_top_to_end_of_program
    jmp edit_print_space_info
; Referenced 1 time by &a9a9
.ca9bc
    cmp #&4e ; 'N'
    bne ca9c1
    dex
; Referenced 1 time by &a9be
.ca9c1
    txa
    jmp osasci
; Referenced 5 times by &a9b9, &aaeb, &a8bd, &a85e, &a733
.edit_print_space_info
    jsr print_string
    equs "PSION EDIT   "
    nop
    lda PAGEH
    jsr print_hex
    lda #&2d ; '-'
    jsr osasci
    lda TOPH
    jsr print_hex
    lda TOPL
    jsr print_hex
    lda #&20 ; ' '
    ldx #&03
; Referenced 1 time by &a9f2
.ca9ee
    jsr osasci
    dex
    bne ca9ee
    lda ALTPAGEH
    jsr print_hex
    lda #&2d ; '-'
    jsr osasci
    lda ALTTOLH
    jsr print_hex
    lda ALTTOPX
    jsr print_hex
    jmp oscrlf
.edit_cmd_A
    jsr input_decimal
    sta l0009
    ldy #&02
    lda (LINEPTRL),y
    sta l007a
    dey
    lda (LINEPTRL),y
    sta l007b
    jsr ca3f4
    jmp caa53
; Referenced 1 time by &a74d
.caa21
    lda #&3f ; '?'
    jsr osasci
    lda l0100
    pha
    jsr ca041
    pla
    cpy #&00
    bne caa3a
    sta l0100
    ldx #&01
    jmp skip_forward_x_lines
; Referenced 1 time by &aa30
.caa3a
    iny
    lda #&ff
    sta l0100,y
; Referenced 1 time by &aa4d
.caa40
    lda l0100,y
    cmp l0008
    bne caa4c
    lda #&0d
    sta l0100,y
; Referenced 1 time by &aa45
.caa4c
    dey
    bne caa40
    lda l0100
    rts
; Referenced 5 times by &a730, &a95c, &a77c, &aa1e, &a924
.caa53
    lda #&42 ; 'B'
    sta l0100
    lda #&0d
    sta l0101
    lda #&ff
    sta l0102
    rts
.edit_cmd_STAR
    lda #&20 ; ' '
    sta l0100
    jmp oscli
; Referenced 1 time by &a79f
.edit_cmd_GT
    jsr caaa6
    lda #&00
    sta l0054
    sta l0058
    lda PAGEH
    sta l0055
    sta l0059
    lda #&b2
    sta l0056
    lda #&c2
    sta l0057
    lda TOPL
    sta l005a
    lda TOPH
    sta l005b
    sec
    jmp ossave
.edit_cmd_LT
    jsr caaa6
    lda #&00
    sta l0054
    lda PAGEH
    sta l0055
    lda #&80
    sta l0056
    sec
    jsr osload
    pla
    pla
    jmp ca721
; Referenced 2 times by &aa6b, &aa8e
.caaa6
    lda #&01
    sta l0052
    lda #&01
    sta l0053
    ldx #&52 ; 'R'
    rts
; Referenced 1 time by &a80a
.check_escape_and_inc_lineptr_by_y
    lda PIA+1
    and #&20 ; ' '
    bne caaba
    sec
    rts
; Referenced 1 time by &aab6
.caaba
    jsr inc_lineptr_by_y
    rts
.edit_cmd_PLUS
    jsr ca4a2
    jmp list_line
.edit_cmd_M
    lda l0101
    cmp #&32 ; '2'
    beq caad8
    cmp #&31 ; '1'
    beq caad2
    jmp error_what
; Referenced 1 time by &aacd
.caad2
    jsr set_marker_1
    jmp list_line
; Referenced 1 time by &aac9
.caad8
    jsr set_marker_2
    jmp list_line
.edit_cmd_X
    lda l0101
    cmp #&0d
    beq caae8
    jmp error_what
; Referenced 1 time by &aae3
.caae8
    jsr swap_text_spaces
    jmp edit_print_space_info
.edit_cmd_I
    jsr input_decimal
    sta l0009
    ldy #&02
    lda (LINEPTRL),y
    sta l007a
    dey
    lda (LINEPTRL),y
    sta l007b
    cmp #&80
    bcs cab0b
    lda #&00
    sta l007a
    sta l007b
    jmp insert_buffer
; Referenced 1 time by &ab00
.cab0b
    ldx #&01
    jsr skip_forward_x_lines
    jmp insert_buffer
.edit_cmd_E
    lda l0101
    cmp #&4d ; 'M'
    bne cab3c
    jsr edit_cmd_L
    lda MARKER1L
    sta LINEPTRL
    lda MARKER1H
    sta LINEPTRH
; Referenced 1 time by &ab39
.cab25
    jsr append_line_from_text_to_buffer
    clc
    lda MARKER2L
    sbc LINEPTRL
    lda MARKER2H
    sbc LINEPTRH
    bcc cab3b
    jsr get_line_length_in_y
    jsr inc_lineptr_by_y
    bcc cab25
; Referenced 1 time by &ab31
.cab3b
    rts
; Referenced 1 time by &ab18
.cab3c
    cmp #&44 ; 'D'
    bne cab4d
    jsr cab4d
    ldx l007a
    jsr skip_backwards_x_lines
    ldx l007a
    jmp ca1c9
; Referenced 2 times by &ab40, &ab3e
.cab4d
    jsr input_decimal
    sta l0009
; Referenced 1 time by &ab5f
.cab52
    jsr append_line_from_text_to_buffer
    jsr list_line
    ldx #&01
    jsr skip_forward_x_lines
    dec l0009
    bne cab52
    rts
.edit_cmd_Z
    ldy #&ff
; Referenced 1 time by &ab70
.cab64
    iny
    lda l0101,y
    sta l0100,y
    sta l0150,y
    cmp #&ff
    bne cab64
    jmp ca761
.edit_cmd_MINUS
    lda l0101
    cmp #&0d
    beq cab7f
    jmp error_what
; Referenced 1 time by &ab7a
.cab7f
    ldy #&2f ; '/'
; Referenced 1 time by &ab88
.cab81
    lda l0150,y
    sta l0100,y
    dey
    bpl cab81
    ldx #&01
    jsr skip_forward_x_lines
    jmp ca761
; Referenced 3 times by &aef0, &aedf, &aecf
.cab92
    sta l0009
; Referenced 1 time by &aba3
.cab94
    jsr caba6
    jsr oscrlf
    jsr cac79
    sta REGPCL
    sty REGPCH
    dec l0009
    bne cab94
    rts
; Referenced 1 time by &ab94
.caba6
    jsr cac67
    lda (REGPCL,x)
    tay
    lsr a
    bcc cabba
    lsr a
    bcs cabc9
    cmp #&22 ; '"'
    beq cabc9
    and #&07
    ora #&80
; Referenced 1 time by &abad
.cabba
    lsr a
    tax
    lda lac8d,x
    bcs cabc5
    lsr a
    lsr a
    lsr a
    lsr a
; Referenced 1 time by &abbf
.cabc5
    and #&0f
    bne cabcd
; Referenced 2 times by &abb0, &abb4
.cabc9
    ldy #&80
    lda #&00
; Referenced 1 time by &abc7
.cabcd
    tax
    lda lacd1,x
    sta l0078
    and #&03
    sta l0074
    tya
    and #&8f
    tax
    tya
    ldy #&03
    cpx #&8a
    beq cabed
; Referenced 1 time by &abee
.cabe2
    lsr a
    bcc cabed
    lsr a
; Referenced 1 time by &abea
.cabe6
    lsr a
    ora #&20 ; ' '
    dey
    bne cabe6
    iny
; Referenced 2 times by &abe0, &abe3
.cabed
    dey
    bne cabe2
    pha
; Referenced 1 time by &abfe
.cabf1
    lda (REGPCL),y
    jsr print_hex
    ldx #&01
; Referenced 1 time by &ac04
.cabf8
    jsr cac70
    cpy l0074
    iny
    bcc cabf1
    ldx #&03
    cpy #&04
    bcc cabf8
    pla
    tay
    lda laceb,y
    sta l0075
    lda lad2b,y
    sta l0076
; Referenced 1 time by &ac24
.cac12
    lda #&00
    ldy #&05
; Referenced 1 time by &ac1c
.cac16
    asl l0076
    rol l0075
    rol a
    dey
    bne cac16
    adc #&bf
    jsr cac88
    dex
    bne cac12
    jsr cac6e
    ldx #&06
; Referenced 1 time by &ac54
.cac2b
    cpx #&03
    bne cac41
    ldy l0074
    beq cac41
; Referenced 1 time by &ac3f
.cac33
    lda l0078
    cmp #&e8
    lda (REGPCL),y
    bcs cac57
    jsr print_hex
    dey
    bne cac33
; Referenced 2 times by &ac31, &ac2d
.cac41
    asl l0078
    bcc cac53
    lda lacde,x
    jsr cac88
    lda lace4,x
    beq cac53
    jsr cac88
; Referenced 2 times by &ac43, &ac4e
.cac53
    dex
    bne cac2b
    rts
; Referenced 1 time by &ac39
.cac57
    jsr cac7c
    tax
    inx
    bne cac5f
    iny
; Referenced 1 time by &ac5c
.cac5f
    tya
; Referenced 1 time by &ac6b
.cac60
    jsr print_hex
    txa
    jmp print_hex
; Referenced 4 times by &afd2, &ada3, &aba6, &afae
.cac67
    lda REGPCH
    ldx REGPCL
    jsr cac60
; Referenced 1 time by &ac26
.cac6e
    ldx #&02
; Referenced 3 times by &abf8, &adbc, &ac76
.cac70
    lda #&a0
; Referenced 1 time by &ada0
.cac72
    jsr cac88
    dex
    bne cac70
    rts
; Referenced 1 time by &ab9a
.cac79
    lda l0074
    sec
; Referenced 1 time by &ac57
.cac7c
    ldy REGPCH
    tax
    bpl cac82
    dey
; Referenced 1 time by &ac7f
.cac82
    adc REGPCL
    bcc cac87
    iny
; Referenced 1 time by &ac84
.cac87
    rts
; Referenced 4 times by &ac20, &ac48, &ac72, &ac50
.cac88
    and #&7f
    jmp osasci
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
    equs "QWDLFOBGAXYPRM"
    equb &0d                                                ; ad79: .
.lad7a
    equb <(debug_cmd_Q)                                     ; ad7a: .
    equb <(debug_cmd_W)                                     ; ad7b: .
    equb <(debug_cmd_D)                                     ; ad7c: .
    equb <(debug_cmd_L)                                     ; ad7d: .
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
    equb >(debug_cmd_L)                                     ; ad8b: .
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
; Referenced 2 times by &adc5, &ae76
.cad96
    cmp #&20 ; ' '
    bcc cad9e
    cmp #&7f
    bcc cada0
; Referenced 1 time by &ad98
.cad9e
    lda #&20 ; ' '
; Referenced 1 time by &ad9c
.cada0
    jmp cac72
; Referenced 2 times by &aea3, &aebe
.cada3
    jsr cac67
    ldy #&00
; Referenced 1 time by &adb5
.cada8
    lda (REGPCL),y
    jsr print_hex
    lda #&20 ; ' '
    jsr osasci
    iny
    cpy l0008
    bne cada8
    jsr oscrlf
    ldx #&06
    jsr cac70
    ldy #&00
; Referenced 1 time by &adcb
.cadc1
    lda (REGPCL),y
    ldx #&03
    jsr cad96
    iny
    cpy l0008
    bne cadc1
    clc
    lda REGPCL
    adc l0008
    sta REGPCL
    bcc cadd8
    inc REGPCH
; Referenced 1 time by &add4
.cadd8
    jmp oscrlf
.brk_handler
    sta REGA
    pla
    sta REGP
    pla
    sec
    sbc #&02
    sta REGPCL
    pla
    sbc #&00
    sta REGPCH
    stx REGX
    sty REGY
    tsx
    stx REGSP
    jsr debug_cmd_R
    jmp brk_complete
; Referenced 1 time by &afc2
.cadf8
    ldx #&08
; Referenced 1 time by &ae04
.cadfa
    asl a
    pha
    lda #&18
    rol a
    jsr osasci
    pla
    dex
    bne cadfa
    rts
.debug_cmd
    cld
    lda #&08
    sta l0008
    lda #&00
    sta BRKADRL
    sta BRLADRH
    sta BRKINSTR
    sta REGA
    sta REGX
    sta REGY
    lda #&20 ; ' '
    sta REGP
    sta l0100
    lda #<brk_handler
    sta BRKVECL
    lda #>brk_handler
    sta BRKVECH
.debug_cmd_loop
    lda #>(debug_cmd_loop-1)
    pha
    lda #<(debug_cmd_loop-1) ; '*'
    pha
    lda l0100
    pha
    lda #&2d ; '-'
    jsr cae6e
    pla
    ldx l0100
    cpx #&0d
    bne cae45
    sta l0100
; Referenced 1 time by &ae40
.cae45
    lda l0100
    ldx #&0d
; Referenced 1 time by &ae50
.cae4a
    cmp lad6b,x
    beq cae61
    dex
    bpl cae4a
; Referenced 1 time by &a779
.cae52
    jsr print_bel
    jsr print_string
    equs "WHAT?"
    nop
    jmp oscrlf
; Referenced 1 time by &ae4d
.cae61
    lda lad7a,x
    sta l0074
    lda lad88,x
    sta l0075
    jmp (l0074)
; Referenced 5 times by &af68, &ae88, &ae37, &af09, &afe1
.cae6e
    jsr osasci
    jmp ca041
; Referenced 1 time by &afd7
.cae74
    lda (l0070,x)
    jsr cad96
    rts
.debug_cmd_W
    ldx #&72 ; 'r'
; Referenced 1 time by &af2a
.cae7c
    lda l0001,x
    jsr print_hex
    lda l0000,x
    jsr print_hex
    lda #&3f ; '?'
    jsr cae6e
    cmp #&0d
    bne cae90
    rts
; Referenced 1 time by &ae8d
.cae90
    ldy #&00
    jmp input_hex
.debug_cmd_D
    lda l0101
    cmp #&2c ; ','
    bne caeb1
    ldy #&02
    ldx #&7a ; 'z'
    jsr input_hex
; Referenced 1 time by &aeae
.caea3
    jsr cada3
    lda l007a
    cmp REGPCL
    lda l007b
    sbc REGPCH
    bcs caea3
    rts
; Referenced 1 time by &ae9a
.caeb1
    cmp #&0d
    beq caeba
    jsr input_decimal
    bne caebe
; Referenced 1 time by &aeb3
.caeba
    lda #&07
    sta l007a
; Referenced 2 times by &aeb8, &aec3
.caebe
    jsr cada3
    dec l007a
    bne caebe
    rts
.debug_cmd_L
    lda l0101
    cmp #&0d
    bne caed2
    lda #&0f
    jmp cab92
; Referenced 1 time by &aecb
.caed2
    cmp #&2c ; ','
    bne caeed
    ldy #&02
    ldx #&7a ; 'z'
    jsr input_hex
; Referenced 1 time by &aeea
.caedd
    lda #&01
    jsr cab92
    lda l007a
    cmp REGPCL
    lda l007b
    sbc REGPCH
    bcs caedd
    rts
; Referenced 1 time by &aed4
.caeed
    jsr input_decimal
    jmp cab92
.debug_cmd_F
    lda #&03
    sta VARIABLE_AT
    lda #&00
    sta l0043
    sta l0034
    sta l0025
    lda l0008
    sta l0016
    jsr basic_print_decimal
    lda #&3f ; '?'
    jsr cae6e
    cmp #&0d
    beq caf19
    ldy #&00
    jsr input_decimal_raw
    lda l007a
    sta l0008
; Referenced 1 time by &af0e
.caf19
    rts
.debug_cmd_O
    lda #&02
    ldx l0101
    cpx #&4e ; 'N'
    beq caf25
    lda #&03
; Referenced 1 time by &af21
.caf25
    jmp osasci
.debug_cmd_B
    ldx #&0a
    jmp cae7c
.debug_cmd_G
    lda BRKADRL
    ora BRLADRH
    beq caf3d
    ldy #&00
    lda (BRKADRL),y
    sta BRKINSTR
    lda #&00
    sta (BRKADRL),y
; Referenced 1 time by &af31
.caf3d
    lda #>brk_complete
    pha
    lda #<brk_complete ; 'P'
    pha
    lda REGP
    pha
    lda REGA
    ldx REGX
    ldy REGY
    plp
    jmp (REGPCL)
; Referenced 1 time by &adf5
.brk_complete
    nop
    cld
    lda BRKADRL
    ora BRLADRH
    beq caf5e
    ldy #&00
    lda BRKINSTR
    sta (BRKADRL),y
; Referenced 1 time by &af56
.caf5e
    rts
.debug_cmd_A
    ldx #&7c ; '|'
; Referenced 3 times by &af81, &af8b, &af86
.caf61
    lda l0000,x
    jsr print_hex
    lda #&3f ; '?'
    jsr cae6e
    cmp #&0d
    beq caf7e
    ldy #&00
    stx l0078
    ldx #&74 ; 't'
    jsr input_hex
    ldx l0078
    lda l0074
    sta l0000,x
; Referenced 1 time by &af6d
.caf7e
    rts
.debug_cmd_X
    ldx #&7d ; '}'
    jmp caf61
.debug_cmd_Y
    ldx #&7e ; '~'
    jmp caf61
.debug_cmd_P
    ldx #&7f
    jmp caf61
; Referenced 1 time by &adf2
.debug_cmd_R
    jsr print_string
    equs " PC   A  X  Y  NV BDIZC SP", &0a, &0d
    nop
    jsr cac67
; Referenced 1 time by &afbe
.cafb1
    lda REGA,x
    jsr print_hex
    lda #&20 ; ' '
    jsr osasci
    inx
    cpx #&03
    bcc cafb1
    lda REGP
    jsr cadf8
    lda #&20 ; ' '
    jsr osasci
    lda REGSP
    jsr print_hex
    jmp oscrlf
; Referenced 4 times by &a089, &aff1, &affd, &aff9
.debug_cmd_M
    jsr cac67
    ldx #&02
    jsr cae74
    lda (REGPCL,x)
    jsr print_hex
    lda #&3f ; '?'
    jsr cae6e
    cmp #&51 ; 'Q'
    beq cafff
    bcs caff4
    cmp #&0d
    beq caff7
    jsr ca77f
    jmp debug_cmd_M
; Referenced 1 time by &afe8
.caff4
    jmp ca037
; Referenced 1 time by &afec
.caff7
    inc REGPCL
    bne debug_cmd_M
    inc REGPCH
    bne debug_cmd_M
; Referenced 1 time by &afe6
.cafff
    rts
.PIA
.pydis_end

; Label references by decreasing frequency:
;     print_hex:                           17
;     list_line:                           16
;     osasci:                              14
;     get_line_length_in_y:                13
;     input_decimal:                       13
;     inc_lineptr_by_y:                    12
;     oscrlf:                              11
;     error_what:                           9
;     set_lineptr_to_page:                  8
;     skip_forward_x_lines:                 8
;     skip_backwards_x_lines:               8
;     print_string:                         8
;     input_decimal_raw:                    6
;     input_hex:                            6
;     ca041:                                5
;     ca11f:                                5
;     edit_print_space_info:                5
;     caa53:                                5
;     cae6e:                                5
;     ca25d:                                4
;     cac67:                                4
;     cac88:                                4
;     debug_cmd_M:                          4
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
;     ca043:                                2
;     ca059:                                2
;     ca0a3:                                2
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
;     ca80f:                                2
;     ca919:                                2
;     ca94a:                                2
;     caaa6:                                2
;     cab4d:                                2
;     cabc9:                                2
;     cabed:                                2
;     cac41:                                2
;     cac53:                                2
;     cad96:                                2
;     cada3:                                2
;     caebe:                                2
;     ca00a:                                1
;     ca00b:                                1
;     ca00e:                                1
;     ca019:                                1
;     ca021:                                1
;     ca037:                                1
;     ca03d:                                1
;     ca050:                                1
;     ca06a:                                1
;     ca080:                                1
;     ca089:                                1
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
;     ca721:                                1
;     ca73e:                                1
;     ca753:                                1
;     ca755:                                1
;     ca771:                                1
;     ca77f:                                1
;     ca78b:                                1
;     debug_cmd_Q:                          1
;     ca7b2:                                1
;     ca7c4:                                1
;     ca7db:                                1
;     ca7ee:                                1
;     ca7fc:                                1
;     ca810:                                1
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
;     edit_cmd_GT:                          1
;     check_escape_and_inc_lineptr_by_y:    1
;     caaba:                                1
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
;     cad9e:                                1
;     cada0:                                1
;     cada8:                                1
;     cadc1:                                1
;     cadd8:                                1
;     cadf8:                                1
;     cadfa:                                1
;     cae45:                                1
;     cae4a:                                1
;     cae52:                                1
;     cae61:                                1
;     cae74:                                1
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
;     brk_complete:                         1
;     caf5e:                                1
;     caf7e:                                1
;     debug_cmd_R:                          1
;     cafb1:                                1
;     caff4:                                1
;     caff7:                                1
;     cafff:                                1
;     basic_post_cmd_checks+2:              1
;     basic_post_cmd_checks_and_next_cmd:   1
;     basic_end:                            1
;     print_bel:                            1
;     ossave:                               1
;     osload:                               1
;     osrdch:                               1
;     osecho:                               1
;     oscli:                                1
    assert <(basic_next_command-1) == &5a
    assert <(debug_cmd-1) == &06
    assert <(debug_cmd_A) == &5f
    assert <(debug_cmd_B) == &28
    assert <(debug_cmd_D) == &95
    assert <(debug_cmd_F) == &f3
    assert <(debug_cmd_G) == &2d
    assert <(debug_cmd_L) == &c6
    assert <(debug_cmd_M) == &d2
    assert <(debug_cmd_O) == &1a
    assert <(debug_cmd_P) == &89
    assert <(debug_cmd_Q) == &a2
    assert <(debug_cmd_R) == &8e
    assert <(debug_cmd_W) == &7a
    assert <(debug_cmd_X) == &7f
    assert <(debug_cmd_Y) == &84
    assert <(debug_cmd_loop-1) == &2a
    assert <(edit_cmd-1) == &12
    assert <(edit_cmd_A) == &0b
    assert <(edit_cmd_AT) == &00
    assert <(edit_cmd_B) == &a8
    assert <(edit_cmd_C) == &7a
    assert <(edit_cmd_D) == &79
    assert <(edit_cmd_E) == &13
    assert <(edit_cmd_F) == &27
    assert <(edit_cmd_GT) == &6b
    assert <(edit_cmd_I) == &ee
    assert <(edit_cmd_L) == &b5
    assert <(edit_cmd_LT) == &8e
    assert <(edit_cmd_M) == &c4
    assert <(edit_cmd_MINUS) == &75
    assert <(edit_cmd_N) == &4c
    assert <(edit_cmd_O) == &a2
    assert <(edit_cmd_PLUS) == &be
    assert <(edit_cmd_Q) == &98
    assert <(edit_cmd_R) == &df
    assert <(edit_cmd_S) == &5f
    assert <(edit_cmd_SPACE) == &4b
    assert <(edit_cmd_STAR) == &63
    assert <(edit_cmd_T) == &a5
    assert <(edit_cmd_X) == &de
    assert <(edit_cmd_Z) == &62
    assert <(edit_cmd_loop-1) == &35
    assert <brk_complete == &50
    assert <brk_handler == &db
    assert >(basic_next_command-1) == &c5
    assert >(debug_cmd-1) == &ae
    assert >(debug_cmd_A) == &af
    assert >(debug_cmd_B) == &af
    assert >(debug_cmd_D) == &ae
    assert >(debug_cmd_F) == &ae
    assert >(debug_cmd_G) == &af
    assert >(debug_cmd_L) == &ae
    assert >(debug_cmd_M) == &af
    assert >(debug_cmd_O) == &af
    assert >(debug_cmd_P) == &af
    assert >(debug_cmd_Q) == &a7
    assert >(debug_cmd_R) == &af
    assert >(debug_cmd_W) == &ae
    assert >(debug_cmd_X) == &af
    assert >(debug_cmd_Y) == &af
    assert >(debug_cmd_loop-1) == &ae
    assert >(edit_cmd-1) == &a7
    assert >(edit_cmd_A) == &aa
    assert >(edit_cmd_AT) == &28
    assert >(edit_cmd_B) == &a7
    assert >(edit_cmd_C) == &a9
    assert >(edit_cmd_D) == &a8
    assert >(edit_cmd_E) == &ab
    assert >(edit_cmd_F) == &a9
    assert >(edit_cmd_GT) == &aa
    assert >(edit_cmd_I) == &aa
    assert >(edit_cmd_L) == &a7
    assert >(edit_cmd_LT) == &aa
    assert >(edit_cmd_M) == &aa
    assert >(edit_cmd_MINUS) == &ab
    assert >(edit_cmd_N) == &a8
    assert >(edit_cmd_O) == &a9
    assert >(edit_cmd_PLUS) == &aa
    assert >(edit_cmd_Q) == &a7
    assert >(edit_cmd_R) == &a8
    assert >(edit_cmd_S) == &a9
    assert >(edit_cmd_SPACE) == &a9
    assert >(edit_cmd_STAR) == &aa
    assert >(edit_cmd_T) == &a8
    assert >(edit_cmd_X) == &aa
    assert >(edit_cmd_Z) == &ab
    assert >(edit_cmd_loop-1) == &a7
    assert >brk_complete == &af
    assert >brk_handler == &ad

save pydis_start, pydis_end
