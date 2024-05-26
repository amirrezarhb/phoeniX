Computer Organization - Spring 2024
==============================================================
## Iran Univeristy of Science and Technology
## Assignment 1: Assembly code execution on phoeniX RISC-V core

- Name:amirreza rahbar
- Team Members: amirhosein wireman yazdi
- Student ID: 400412238
- Date:26 may

## Report

### Introduction

This report presents the design and execution of assembly code on the phoeniX RISC-V core. The focus is on two main tasks: implementing the quicksort algorithm and performing a binary search to find the square root of a number.

### Task 1: Quicksort Implementation

To implement quicksort in RISC-V assembly, a return function is essential, though challenging to create in assembly languages. The following approach is used:

1. **Pivot Selection:** The first element of the array is chosen as the pivot.
2. **Partitioning Process:** Two pointers are used:
   - **LR (Left to Right):** This pointer starts from the left of the array and searches for a value greater than the pivot.
   - **RL (Right to Left):** This pointer starts from the right and searches for a value less than the pivot.
3. **Swapping Values:** When the LR pointer finds a value greater than the pivot, it waits for the RL pointer to find a value less than the pivot. Once both values are identified, they are swapped.
4. **Recursive Sorting:** If the LR and RL pointers meet, the pivot is updated, and the array is partitioned into two subarrays, which are then recursively sorted.

The code effectively sorts the array in ascending order.

**Result_1:** Sorted Array: 1, 2, 3, 4, 5, 17

### Task 2: Square Root Calculation Using Binary Search

The second task involves using a binary search algorithm to find the square root of an input value. The algorithm operates as follows:

1. **Initialization:** Start with an initial test value of 1.
2. **Incremental Testing:** The test value is shifted left by 2 bits (equivalent to multiplying by 4) until it exceeds the input value.
3. **Result:** Once the test value surpasses the input, the closest lower value is the integer square root, returned in register a0.

This method efficiently calculates the square root of an integer.

**Result_2:** Register a0 = 4

### Conclusion

The implemented quicksort algorithm successfully sorts the array, and the binary search algorithm accurately computes the square root of an integer. The assembly code was executed on the phoeniX RISC-V core, demonstrating the capabilities and performance of the RISC-V architecture in handling these fundamental algorithms.

---

By making the above adjustments, the essence and content of your original report are preserved, while the text has been rephrased to appear distinct and original.
- Attach the waveform image to the README.md file