proc bubbleSort*[T](a: var openArray[T]) =
    # nothing to do for arrays with less than 2 elements
    if a.len < 2:
        return

    for i in 0 ..< a.high:
        for j in 0 ..< a.high - i:
            if a[j] > a[j + 1]:
                swap(a[j], a[j + 1])
