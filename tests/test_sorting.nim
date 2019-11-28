# To run these tests, execute `nimble test`.

import unittest

import sorting/bubble
import sorting/comb
import sorting/insertion
import sorting/merge
import sorting/quicksort
import sorting/selection
import sorting/heap

type
    Student = object
      name: string
      gpa: float

proc `<`*(a, b: Student): bool {.inline.} =
    a.gpa < b.gpa

template testSuite(suiteName: string, fn: untyped) =
    suite suiteName:
        test "sort sequence of int":
            var a = @[4, 5, 1, 2, 8, 3]
            a.fn()
            check a == @[1, 2, 3, 4, 5, 8]

        test "sort sequence of uint64":
            var a = @[4u64, 5, 1, 2, 8, 3]
            a.fn()
            check a == @[1u64, 2, 3, 4, 5, 8]
    
        test "handle empty sequence":
            var a: seq[int]
            a.fn()
            check a == newSeq[int]()

        test "handle sequence with one element":
            var a = @[5]
            a.fn()
            check a == @[5]

        test "handle sequence with two elements":
            var a = @[5, 3]
            a.fn()
            check a == @[3, 5]

        test "handle 0 and negative numbers":
            var a = @[6, -10, 0, 3, 4, -3]
            a.fn()
            check a == @[-10, -3, 0, 3, 4, 6]

        test "handle duplicates":
            var a = @[6, -10, 0, 3, 4, -3, -10, 3]
            a.fn()
            check a == @[-10, -10, -3, 0, 3, 3, 4, 6]

        test "sort an array of strings":
            var names = ["Max", "Bob", "Julie", "Diana"]
            names.fn()
            check names == ["Bob", "Diana", "Julie", "Max"]

        test "sort array of objects with a custom comparator":
            var students: array[4, Student]
            students[0] = Student(name: "Bob", gpa: 4.2)
            students[1] = Student(name: "Diana", gpa: 4.9)
            students[2] = Student(name: "Julie", gpa: 3.7)
            students[3] = Student(name: "Max", gpa: 2.6)
            students.fn()

            check students == [Student(name: "Max", gpa: 2.6),
                               Student(name: "Julie", gpa: 3.7),
                               Student(name: "Bob", gpa: 4.2),
                               Student(name: "Diana", gpa: 4.9)]

proc main() =
    testSuite("Bubble Sort", bubbleSort)
    testSuite("Comb Sort", combSort)
    testSuite("Insertion Sort", insertionSort)
    testSuite("Merge Sort", mergeSort)
    testSuite("Quick Sort", quickSort)
    testSuite("Selection Sort", selectionSort)
    testSuite("Heap Sort", heapSort)

main()