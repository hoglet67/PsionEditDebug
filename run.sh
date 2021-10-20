#!/bin/bash

export PYTHONPATH=../../py8dis/py8dis:../common:$PATH

for i in disassembly_edit
do
    echo "Building $i"
    cd $i
    python PsionEdit.py > PsionEdit.asm
    beebasm -i PsionEdit.asm -o PsionEdit.bin
    md5sum PsionEdit.orig PsionEdit.bin
    cd ..
done
