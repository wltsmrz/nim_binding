import os
import strutils

# paths setup
let cur_src_path {.compileTime.} = currentSourcePath.rsplit(DirSep, 1)[0]
let dep_dir {.compileTime.} = joinPath(cur_src_path, "zstd")
let dep_lib_dir {.compileTime.} = joinPath(dep_dir, "lib")
let dep_header_dir {.compileTime.} = joinPath(dep_dir, "lib")

# add more headers and custom pragmas for a good time
let dep_lib_name {.compileTime.} = "zstd"
let dep_header_name {.compileTime.} = "zstd.h"

# useful common pragmas for bindings
{.pragma: c_dep_type, header: dep_header_name, bycopy.}
{.pragma: c_dep_proc, importc, header: dep_header_name, cdecl.}
{.pragma: c_dep_enum, size: sizeof(cint).}

# compiler/linker flags
{.passC: "-I" & dep_header_dir.}
{.passL: "-L" & dep_lib_dir & " -l" & dep_lib_name.}

# make(1) arguments
let make_dir {.compileTime.} = dep_dir
let make_target {.compileTime.} = "lib-release"

# attempt to build dependency from source
const make_res = gorgeEx("make -C " & make_dir & " " & make_target)

when make_res.exitCode != 0:
  {.fatal: "Fail to make dep: " & make_res.output.}

# merge contents of binding
include src/bindings

