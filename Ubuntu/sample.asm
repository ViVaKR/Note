1   ; (Section)
  1 ; All x86_64 Assembly files have three sections
  2 ; .data section : Defined before compilation
  3 ; .bss section  : For future use.
  4 ; .text section  : The Actual Code.
  5
  6 ; (Labels)
  7 ; - Upon compilation, the compiler will calculate the location in which the label will sit in memory
  8
  9 ; "Start" Label
 10 ; - The '_start' label is essential for all programs.
 11 ; If the linker cannot find '_start', it will throw an error.
 12
 13 ; "Global" Label
 14 ; - The word 'global is used when you want the linker to be able to know the address of
 15 ; some a label.
 16 ; - The object file generatied will contain a link to every label declared 'global'
 17 ; - In this case, we have to declare '_start' as blobal since it is required for
 18 ; the code to be properly linked.
 19
 20 ; (Flags)
 21 ; - Flags, like registers, hold data.
 22 ; - Flags only hold 1 bit each. They are either true or false.
 23 ; - Individual flags are part of a larger register
 24 ; - CF : Carry
 25 ; - PF : Parity
 26 ; - ZF : Zero
 27 ; - SF : Sign
 28 ; - OF : Overflow
 29 ; - AF : Adjust
 30 ; - IF ; Interrupt Enabled
 31
 32 ; (Pointers)
 33 ; - They hold its memory address (hold data).
 34 ; - rip (eip, ip) : Index pointer, Next Address to be executed in the control flow.
 35 ; - rsp (esp, sp) : Stack pointer, Points to the top address of the stack.
 36 ; - rbp (ebp, bp) : Stack base pointer, Points to the bottom of the stack.
 37
 38 ; (Control Flow)
 39 ; - All code runs from top to bottom by default.
 40 ; - The direction a program flows is called the control flow.
 41 ; - The 'rip' register holds the address of the next instruction(명령) to executed.
