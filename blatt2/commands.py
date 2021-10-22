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
if len(sys.argv) < 3:
    print("Es muss mindestens 2 argumenten sein")
    sys.exit(0)

last = sys.argv[len(sys.argv)-1] # last file as "testbench.vcd"

# check last argument for format
if last.partition(".")[2] != "vcd":
    print("Es muss letzte Datei mit der endung .vcd uebergeben werden")
    sys.exit(0)

for arg in sys.argv[1:len(sys.argv)-1]: # loop from index=1 until last index - 1
    print(f"FILE: {arg}")
    run(f"ghdl -s {arg}", "Syntax−Check") # Syntax−Check
    run(f"ghdl -a {arg}", "Analyse") # Analyse
    string = arg.partition(".")[0] # substring without ".vhdl"
    run(f"ghdl -e {string}", "Build") # Build
    run(f"ghdl -r {string} --vcd={last}", "VCD−Dump") # VCD−Dump
    run(f"gtkwave {last}", "Start GTKWave") # Startet GTKWave
