#!/bin/bash
set -e

if [ -f task1.py ]; then
  python3 - <<'PY'
from task1 import is_isomorphic

g1 = [[1], [0, 2], [1]]
g2 = [[1], [0, 2], [1]]
assert is_isomorphic(g1, g2) == True

g3 = [[1], [0]]
g4 = [[1], [0, 2], [1]]
assert is_isomorphic(g3, g4) == False

triangle1 = [[1, 2], [0, 2], [0, 1]]
triangle2 = [[2, 1], [2, 0], [1, 0]]
assert is_isomorphic(triangle1, triangle2) == True

print("OK")
PY

elif [ -f task1.cpp ]; then
  cat > test_task1.cpp <<'CPP'
#include <cassert>
#include <vector>

#include "task1.cpp"

int main() {
    std::vector<std::vector<int>> g1 = {{1}, {0,2}, {1}};
    std::vector<std::vector<int>> g2 = {{1}, {0,2}, {1}};
    assert(is_isomorphic(g1, g2) == true);

    std::vector<std::vector<int>> g3 = {{1}, {0}};
    std::vector<std::vector<int>> g4 = {{1}, {0,2}, {1}};
    assert(is_isomorphic(g3, g4) == false);

    std::vector<std::vector<int>> triangle1 = {{1,2}, {0,2}, {0,1}};
    std::vector<std::vector<int>> triangle2 = {{2,1}, {2,0}, {1,0}};
    assert(is_isomorphic(triangle1, triangle2) == true);

    return 0;
}
CPP

  g++ -std=c++17 test_task1.cpp -o test_task1
  ./test_task1
  echo "OK"
else
  echo "task1.py or task1.cpp not found"
  exit 1
fi
