module alu_top #(
    parameter width=16,
    parameter arith_width=2*width,
    parameter logic_width=width,
    parameter cmp_width=3,
    parameter shift_width=width+1
) (
    input  wire                          clk,rst,
    input  wire        [width-1:0]       a,b,
    input  wire        [3:0]             alu_func,
    output wire                          arith_flag,logic_flag,cmp_flag,shift_flag,
    output wire                          carry_out,
    output wire        [arith_width-1:0] arith_out,
    output wire        [logic_width-1:0] logic_out,
    output wire        [shift_width-1:0] shift_out,
    output wire        [cmp_width-1:0]   cmp_out
); 
 
wire arith_enable_wire,logic_enable_wire,cmp_enable_wire,shift_enable_wire;

decoder Decoder
(
 .alu_func_decoder(alu_func[3:2]),
 .arith_enable(arith_enable_wire),
 .logic_enable(logic_enable_wire),
 .cmp_enable(cmp_enable_wire),
 .shift_enable(shift_enable_wire)

);

arith_unit #(.in_width(width),.out_width(arith_width)) ARITHMETIC_UNIT
(.a(a),
.b(b),
.clk(clk),
.rst(rst),
.alu_func_arith(alu_func[1:0]),
.arith_enable(arith_enable_wire),
.carry_out(carry_out),
.arith_flag(arith_flag),
.arith_out(arith_out)
);

logic_unit #(.in_width(width),.out_width(logic_width)) LOGIC_UNIT
(.a(a),
.b(b),
.clk(clk),
.rst(rst),
.alu_func_logic(alu_func[1:0]),
.logic_enable(logic_enable_wire),
.logic_flag(logic_flag),
.logic_out(logic_out)
);

cmp_unit #(.in_width(width),.cmp_width(cmp_width)) CMP_UNIT
(.a(a),
.b(b),
.clk(clk),
.rst(rst),
.alu_func_cmp(alu_func[1:0]),
.cmp_enable(cmp_enable_wire),
.cmp_flag(cmp_flag),
.cmp_out(cmp_out)
);

shift_unit #(.in_width(width),.out_width(shift_width)) SHIFT_UNIT
(.a(a),
.b(b),
.clk(clk),
.rst(rst),
.alu_func_shift(alu_func[1:0]),
.shift_enable(shift_enable_wire),
.shift_flag(shift_flag),
.shift_out(shift_out)
);


endmodule