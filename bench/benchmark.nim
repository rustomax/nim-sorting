import random, times, strformat

import sorting/bubble
import sorting/comb
import sorting/insertion
import sorting/merge
import sorting/quicksort
import sorting/selection

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
    echo "\nBenchmarking sorting algorithms with ", size, " integers"
    echo fmt"  Bubble     : {measure(bubbleSort):>9.6f} sec"
    echo fmt"  Selection  : {measure(selectionSort):>9.6f} sec"
    echo fmt"  Insertion  : {measure(insertionSort):>9.6f} sec"
    echo fmt"  Merge      : {measure(mergeSort):>9.6f} sec"
    echo fmt"  Comb       : {measure(combSort):>9.6f} sec"
    echo fmt"  Quicksort  : {measure(quickSort):>9.6f} sec"

proc main() =
    randomize()

    for i in [1_000, 10_000, 100_000]:
        size = i
        benchmark()

main()