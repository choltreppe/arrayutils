proc map*[I, A, B](arr: array[I, A], p: proc(x: A): B): array[I, B] =
  for i, x in arr:
    result[i] = p(x)

template mapIt*[I, T](arr: array[I, T], op: untyped): untyped =
  type O = typeof((var it {.inject.}: typeof(arr.items); op))
  var res: array[I, O]
  for i, it {.inject.} in cast[array[I, T]](arr):
    res[i] = op
  res