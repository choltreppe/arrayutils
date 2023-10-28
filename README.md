## `map` proc

```nim

echo [1, 3, 5].map do (x: int) -> string: $(2*x)

# works with any index type
echo ['a': 1, 'b': 3, 'c': 5].map do (x: int) -> string: $(2*x)

```

## `mapIt` template

```nim
echo [1, 3, 5].mapIt($(2*it))
echo ['a': 1, 'b': 3, 'c': 5].mapIt($(2*it))
```
