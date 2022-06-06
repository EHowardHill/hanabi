import os, pprint

code = """
push [5,10]; visit find_lcm

# Least Common Multiple
spot find_lcm
    pop [$a,$b]
    nook $temp 1
    spot repeat

    # logic
    goto complete and:
        equal 0 % temp $a
        equal 0 % temp $b
    spot return

    # repeat logic
    ++ $temp
    goto repeat
    spot complete
    return
"""

code = code.replace(";", "\n").replace("\t", "    ")

for line in code.split("\n"):
    line = line.strip()
    if len(line) > 0:
        if line[0] != "#":
            work = line.split(" ")
            if len(work) > 1:
                print(work)