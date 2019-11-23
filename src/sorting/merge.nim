proc mergeSort*[T](a: var openArray[T]) =
    if a.len > 1:
        # Divide the array in half
        let mid = a.len div 2
        var left = a[0 ..< mid]
        var right = a[mid .. a.high]

        # Sort the halves
        left.mergeSort()
        right.mergeSort()

        # Merge the halves
        var i, j, k = 0

        while i < left.len and j < right.len:
            if left[i] < right[j]:
                a[k] = left[i]
                inc i
            else:
                a[k] = right[j]
                inc j
            inc k

        for i in i .. left.high:
            a[k] = left[i]
            inc k

        for j in j .. right.high:
            a[k] = right[j]
            inc k
