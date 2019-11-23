proc selectionSort*[T](a: var openArray[T]) =
    # nothing to do for arrays with less than 2 elements
    if a.len < 2:
        return

    for i in 0 .. a.high:
        var min_val = a[i]
        var min_idx = i
        for j in i + 1 .. a.high:
            if a[j] < min_val:
                min_val = a[j]
                min_idx = j
        if min_idx != i:
            swap(a[min_idx], a[i])
