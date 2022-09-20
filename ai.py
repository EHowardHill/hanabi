import os, pprint
from typing import final

"""
% nook x 0
% spot
    print "This is an example"
%   = x + x 1
% while < x 12
"""

s_NEWLINE = 0
s_EMBEDDED = 1
s_PERCENT = 2
s_NOOK = 3
s_VARIABLE = 4
s_INT = 5
s_SPOT = 6
s_PRINT = 7
s_STRING = 8
s_EQUALS = 9
s_PLUS = 10
s_WHILE = 11
s_LESSTHAN = 12

l_DATA = 0
l_MAIN = 1

DATA_COUNTER = 0

cmd_ref = {
    s_PRINT: {
        "data": "#reference: .asciiz \"#data\"\n",
        "main": "li $v0, 4\nla $a0, #reference\nsyscall\n"
    }
}

code = [s_PERCENT, s_NOOK, s_VARIABLE, s_INT, s_NEWLINE, s_PERCENT, s_SPOT, s_NEWLINE, s_PRINT, s_STRING, s_NEWLINE, s_PERCENT, s_EQUALS, s_VARIABLE, s_PLUS, s_VARIABLE, s_INT, s_NEWLINE, s_PERCENT, s_WHILE, s_LESSTHAN, s_VARIABLE, s_INT]

code = [s_PRINT, s_STRING, s_NEWLINE, s_PRINT, s_STRING, s_NEWLINE]
data = ["Hello, sheep! Hello, cup of tea!", "This is my second string."]

ctrl_stacks = {}

embedded = False
current_line = []
local_data = "#data"
local_ref = "#reference"

for atom in code:
    if atom == s_NEWLINE:
        # do a thing!

        for loc in range(len(current_line)):
            l = current_line[loc]
            if l in cmd_ref.keys():

                for key in cmd_ref[l].keys():
                    raw = cmd_ref[l][key]

                    if "#data" in raw and len(data) > 0:
                        local_data = data.pop()
                        local_ref = chr(DATA_COUNTER + 65)
                        DATA_COUNTER += 1

                    raw = raw.replace("#data", local_data).replace("#reference", local_ref)

                    if key in ctrl_stacks:
                        ctrl_stacks[key] += raw
                    else:
                        ctrl_stacks[key] = raw

        current_line.clear()
    else:
        current_line.append(atom)

final_ctrl = ""
for c in ctrl_stacks.keys():
    final_ctrl += "." + c + "\n"
    for cc in ctrl_stacks[c]:
        final_ctrl += cc
    final_ctrl += "\n"

print(final_ctrl)