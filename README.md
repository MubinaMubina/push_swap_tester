# 🧪 Push_Swap Tester

![License](https://img.shields.io/badge/license-MIT-green)
![Language](https://img.shields.io/badge/language-Bash-blue)
![Status](https://img.shields.io/badge/status-42%20Ready-success)
![Tests](https://img.shields.io/badge/tests-100%2B-orange)


Minimal automated testing suite for **push_swap**.

---

## 🚀 Quick Start

```bash
make
make test


🛠️ Test Commands :
make test          # full automated test suite
make test-verbose  # detailed output for every test
make test-quick    # fast basic tests
make valgrind      # Linux/WSL2 memory check
make leak           # macOS memory check


🧪 Manual Tests :
Operation Count:
ARG=$(python3 -c "import random; print(' '.join(map(str, random.sample(range(1000), 100))))")
./push_swap $ARG | wc -l

Error Handling :
./push_swap 1 1 2
./push_swap "1 a 3"
./push_swap 2147483648
Expected output:
Error


📊 42 Evaluation Rules :
100 numbers → < 700 operations
500 numbers → < 5500 operations
No memory leaks
Must print Error for invalid input


📋 Requirements :
Python3
Valgrind (Linux/WSL2) or leaks (macOS)


👩‍💻 Author :
Mubina
GitHub: https://github.com/MubinaMubina