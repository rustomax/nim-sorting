import unittest
import selection

suite "Selection Sort":
    test "sort sequence of int":
        var a = @[4, 5, 1, 2, 8, 3]
        a.sort()
        check a == @[1, 2, 3, 4, 5, 8]

    test "sort sequence of uint64":
        var a = @[4u64, 5, 1, 2, 8, 3]
        a.sort()
        check a == @[1u64, 2, 3, 4, 5, 8]
    
    test "handle empty sequence":
        var a: seq[int]
        a.sort()
        check a == newSeq[int]()

    test "handle sequence with one element":
        var a = @[5]
        a.sort()
        check a == @[5]

    test "handle sequence with two elements":
        var a = @[5, 3]
        a.sort()
        check a == @[3, 5]

    test "handle 0 and negative numbers":
        var a = @[6, -10, 0, 3, 4, -3]
        a.sort()
        check a == @[-10, -3, 0, 3, 4, 6]

    test "handle duplicates":
        var a = @[6, -10, 0, 3, 4, -3, -10, 3]
        a.sort()
        check a == @[-10, -10, -3, 0, 3, 3, 4, 6]

    test "sort an array of strings":
        var names = ["Max", "Bob", "Julie", "Diana"]
        names.sort()
        check names == ["Bob", "Diana", "Julie", "Max"]
