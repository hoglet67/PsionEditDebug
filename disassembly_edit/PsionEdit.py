from commands import *
from trace6502 import *

from atom import *
from psion import *


# Load the program to be disassembled into the debugger's memory.
# The md5sum is optional but helps avoid confusion if there are multiple versions
# of the same program.
load(0xA000, "PsionEdit.orig", "33a44a8d24c0f1cdc9fe4c3a20e847b6")

# Common/shared labels
add_atom_labels()
add_psion_labels()

# Labels that vary between the "Edit" version and the "Debug" version
label(0xa08a, "multiply_by_10")
label(0xa7a8, "edit_cmd_T")
label(0xa8a5, "edit_cmd_B")
label(0xa927, "edit_cmd_H")
label(0xae74, "debug_cmd_Q")
label(0xaec6, "debug_cmd_C")
label(0xafd5, "debug_cmd_M")

# Use all the information provided to actually disassemble the program.
go()
