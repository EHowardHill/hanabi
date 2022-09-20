import os, pprint

code = """
nook answer
= answer % input, 2
print answer
"""

t_count = 0

c_nook = 1
c_eq = 2
c_rem = 3
c_com = 4
c_input = 5
c_print = 6

execs = {
    5: {
        0: {
            0: "char t0*;",
            1: "scanf(\"%c\", &t0);"
        }
    }
}