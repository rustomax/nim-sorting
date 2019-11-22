# nim-sorting
A collection of sorting algorithms in Nim

## Compile and run

```sh
nim c -r -d:release performance.nim
```

## Benchmark

### 1,000 integers
| Algorithm | Time (lower is better) |
| ----------- | ------------ |
|  Bubble     |  0.001759 sec |
|  Selection  |  0.001008 sec |
|  Insertion  |  0.000768 sec |
|  Merge      |  0.000232 sec |
|  Comb       |  0.000080 sec |
|  Quicksort  |  0.000068 sec |

### 10,000 integers
| Algorithm | Time (lower is better) |
| ----------- | ------------ |
|  Bubble     |  0.199597 sec |
|  Selection  |  0.095312 sec |
|  Insertion  |  0.066165 sec |
|  Merge      |  0.002195 sec |
|  Comb       |  0.001312 sec |
|  Quicksort  |  0.000877 sec |

### 100,000 integers
| Algorithm | Time (lower is better) |
| ----------- | ------------ |
|  Bubble     | 22.427124 sec |
|  Selection  |  9.188108 sec |
|  Insertion  |  6.127985 sec |
|  Merge      |  0.031473 sec |
|  Comb       |  0.017001 sec |
|  Quicksort  |  0.011420 sec |