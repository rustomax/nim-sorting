proc sort*[T](a: var openArray[T]) =
    var gap = a.len
    var swaps = true

    while gap > 1 or swaps:
        gap = max(1, gap * 100 div 125)
        swaps = false
        for i in 0 .. a.high - gap:
            let j = i + gap
            if a[i] > a[j]:
                swap(a[i], a[j])
                swaps = true
