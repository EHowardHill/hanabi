import os, pprint

text = """
nook Z
    @a --type int16
    @b --type int16
    @c --type int16 --h
    = c | d |
        + a b
        * 3 1
yes
"""

text = text.replace('    ','\t ').replace('\n',' \n ')

things = text.split(' ')[1:-1]

class line():
    oper = ""
    factors = {}
    references = {}
    def __init__(self, oper="", factors={}, references={}):
        self.oper = oper
        self.factors = factors
        self.references = references
    def pprint(self):
        for f in self.factors:
            print('\t' + str(f) + '\t' + self.factors[f])

class directive():
    id = 0
    lines = []
    def __init__(self, id, lines=[]):
        self.id = id
        self.lines = lines
    def pprint(self):
        print('- id - ' + str(id))
        try:
            for line in self.lines:
                line.pprint()
        except Exception as e:
            print(str(e))

class nook():
    name = ""
    tags = []
    directive = []
    def __init__(self, name="", tags=None, directive= 0):
        self.name = name
        self.tags = tags
        self.directive = directive
    def pprint(self):
        self.directive.pprint()

t = 0
size = len(things)
cur_nook = {}
nooks = []
level = 0
cur_level = 0
level_offset = 0
multiline = False
cur_line = line()
all_lines = directive(id=0)

while t < size:
    if things[t] == '\n':
        multiline = False
        cur_level = 0
        print("\n -newline- ")
        all_lines.lines.append(cur_line)
        cur_line = None
        cur_line = line()
        cur_line.pprint()
    elif things[t] == '\t':
        cur_level += 1
    elif things[t] == "|":
        if things[t+1] == "\n":
            level_offset += 1
        else:
            multiline = True
            print("\n -newline- ")
            all_lines.lines.append(cur_line)
            cur_line = None
            cur_line = line()
            cur_line.pprint()
    else:
        if cur_level < level:
            print("OUT OF SCOPE")
        elif (cur_level - level_offset > level):
            print("NEW DIRECTIVE")
            print(things[t])
            at = len(cur_line.factors)
            cur_line.factors[at] = 'null'
            cur_line.references[at] = 'ref'
        else:
            if (cur_level < level - 1): level_offset = 0
            cur_line.factors[len(cur_line.factors)] = things[t]
            print(things[t] + '\t' + str(cur_level) + '\t' + str(level))
            if things[t] in [":", "nook"] or (things[t+1] == '\n' and things[t] == "|"):
                cur_level += 1
                level += 1
    t += 1

main = nook(
    name="__main__",
    tags=[],
    directive=all_lines
)

#main.pprint()