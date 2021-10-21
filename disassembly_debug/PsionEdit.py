from commands import *
from trace6502 import *

from atom import *
from psion import *


# Load the program to be disassembled into the debugger's memory.
# The md5sum is optional but helps avoid confusion if there are multiple versions
# of the same program.
load(0xA000, "PsionEdit.orig", "c91c59288605fd0a9da58bcbc7fe0210")

# Common/shared labels
add_atom_labels()
add_psion_labels()

label(0xa08c, "multiply_by_10")

label(0xa7a8, "edit_cmd_B")
label(0xa8a5, "edit_cmd_T")
label(0xa927, "edit_cmd_F")
label(0x2800, "edit_cmd_AT")

label(0xa7a2, "debug_cmd_Q")
label(0xaec6, "debug_cmd_L")
label(0xafd2, "debug_cmd_M")

label(0xaab1, "check_escape_and_inc_lineptr_by_y")

expr_label(0xa028, "command_table-1")


# Command table
pc = 0xa029
label(pc, "command_table")
expr_label(pc+1, "command_table+1")
for i in range(3):
    pc = stringhi(pc)
    pc = code_ptr(pc + 1, pc, 1)

# Use all the information provided to actually disassemble the program.
go()
