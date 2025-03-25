import unittest
import arrayutils, std/options

type SomeEnum = enum seA, seB, seC

test "map":
  check [1, 3, 5].map(proc(x: int): string = $(2*x)) == ["2", "6", "10"]
  check [seA: 'f', seB: 'o', seC: 'o'].map(proc(x: char): string = "x"&x) == [seA: "xf", seB: "xo", seC: "xo"]

test "mapIt":
  check [4, 10].mapIt($it) == ["4", "10"]
  check [1: 4, 2: 10].mapIt($it) == [1: "4", 2: "10"]
  check ['a': 1, 'b': 2, 'c': 4].mapIt(it*2) == ['a': 2, 'b': 4, 'c': 8]
  check [seA: 'f', seB: 'o', seC: 'o'].mapIt("x"&it) == [seA: "xf", seB: "xo", seC: "xo"]

test "find":
  check [2: 4, 3: 6, 4: 5, 5: 1].find(5) == some(range[2..5](4))
  check [2: 4, 3: 6, 4: 5, 5: 1].find(2) == none(range[2..5])
  check ['a': 1, 'b': 2, 'c': 4].find(2) == some(range['a'..'c']('b'))

test "concat":
  check [1, 2, 3] & [4, 5] == [1, 2, 3, 4, 5]
  check 1 & [3, 3, 7] == [1, 3, 3, 7]
  check [1, 3, 2] & 6 == [1, 3, 2, 6]