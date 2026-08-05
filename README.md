# 🖥️ 8086 Assembly Mini Projects

> *Four little programs, one old-school CPU, zero high-level luxuries.*

Welcome to my dive into **8086 Assembly** using **EMU8086**. No frameworks, no garbage collector, no `print()`; just registers, flags, and the raw satisfaction of making a 40-year-old architecture do something useful. If you've never written Assembly before: it's like cooking a five-course meal using only a lighter and a spoon. Painful at first, weirdly addictive once it clicks.

This repo contains **4 mini-projects**, each solving a real (if small) problem end to end in pure `.asm`.

---

## 📁 What's Inside

| # | Project | File | What it does |
|---|---------|------|---------------|
| 1 | 🎓 Student Result Calculator | `242_115_013_project1.asm` | Totals, averages, and grades a student's marks |
| 2 | ➗ Menu-Driven Calculator | `242_115_013_project2.asm` | A loop-driven CLI calculator (Add / Sub / Mul / Exit) |
| 3 | 🛒 Shopping / Billing System | `242_115_013_project3.asm` | A tiny POS system — pick items, checkout, get a bill |
| 4 | 🔐 Password Verification System | `242_115_013_project4.asm` | 3 attempts to guess the right digit, or you're locked out |

---

## 🎓 Project 1 — Student Result Calculator

Takes three hardcoded subject marks, does the math a calculator would do in your head, and prints a report card.

**Input (stored in memory):**
```
Mathematics   = 78
Physics       = 82
Programming   = 91
```

**Logic:**
1. `Total = Math + Physics + Programming`
2. `Average = Total / 3`
3. Grade is decided by comparing `Average` against thresholds:

| Average | Grade |
|---------|-------|
| ≥ 80 | A |
| ≥ 70 | B |
| ≥ 60 | C |
| < 60 | F |

**Sample Output:**
```
Student Result
Total Marks : 251
Average     : 83
Grade       : A
```

---

## ➗ Project 2 — Menu-Driven Calculator

A classic looping menu — the "Hello World" of interactive Assembly programs. Two numbers are predefined in memory, and the user just picks what to do with them.

```
SIMPLE CALCULATOR
1. Addition
2. Subtraction
3. Multiplication
4. Exit
```

Pick a number, get the result, and the menu **reappears** — because real programs don't quit after one operation. Choose `4` when you're done playing calculator.

---

## 🛒 Project 3 — Shopping / Billing System

The most "real-world" of the bunch — a mini point-of-sale system for a tiny grocery stand.

**Price List:**

| Item | Price (Tk) |
|------|-----------|
| 🍎 Apple | 40 |
| 🍊 Orange | 30 |
| 🥭 Mango | 60 |

```
SHOP MENU
1. Apple
2. Orange
3. Mango
4. Checkout
5. Exit
```

Every time you pick an item, its quantity ticks up by 1 and the running bill updates behind the scenes. Hit **Checkout** and it prints an itemized receipt:

```
Apple    Quantity : x
Orange   Quantity : x
Mango    Quantity : x
Total Bill        : xxx
```

Then it's back to the menu — because the shop doesn't close after one sale.

---

## 🔐 Project 4 — Password Verification System

Simple, strict, unforgiving — exactly how security should be.

- A single-digit password lives in memory.
- You get **3 attempts**. That's it.
- Get it right → `Access Granted`, program exits.
- Get it wrong → `Wrong Password`, and it tells you how many tries you have left.
- Burn through all 3 → `Access Denied`, and the door stays shut.

```
Enter Password: _
Wrong Password
Attempts Left: 2
```

---

## 🛠️ Tech Stack

- **Language:** 8086 Assembly (Intel syntax)
- **Emulator/IDE:** [EMU8086](http://www.emu8086.com/)
- **Core instructions used:** `MOV`, `ADD`, `SUB`, `MUL`, `CMP`, `JMP` family, `INT 21h` (DOS interrupts for I/O), loops via `LOOP` / conditional jumps

---

## ▶️ How to Run

1. Download and install **EMU8086**.
2. Open any `.asm` file from this repo in the EMU8086 editor.
3. Hit **Compile** (F5) then **Emulate / Run**.
4. Follow the on-screen prompts — type your menu choices or password digit and press Enter.

---

## 🧠 What I Actually Learned Building This

- How to move data between memory and registers without losing my mind
- Simulating "if/else" and "switch" logic purely with `CMP` + conditional jumps
- Building loops that behave like real menus instead of running once and dying
- Basic string/number output via DOS interrupts (`INT 21h`) — no `printf`, no mercy
- Appreciating every high-level language I've ever used, immediately after finishing this project

---

## 📌 Notes

- All input values (marks, prices, password) are **hardcoded in memory** per the project requirements — this isn't meant to take dynamic input beyond menu choices and the password digit.
- Each project is self-contained in its own `.asm` file, so you can compile and run them independently.

---

### 🏁 Final Word

Assembly doesn't hold your hand. Every register has a job, every flag matters, and there's no `try/catch` to bail you out. These four projects were built the hard way — one instruction at a time — and honestly? That's what made them fun.

*Built with `MOV`, `CMP`, patience, and mild caffeine dependency.*
