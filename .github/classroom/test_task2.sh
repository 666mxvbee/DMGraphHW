#!/bin/bash
set -e

if [ -f task2.py ]; then
  python3 - <<'PY'
from task2 import is_planar

path_graph = [[1], [0, 2], [1]]
assert is_planar(path_graph) == True

k5 = [
    [1, 2, 3, 4],
    [0, 2, 3, 4],
    [0, 1, 3, 4],
    [0, 1, 2, 4],
    [0, 1, 2, 3]
]
assert is_planar(k5) == False

k33 = [
    [3, 4, 5],
    [3, 4, 5],
    [3, 4, 5],
    [0, 1, 2],
    [0, 1, 2],
    [0, 1, 2]
]
assert is_planar(k33) == False

print("OK")
PY

elif [ -f task2.cpp ]; then
  cat > test_task2.cpp <<'CPP'
#include <cassert>
#include <vector>

#include "task2.cpp"

int main() {
    std::vector<std::vector<int>> path_graph = {{1}, {0,2}, {1}};
    assert(is_planar(path_graph) == true);

    std::vector<std::vector<int>> k5 = {
        {1,2,3,4},
        {0,2,3,4},
        {0,1,3,4},
        {0,1,2,4},
        {0,1,2,3}
    };
    assert(is_planar(k5) == false);

    std::vector<std::vector<int>> k33 = {
        {3,4,5},
        {3,4,5},
        {3,4,5},
        {0,1,2},
        {0,1,2},
        {0,1,2}
    };
    assert(is_planar(k33) == false);

    return 0;
}
CPP

  g++ -std=c++17 test_task2.cpp -o test_task2
  ./test_task2
  echo "OK"
else
  echo "task2.py or task2.cpp not found"
  exit 1
fi
