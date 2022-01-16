# -*- coding: utf-8 -*-
import sys
import subprocess

def run(cmd, text):
    #execute command
    rst = subprocess.run(cmd)
    if rst.returncode != 0: # on Success
        print(f"{text} Failed")
    else:
        print(f"{text} OK") # on Fail

# check for arguments length
if len(sys.argv) < 2:
    print("Es muss mindestens 1 argument sein")
    sys.exit(0)

for arg in sys.argv[1:len(sys.argv)]: # loop from index=1 until last index
    print(f"FILE: {arg}")
    run(f"ghdl -s {arg}", "Syntax−Check") # Syntax−Check
    run(f"ghdl -a {arg}", "Analyse") # Analyse
    string = arg.partition(".")[0] # substring without ".vhdl"
    run(f"ghdl -e {string}", "Build") # Build
    run(f"ghdl -r {string} --vcd=testbench.vcd", "VCD−Dump") # VCD−Dump
    run(f"gtkwave testbench.vcd", "Start GTKWave") # Startet GTKWave
