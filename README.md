# nim-sorting
A collection of sorting algorithms in Nim

## Install

```sh
nimble install https://github.com/rustomax/nim-sorting
```

## Usage
```nim
# Example of sorting students by their GPA

import sorting/quickSort

type
    Student = object
      name: string
      gpa: float

proc `<`*(a, b: Student): bool {.inline.} =
    return a.gpa < b.gpa

var students: array[4, Student] = [Student(name: "Bob", gpa: 4.2),
                                   Student(name: "Diana", gpa: 4.9),
                                   Student(name: "Julie", gpa: 3.7),
                                   Student(name: "Max", gpa: 2.6)]

students.quickSort()

assert students == [Student(name: "Max", gpa: 2.6),
                    Student(name: "Julie", gpa: 3.7),
                    Student(name: "Bob", gpa: 4.2),
                    Student(name: "Diana", gpa: 4.9)]
```


## Run tests suite
```sh
nimble test
```

## Run benchmark suite
```sh
nimble benchmark
```

### Sample performance comparison
```txt
Benchmarking sorting algorithms with 1000 integers
  Bubble     :  0.001661 sec
  Selection  :  0.000958 sec
  Insertion  :  0.000728 sec
  Merge      :  0.000229 sec
  Comb       :  0.000082 sec
  Quicksort  :  0.000071 sec

Benchmarking sorting algorithms with 10000 integers
  Bubble     :  0.201240 sec
  Selection  :  0.095286 sec
  Insertion  :  0.069481 sec
  Merge      :  0.002582 sec
  Comb       :  0.001390 sec
  Quicksort  :  0.001075 sec

Benchmarking sorting algorithms with 100000 integers
  Bubble     : 22.671496 sec
  Selection  :  9.484583 sec
  Insertion  :  6.305446 sec
  Merge      :  0.031115 sec
  Comb       :  0.015273 sec
  Quicksort  :  0.010733 sec
```

### Notice effect of compile-time switches
```text
-d:release
  Quicksort  :  0.000069 sec
  Quicksort  :  0.000885 sec
  Quicksort  :  0.011673 sec
  Quicksort  :  0.134086 sec -> 100%

-d:danger
  Quicksort  :  0.000042 sec
  Quicksort  :  0.000510 sec
  Quicksort  :  0.006424 sec
  Quicksort  :  0.076204 sec -> 43% improvement vs release build for large arrays
```