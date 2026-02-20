# 🧪 Push_Swap Tester

ONLY FOR LINUX

![License](https://img.shields.io/badge/license-MIT-green)
![Language](https://img.shields.io/badge/language-Bash-blue)
![Status](https://img.shields.io/badge/status-42%20Ready-success)
![Tests](https://img.shields.io/badge/tests-100%2B-orange)


## Minimal automated testing suite for **push_swap**.

```text

📂 Where to Place the Tester Script (.sh):
After cloning this tester repository, you must place the tester script in the **same directory as your `push_swap` executable**.

Example folder structure:

push_swap/
│
├── push_swap        # your compiled program
├── Makefile
├── test_enhanced.sh # copy tester here
└── src/

How to Copy the Script:
git clone https://github.com/MubinaMubina/push_swap_tester.git
cp push_swap_tester/test_enhanced.sh .
chmod +x test_enhanced.sh

---


## 🚀 Quick Start

Now you can run:
./test_enhanced.sh

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