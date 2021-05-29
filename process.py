import os

text = """
nook Z
    @a --type int16
    @b --type int16
    @c --type int16 --h
    = c ( + a b )
yes

"""

text = text.replace('    ','\t ').replace('\n',' \n ')

things = text.split(' ')[1:-1]

line_count = 0

t = 0
size = len(things)
cur_nook = {}
nooks = []
level = 0
cur_level = 0
level_offset = 0
multiline = False
line_count = 0

while t < size:
    print("\t\t\t\t\t" + str(line_count))
    if things[t] == '\n':
        multiline = False
        cur_level = 0
        print("\n -newline- ")
    elif things[t] == '\t':
        cur_level += 1
    elif things[t] == "|":
        if things[t+1] == "\n":
            level_offset += 1
        else:
            multiline = True
            print("\n -newline- ")
    else:
        if cur_level < level:
            print(things[t] + "\tOUT OF SCOPE")
            line_count += 1
            level -= 1
        elif (cur_level - level_offset > level):
            print("NEW DIRECTIVE")
            print(things[t])
        else:
            # If relevant, print
            if (cur_level < level - 1): level_offset = 0
            print(things[t] + '\t' + str(cur_level) + '\t' + str(level))

            # If within a nook
            if things[t] in [":", "nook"] or (things[t+1] == '\n' and things[t] == "|"):
                cur_level += 1
                level += 1
    t += 1