import sys
'''
align a set of lines w.r.to the first = in the lines
'''

align_char  = '='
lines       = sys.stdin.readlines()

ac_pos,lines    = zip(*[(line.find(align_char),line) for line in lines])
align_position  = max(ac_pos)

if align_position == -1:
    for line in lines: print line,
else:
    for pos,line in zip(ac_pos,lines):
        if pos == -1:
            print line,
        else:
            print '{l:{width}} = {r}'.format(
                l     = line[:pos].rstrip(),
                r     = line[pos+1:].strip(),
                width = align_position
            )
