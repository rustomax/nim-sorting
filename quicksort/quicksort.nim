proc partition[T](a: var openArray[T], low, high: int): int =
    var i = low - 1
    let pivot = a[high]
    for j in low .. high:
        if a[j] < pivot:
            inc i
            swap a[i], a[j]
    swap a[i + 1], a[high]
    return i + 1

proc quickSort[T](a: var openArray[T], low, high: int) =    
    if low < high:
        var pi = partition(a, low, high)
        quickSort(a, low, pi - 1)
        quickSort(a, pi + 1, high)

proc sort*[T](a: var openArray[T]) =
    quickSort(a, 0, a.high)

when isMainModule:
    var a = @[10, 4, 5, 7, 3, 0, -10, 6]
    echo a
    a.sort()
    echo a