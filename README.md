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
  Bubble     :  0.001628 sec
  Selection  :  0.001293 sec
  Insertion  :  0.001357 sec
  Merge      :  0.000345 sec
  Heap       :  0.000211 sec
  Comb       :  0.000084 sec
  Quicksort  :  0.000072 sec

Benchmarking sorting algorithms with 10000 integers
  Bubble     :  0.207325 sec
  Selection  :  0.098015 sec
  Insertion  :  0.066177 sec
  Merge      :  0.002245 sec
  Heap       :  0.001876 sec
  Comb       :  0.001506 sec
  Quicksort  :  0.001338 sec

Benchmarking sorting algorithms with 100000 integers
  Bubble     : 22.345801 sec
  Selection  :  9.118128 sec
  Insertion  :  6.093889 sec
  Merge      :  0.027296 sec
  Heap       :  0.027507 sec
  Comb       :  0.020545 sec
  Quicksort  :  0.011738 sec
```

### Playing with compile-time switches

```text
CPP: cpp
RELEASE: -d:release
DANGER: -d:danger
LTO: -d:lto
NRT: --newruntime

Benchmarking Quicksort with 100000 integers

C RELEASE NRT      : 0.011169 sec -> 100%
C RELEASE LTO      : 0.010939 sec
C RELEASE          : 0.010693 sec
CPP RELEASE        : 0.008718 sec

C DANGER NRT       : 0.006382 sec
CPP DANGER NRT     : 0.006336 sec
CPP DANGER         : 0.006275 sec
C DANGER           : 0.006166 sec
CPP DANGER NRT LTO : 0.006151 sec -> 45% improvement vs C RELEASE NRT
```