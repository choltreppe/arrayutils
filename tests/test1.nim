import unittest
import arrayutils

type SomeEnum = enum seA, seB, seC

test "map":
  check [1, 3, 5].map(proc(x: int): string = $(2*x)) == ["2", "6", "10"]
  check [seA: 'f', seB: 'o', seC: 'o'].map(proc(x: char): string = "x"&x) == [seA: "xf", seB: "xo", seC: "xo"]

test "mapIt":
  check [4, 10].mapIt($it) == ["4", "10"]
  check [1: 4, 2: 10].mapIt($it) == [1: "4", 2: "10"]
  check ['a': 1, 'b': 2, 'c': 4].mapIt(it*2) == ['a': 2, 'b': 4, 'c': 8]
  check [seA: 'f', seB: 'o', seC: 'o'].mapIt("x"&it) == [seA: "xf", seB: "xo", seC: "xo"]