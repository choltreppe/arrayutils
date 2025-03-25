import std/options

proc map*[I, A, B](arr: array[I, A], p: proc(x: A): B): array[I, B] =
  for i, x in arr:
    result[i] = p(x)

template mapIt*[I, T](arr: array[I, T], op: untyped): untyped =
  type O = typeof((var it {.inject.}: typeof(arr.items); op))
  var res: array[I, O]
  for i, it {.inject.} in cast[array[I, T]](arr):
    res[i] = op
  res

proc find*[I, T](arr: array[I, T], needle: T): Option[I] =
  for i, x in arr:
    if x == needle:
      return some(i)

func `&`*[IX, IY: static int, T](x: array[IX, T], y: array[IY, T]): array[IX + IY, T] =
  for i in 0 ..< IX:
    result[i] = x[i]
  for i in 0 ..< IY:
    result[i+IX] = y[i]

func `&`*[I: static int, T](x: array[I, T], y: T): array[I+1, T] =
  for i in 0 ..< I:
    result[i] = x[i]
  result[I] = y

func `&`*[I: static int, T](x: T, y: array[I, T]): array[I+1, T] =
  result[0] = x
  for i in 0 ..< I:
    result[i+1] = y[i]

func `[]`*[I, T](arr: array[I, T], S: static Slice[int]): array[S.a..S.b, T] =
  for i in S:
    result[i-S.a] = arr[i]