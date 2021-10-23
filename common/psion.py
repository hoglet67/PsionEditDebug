from commands import *
import utils

def my_label_maker(addr, context, suggestion):
    if context < 0xAB92:
        if addr == 0x000a: return "ALTTOPX"
        if addr == 0x000b: return "ALTTOLH"
        if addr == 0x000c: return "ALTPAGEH"
        if addr == 0x0072: return "LINEPTRL"
        if addr == 0x0073: return "LINEPTRH"
        if addr == 0x0079: return "l0079"
        if addr == 0x007C: return "MARKER1L"
        if addr == 0x007D: return "MARKER1H"
        if addr == 0x007E: return "MARKER2L"
        if addr == 0x007F: return "MARKER2H"
    else:
        if addr == 0x000a: return "BRKADRL"
        if addr == 0x000b: return "BRLADRH"
        if addr == 0x000c: return "BRKINSTR"
        if addr == 0x0072: return "REGPCL"
        if addr == 0x0073: return "REGPCH"
        if addr == 0x0079: return "REGSP"
        if addr == 0x007C: return "REGA"
        if addr == 0x007D: return "REGX"
        if addr == 0x007E: return "REGY"
        if addr == 0x007F: return "REGP"
    return suggestion

def add_psion_labels():

    config.set_label_references(True);
    config.set_hex_dump(False);

    set_label_maker_hook(my_label_maker)

    label(0xa0a8, "set_lineptr_to_page")
    label(0xa0b1, "list_line")
    label(0xa0db, "compare_lineptr_with_top")
    label(0xa0e7, "inc_lineptr_by_y")
    label(0xa120, "input_decimal_raw")
    label(0xa144, "dec_lineptr_by_a")
    label(0xa16f, "get_line_length_in_y")

    label(0xa17b, "skip_forward_x_lines")
    label(0xa18b, "get_start_of_last_line")
    label(0xa1b9, "skip_backwards_x_lines")

    label(0xa239, "match_pattern")
    label(0xa3d1, "input_decimal")
    label(0xa43f, "print_hex")
    label(0xa455, "set_top_to_end_of_program")
    label(0xa47b, "set_top_to_lineptr")
    label(0xa4d5, "set_marker_1")
    label(0xa4f0, "set_marker_2")
    label(0xa53c, "swap_text_spaces")
    label(0xa57d, "insert_buffer")
    label(0xa64c, "renumber_lines")
    label(0xa619, "append_line_from_text_to_buffer")
    label(0xa685, "input_hex")
    label(0xa6ab, "count_delimiters")
    label(0xa6be, "end_marker_at_lineptr")
    label(0xa779, "error_what")

    # BRK
    entry(0xaddb, "brk_handler")
    expr(0xae22, "<brk_handler")
    expr(0xae27, ">brk_handler")

    #
    label(0xae07, "debug_cmd");
    entry(0xae2b, "debug_cmd_loop")
    expr(0xae2c, ">(debug_cmd_loop-1)")
    expr(0xae2f, "<(debug_cmd_loop-1)")

    label(0xa713, "edit_cmd");
    entry(0xa736, "edit_cmd_loop")
    expr(0xa737, ">(edit_cmd_loop-1)")
    expr(0xa73a, "<(edit_cmd_loop-1)")

    entry(0xaf50, "brk_complete")
    expr(0xaf3e, ">brk_complete")
    expr(0xaf41, "<brk_complete")

    byte(0xac8d, 0x44)
    byte(0xacd1, 0x0D)
    byte(0xacde, 0x06)
    byte(0xace4, 0x07)
    byte(0xaceb, 0x40)
    byte(0xad2b, 0x40)

    # Debug commands
    label(0xae7a, "debug_cmd_W")
    label(0xae95, "debug_cmd_D")
    label(0xaef3, "debug_cmd_F")
    label(0xaf1a, "debug_cmd_O")
    label(0xaf28, "debug_cmd_B")
    label(0xaf2d, "debug_cmd_G")
    label(0xaf5f, "debug_cmd_A")
    label(0xaf7f, "debug_cmd_X")
    label(0xaf84, "debug_cmd_Y")
    label(0xaf89, "debug_cmd_P")
    label(0xaf8e, "debug_cmd_R")

    # Edit commands
    label(0xa798, "edit_cmd_Q")
    label(0xa7b5, "edit_cmd_L")
    label(0xa84c, "edit_cmd_N")
    label(0xa879, "edit_cmd_D")
    label(0xa8df, "edit_cmd_R")
    label(0xa94b, "edit_cmd_SPACE")
    label(0xa95f, "edit_cmd_S")
    label(0xa97a, "edit_cmd_C")
    label(0xa9a2, "edit_cmd_O")
    label(0xaa0b, "edit_cmd_A")
    label(0xaa63, "edit_cmd_STAR")
    label(0xaa6b, "edit_cmd_GT")
    label(0xaa8e, "edit_cmd_LT")
    label(0xaabe, "edit_cmd_PLUS")
    label(0xaac4, "edit_cmd_M")
    label(0xaade, "edit_cmd_X")
    label(0xaaee, "edit_cmd_I")
    label(0xab13, "edit_cmd_E")
    label(0xab62, "edit_cmd_Z")
    label(0xab75, "edit_cmd_MINUS")

    label(0xa9c5, "edit_print_space_info")

    # Start tracing instructions at the address given in 0xA002/3
    entry(0xA002)

    # Table of pointers to plot handler
    for i in range(24):
        code_ptr(0xa6e3 + i, 0xa6fb + i)

    for i in range(14):
        code_ptr(0xad7a + i, 0xad88 + i)
