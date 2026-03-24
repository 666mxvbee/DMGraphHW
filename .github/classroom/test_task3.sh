#!/bin/bash
set -e

if [ -f task3.py ]; then
  python3 - <<'PY'
from task3 import is_satisfiable_2sat, solve_2sat

clauses1 = [(1, 2), (-1, 2)]
assert is_satisfiable_2sat(clauses1, 2) == True
ans1 = solve_2sat(clauses1, 2)
assert ans1 is not None
assert len(ans1) == 2

clauses2 = [(1, 1), (-1, -1)]
assert is_satisfiable_2sat(clauses2, 1) == False
ans2 = solve_2sat(clauses2, 1)
assert ans2 is None

clauses3 = [(1, 2), (-1, -2), (1, -2)]
assert is_satisfiable_2sat(clauses3, 2) == True
ans3 = solve_2sat(clauses3, 2)
assert ans3 is not None
assert len(ans3) == 2

print("OK")
PY

elif [ -f task3.cpp ]; then
  cat > test_task3.cpp <<'CPP'
#include <cassert>
#include <vector>
#include <utility>

#include "task3.cpp"

int main() {
    std::vector<std::pair<int,int>> clauses1 = {{1,2}, {-1,2}};
    assert(is_satisfiable_2sat(clauses1, 2) == true);
    auto ans1 = solve_2sat(clauses1, 2);
    assert(!ans1.empty());
    assert(ans1.size() == 2);

    std::vector<std::pair<int,int>> clauses2 = {{1,1}, {-1,-1}};
    assert(is_satisfiable_2sat(clauses2, 1) == false);
    auto ans2 = solve_2sat(clauses2, 1);
    assert(ans2.empty());

    std::vector<std::pair<int,int>> clauses3 = {{1,2}, {-1,-2}, {1,-2}};
    assert(is_satisfiable_2sat(clauses3, 2) == true);
    auto ans3 = solve_2sat(clauses3, 2);
    assert(!ans3.empty());
    assert(ans3.size() == 2);

    return 0;
}
CPP

  g++ -std=c++17 test_task3.cpp -o test_task3
  ./test_task3
  echo "OK"
else
  echo "task3.py or task3.cpp not found"
  exit 1
fi
