/*
-------------------------------------------------------
l04_t01.s
-------------------------------------------------------
Author:  Ashish Sharma
ID:      169044454
Email:   shar44454@mylaurier.ca
Date:    2024-03-02
-------------------------------------------------------
A version of list_sum.s to calculate the sum of all elements in an integer list.
r0: temp storage of value in list
r1: sum of all values in the list
r2: address of start of list
r3: address of end of list
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

ldr    r2, =Data    // Store address of start of list
ldr    r3, =_Data   // Store address of end of list
mov    r1, #0       // Initialize sum to 0

Loop:
ldr    r0, [r2], #4 // Read address with post-increment (r0 = *r2, r2 += 4)
add    r1, r1, r0   // Add the value to the sum
cmp    r3, r2       // Compare current address with end of list
bne    Loop         // If not at end, continue

_stop:
b _stop

.data
.align
Data:
.word   4, 5, -9, 0, 3, 0, 8, -7, 12    // The list of data
_Data: // End of list address

.end