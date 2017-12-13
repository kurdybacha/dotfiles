#!/usr/bin/env python

import sys
import re
import fnmatch
import os
import json
import urllib2

if len(sys.argv) != 4:
    print "Invalid number of arguments"
    sys.exit(2)

# regular expressions
compileRe = re.compile("^ccache g(cc|\+\+) ")
fileRe = re.compile("(\S+\.c(pp)?)")
includeRe = re.compile("\s-I(\S+)")

#wc = os.getenv("WORKING_COPY")
workspace = sys.argv[1]
projectDir = workspace + '/' + sys.argv[2]
logFile = projectDir + '/' + sys.argv[3]
resultFile = 'compile_commands.json'

if not os.path.exists(logFile):
    print "Log file " + logFile + " does not exist."
    sys.exit(2);

defaultInc = [
    "/usr/include",
    "/usr/include/c++/4.9.3",
]

ignoreFiles = set([
    "__decoder_version.cpp"
])

cache = {}

with open(logFile, 'r') as f:
    for line in f.readlines():
        match = compileRe.search(line)
        if not match:
            continue
        match = fileRe.search(line)
        if not match:
            continue
        groups = match.groups()
        fileName = groups[0]
        isCpp = len(groups) > 1

        if fileName not in cache:
            cache[fileName] = []
        cache[fileName] += [
            x.groups()[0]
            for x in includeRe.finditer(line)]

fileRe = re.compile("^(\S+\.c(pp)?)$")
result = []
for root, dirnames, filenames in os.walk(projectDir, topdown=True):
    # skip decoders and unittests
    if 'src/decoders/library' in root:
        dirnames[:] = []
        continue
    for filename in filter(fileRe.match, filenames):
        if filename in ignoreFiles:
            continue
        if filename not in cache:
            sys.stderr.write('Warning: File not in cache: %s/%s\n' %
                    (root, filename))
            continue

        includes = defaultInc + cache[filename]
        includes = ['-I' + workspace + x if os.path.isabs(x) else '-I' + root + '/' + x
                for x in includes]
        includes = ' '.join(includes)

        compiler = 'gcc' if filename.endswith('.c') else \
                'g++ -std=c++11'

        entry = {
            'directory' : root,
            'command' : '{2} -c {0} -o {0}.o {1}'.format(
                filename, includes, compiler),
            'file' : filename,
        }
        result.append(entry)

result = sorted(result,
        key=lambda k: k['directory'] + '/' + k['file'])

with open(resultFile, 'w') as f:
    f.write(json.dumps(result, indent=4))

