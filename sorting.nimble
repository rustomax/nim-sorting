# Package
version       = "0.1.0"
author        = "Max Skybin"
description   = "A collection of sorting algorithms in Nim"
license       = "MIT"
srcDir        = "src"

# Dependencies
requires "nim >= 1.0.2"

# Tasks

task benchmark, "Runs the benchmarks suite":
  exec "nim c -r -d:release bench/benchmark"
  exec "rm -f bench/benchmark 2>/dev/null"