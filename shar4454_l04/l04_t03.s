/*
-------------------------------------------------------
l04_t03.s
-------------------------------------------------------
Author:  Ashish Sharma
ID:      169044454
Email:   shar4454@mylaurier.ca
Date:    2024-03-02
-------------------------------------------------------
A version of list_demo.s to calculate the minimum and maximum values in an 
integer list.
r0: temp storage of value in list
r2: address of start of list
r3: address of end of list
r6: minimum value in the list
r7: maximum value in the list
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

ldr    r2, =Data    // Store address of start of list
ldr    r3, =_Data   // Store address of end of list

// Initialize minimum and maximum values to the first value in the list
ldr    r6, [r2]      // Minimum value
ldr    r7, [r2]      // Maximum value

Loop:
ldr    r0, [r2], #4 // Read address with post-increment (r0 = *r2, r2 += 4)

// Compare current value with current minimum value
cmp    r0, r6
movlt  r6, r0        // If r0 < r6, update r6 with r0

// Compare current value with current maximum value
cmp    r0, r7
movgt  r7, r0        // If r0 > r7, update r7 with r0

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