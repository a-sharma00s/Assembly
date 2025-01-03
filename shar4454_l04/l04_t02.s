/*
-------------------------------------------------------
l04_t02.s
-------------------------------------------------------
Author:  Ashish Sharma
ID:      169044454
Email:   shar4454@mylaurier.ca
Date:    2024-03-02
-------------------------------------------------------
A version of list_demo.s to count the values in an integer list and 
display the count in r4, and display the number of bytes in 
the list in r5 without using a loop.
r2: address of start of list
r3: address of end of list
r4: count of values in the list
r5: number of bytes in the list
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

ldr    r2, =Data    // Store address of start of list
ldr    r3, =_Data   // Store address of end of list

// Calculate the number of bytes without using a loop
sub    r5, r3, r2   // r5 = End Address - Start Address

// Calculate the number of values in the list (assuming 4 bytes per value)
lsr    r4, r5, #2   // r4 = r5 / 4

_stop:
b _stop

.data
.align
Data:
.word   4, 5, -9, 0, 3, 0, 8, -7, 12    // The list of data
_Data: // End of list address

.end