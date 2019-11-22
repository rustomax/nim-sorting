import random, times, strformat

import bubble/bubble
import comb/comb
import insertion/insertion
import selection/selection
import merge/merge
import quicksort/quicksort

var size: int

proc genRandom(): seq[int] =
    for i in 1 .. size:
        result.add rand(size)

template measure(fn: untyped): float =
    var a = genRandom()
    var startTime: float
    startTime = cpuTime()
    fn(a)
    cpuTime() - startTime

proc benchmark() =
    echo "\nTesting sorting algorithms with ", size, " integers"
    echo fmt"  Bubble     : {measure(bubble.sort):>9.6f} sec"
    echo fmt"  Selection  : {measure(selection.sort):>9.6f} sec"
    echo fmt"  Insertion  : {measure(insertion.sort):>9.6f} sec"
    echo fmt"  Merge      : {measure(merge.sort):>9.6f} sec"
    echo fmt"  Comb       : {measure(comb.sort):>9.6f} sec"
    echo fmt"  Quicksort  : {measure(quicksort.sort):>9.6f} sec"

proc main() =
    randomize()

    for i in [1_000, 10_000, 100_000]:
        size = i
        benchmark()

main()