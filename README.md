Introduction:-
ALU_TOP is the fundamental building block of the processor, 
which is responsible for carrying out different functions: -
- Signed Arithmetic functions through ARITHMETIC_UNIT block.
- Logic functions through LOGIC_UNIT block.
- Shift functions through SHIFT _UNIT block.
- Comparison functions through CMP_UNIT block. 
And Decoder Unit responsibles for enable which Function to operate 
according to the highest Most significant 2-bit of the ALU_FUNC control 
bus ALU_FUNC [3:2].

Specifications:-
- All Outputs are registered. 
- All registers are cleared using Asynchronous active low reset.
- Arith_flag is activated "High" only when ALU performs one of 
the arithmetic operations (Signed Addition, Signed Subtraction, 
Signed Multiplication, Signed Division), otherwise "LOW".
- Logic_flag is activated "High" only when ALU performs one of 
the Boolean operations (AND, OR, NAND, NOR), otherwise 
"LOW".
- CMP_flag is activated "High" only when ALU performs one of 
the Comparison operations (Equal, Greater than, less than) or 
NOP, otherwise "LOW".
- Shift_flag is activated "High" only when ALU performs one of 
the shifting operations (shift right, shift left), otherwise "LOW".


