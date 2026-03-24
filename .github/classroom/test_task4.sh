#!/bin/bash
set -e

if [ -f task4.py ]; then
  python3 - <<'PY'
from task4 import get_bfs_order, FenwickTree

g = [
    [],
    [2, 3],
    [1, 4],
    [1],
    [2]
]

order = get_bfs_order(g, 1)
assert order[1] == 1
assert order[2] == 2
assert order[3] == 3
assert order[4] == 4

ft = FenwickTree(5)
ft.update(1, 5)
ft.update(2, 3)
ft.update(4, 10)

assert ft.prefix_sum(1) == 5
assert ft.prefix_sum(2) == 8
assert ft.prefix_sum(4) == 18

print("OK")
PY

elif [ -f task4.cpp ]; then
  cat > test_task4.cpp <<'CPP'
#include <cassert>
#include <vector>
#include <unordered_map>

#include "task4.cpp"

int main() {
    std::vector<std::vector<int>> g = {
        {},
        {2,3},
        {1,4},
        {1},
        {2}
    };

    auto order = get_bfs_order(g, 1);
    assert(order[1] == 1);
    assert(order[2] == 2);
    assert(order[3] == 3);
    assert(order[4] == 4);

    FenwickTree ft(5);
    ft.update(1, 5);
    ft.update(2, 3);
    ft.update(4, 10);

    assert(ft.prefix_sum(1) == 5);
    assert(ft.prefix_sum(2) == 8);
    assert(ft.prefix_sum(4) == 18);

    return 0;
}
CPP

  g++ -std=c++17 test_task4.cpp -o test_task4
  ./test_task4
  echo "OK"
else
  echo "task4.py or task4.cpp not found"
  exit 1
fi
