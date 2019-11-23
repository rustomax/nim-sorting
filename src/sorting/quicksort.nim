proc partition[T](a: var openArray[T], low, high: int): int =
    var i = low - 1
    let pivot = a[high]
    for j in low .. high:
        if a[j] < pivot:
            inc i
            swap a[i], a[j]
    swap a[i + 1], a[high]
    return i + 1

proc sort[T](a: var openArray[T], low, high: int) =    
    if low < high:
        var pi = partition(a, low, high)
        sort(a, low, pi - 1)
        sort(a, pi + 1, high)

proc quickSort*[T](a: var openArray[T]) =
    sort(a, 0, a.high)
