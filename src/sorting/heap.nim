# Heapifies subtree rooted at index i, where n is the size of the heap
proc heapify[T](a: var openArray[T], n, i: int) =
    var largest = i
    let left = 2 * i + 1
    let right = 2 * i + 2
    
    # See if left child of root exists and is greater than root 
    if left < n and a[i] < a[left]:
        largest = left

    # See if right child of root exists and is greater than root 
    if right < n and a[largest] < a[right]:
        largest = right

    if largest != i:
        swap a[i], a[largest]  # Change root, if needed
        heapify(a, n, largest) # Heapify the root

# The main function to sort an array of given size
proc heapSort*[T](a: var openArray[T]) =
    var n = a.len()

    # Build a maxheap
    for i in countdown(n, 0):
        heapify(a, n, i)
    
    # One by one extract elements
    for i in countdown(n - 1, 0):
        swap a[i], a[0]
        heapify(a, i, 0)    

when isMainModule:
    var a = [ 12, 11, 13, 5, 6, 7]
    a.heapSort()
    assert a == [5, 6, 7, 11, 12, 13]
