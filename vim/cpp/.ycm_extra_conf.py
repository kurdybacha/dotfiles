#!/usr/bin/env python
import os
import copy
import subprocess
import sys
try:
    import ycm_core
    ycm = True
except Exception, e:
    ycm = False

def GetDefaultRoutes():
  try:
    p = subprocess.Popen('gcc -x c++ -v -E /dev/null 2>&1 | '\
                         "sed -n '/here:/,/End of search list/p' | "\
                         'grep ^" " | cut -f 2 -d " "',
                         stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                         shell=True)
    p.wait()
    out, err = p.communicate()
    return out.splitlines()
  except Exception, e:
    return []

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]
HEADER_EXTENSIONS = [ '.h', '.hxx', '.hpp', '.hh' ]

compilation_database_folder = os.path.join(DirectoryOfThisScript(), 'build')

if ycm and os.path.exists(compilation_database_folder):
  database = ycm_core.CompilationDatabase(compilation_database_folder)
  print "db loaded from %s" % (compilation_database_folder)
else:
  database = None

def IsHeaderFile(filename):
  extension = os.path.splitext(filename)[1]
  return extension in HEADER_EXTENSIONS

def RunTagsCmd(args):
  try:
    c = ["rc"]
    c.extend(args)
    p = subprocess.Popen(c, stdout=subprocess.PIPE,
               stderr=subprocess.PIPE)
    out, err = p.communicate()
    return out
  except Exception, e:
    return None

path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=', '-iframework' ]

def RtagsFlagsForFile(filename):
  project = RunTagsCmd(["--find-project-root", filename])
  if not project or "=> []" in project:
    return None

  dir = os.path.dirname(filename)
  project_root = project.split('[')[2][:-2]
  sources = [filename, dir, project_root]
  flags_lines = None
  for source in sources:
    flags_lines = RunTagsCmd(["--sources", source, "--compilation-flags-only", "--compilation-flags-split-line"])
    if flags_lines:
      break
  if not flags_lines:
    return None

  is_cpp = "++" in flags_lines
  flags = flags_lines.split(os.linesep)

  if is_cpp:
      flags = ['-x', 'c++'] + flags

  return flags
# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
'-Wall',
'-Wextra',
'-Werror',
#'-Wc++98-compat',
#'-Wno-long-long',
#'-Wno-variadic-macros',
#'-fexceptions',
#'-Wno-unused-parameter',
'-DNDEBUG',
# For a C project, you would set this to 'c' instead of 'c++'.
'-x',
'c++',
'-std=c++11',
]

default_includes = [
'/usr/include'
]

vcs_root = [
'.svn',
'.git',
'LICENSE'
]

def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags

def GetCompilationInfoForFile( filename ):
  return database.GetCompilationInfoForFile( filename )


def FlagsForFile( filename, **kwargs ):

  if IsHeaderFile(filename):
    basename = os.path.splitext(filename)[0]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      print replacement_file
      if os.path.exists(replacement_file):
        return FlagsForFile(replacement_file, **kwargs)

  relative_to = DirectoryOfThisScript()

  mflags = None

  # Try compilation database
  if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = GetCompilationInfoForFile( filename )
    if not compilation_info:
      return None
    mflags = MakeRelativePathsInFlagsAbsolute(
      compilation_info.compiler_flags_,
      compilation_info.compiler_working_dir_)

  # Try rtags
  if mflags is None:
      mflags = RtagsFlagsForFile(filename)

  # Use default flags
  if mflags is None:
    mflags = flags
    dir = os.path.dirname(os.path.abspath(filename))

    while True:
      if True in [os.path.exists(os.path.join(dir, x)) for x in vcs_root]:
        mflags = copy.copy(flags)
        if os.path.exists(os.path.join(dir, 'Include')):
          mflags.extend(['-I', os.path.join(dir, 'Include')])
        elif os.path.exists(os.path.join(dir, 'include')):
          mflags.extend(['-I', os.path.join(dir, 'include')])
        elif os.path.exists(os.path.join(dir, 'src')):
          mflags.extend(['-I', os.path.join(dir, 'src')])
        else:
          mflags.extend(['-I', dir])
        break

      odir = dir
      dir = os.path.dirname(odir)
      if dir == odir:
        break

  for inc in GetDefaultRoutes():
    if inc not in mflags:
      mflags.append('-isystem')
      mflags.append(inc)

  final_flags = MakeRelativePathsInFlagsAbsolute(mflags, relative_to)

  return {
    'flags': final_flags,
    'do_cache': True
  }

if __name__ == '__main__':
  import pprint
  for i in sys.argv[1:]:
    flags = FlagsForFile(i)
    print " ".join(flags['flags'])
    pprint.pprint(flags)
