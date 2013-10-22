#!/usr/bin/env python

import os
import sys
import linecache

infile = sys.argv[1]

if os.path.exists("/usr/share/dict/words"):
	dict = "/usr/share/dict/words" 
elif os.path.exists("/usr/dict/words"):
	dict = "/usr/dict/words" 
else:
	print "dict not available on system!" 
	sys.exit(1)

ifh = open(infile, 'r')

for line in ifh:
	word = line.rstrip()
	command = "grep -Fxq %s %s" % (word,dict)
	if os.system(command):
		print "%s : Ne'er spoken ever!" % word
	else:
		print "%s : Art spoken ever and anon!" % word

ifh.close()

sys.exit(0)
