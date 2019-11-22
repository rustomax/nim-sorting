proc sort*[T](a: var openArray[T]) =
    # nothing to do for arrays with less than 2 elements
    if a.len < 2:
        return

    for i in 1 .. a.high:
        let element = a[i]
        var j = i - 1
        while j >= 0 and a[j] > element:
            a[j + 1] = a[j]
            dec j
        a[j + 1] = element
