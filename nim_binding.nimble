# Package

version       = "0.1.0"
author        = "wltsmrz"
description   = "A new awesome nimble package"
license       = "MIT"
skipDirs = @["tests", "examples"]
skipFiles = @["README.md"]
installDirs = @["src"]
installFiles = @["lib.nim"]



# Dependencies

requires "nim >= 1.2.0"
