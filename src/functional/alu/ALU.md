- Lets start with 8 operations below for a minimal ALU design,
this means we only have to have a 3 x 8 decoder and 3 bit opcodes
which is nice an lean
- Anything not initially implemented can be suported with microcodes
or sequencing

# logical ops
- AND [x]
- OR  [x]
- XOR [x]
- NOT [x]

# arithmetic
- ADD [x]
- SUB [x]
- INC
- DEC

# bit shift ops
- SHL [x]
- SHR [x]

# comparator ops
- GT    - A >  B => ~B Carry out is 0 meaning no borrow of A - B
- LT    - A <  B => B  Carry out is 1 meaning borrow of A - B
- EQ    - A =  B => Z  OR all outputs of A - B
- LTE   - A <= B => B + Z
- GTE   - A >= B => ~B + Z

# other needs that are not operation related
- Decoder (for opcodes)
