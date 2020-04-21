
proc ZSTD_versionString*(): cstring {.c_dep_proc.}

debugEcho ZSTD_versionString()

type ZSTD_inBuffer* {.c_dep_type.} = object
  src*: ptr byte
  size*: csize_t
  pos*: csize_t

debugEcho ZSTD_inBuffer()

type ZSTD_strategy* {.c_dep_enum, c_dep_type.} = enum
  ZSTD_fast = 1,
  ZSTD_dfast = 2,
  ZSTD_greedy = 3,
  ZSTD_lazy = 4,
  ZSTD_lazy2 = 5,
  ZSTD_btlazy2 = 6,
  ZSTD_btopt = 7,
  ZSTD_btultra = 8,
  ZSTD_btultra2 = 9

debugEcho ord(ZSTD_lazy2)


