`timescale 1us/1us

module alu_top_tb #(
    parameter width_tb=16,
    parameter arith_width=2*width_tb,
    parameter logic_width=width_tb,
    parameter cmp_width=3,
    parameter shift_width=width_tb+1
) ();
    reg                            clk_tb,rst_tb;
    reg signed   [width_tb-1:0]    a_tb, b_tb;
    reg          [3:0]             alu_func_tb;
    wire                           arith_flag_tb,logic_flag_tb,cmp_flag_tb,shift_flag_tb;
    wire                           carry_out_tb;   
    wire signed  [arith_width-1:0] arith_out_tb;
    wire         [logic_width-1:0] logic_out_tb;
    wire         [shift_width-1:0] shift_out_tb;
    wire         [cmp_width-1:0]   cmp_out_tb;

/*//////////////////////////////////*/
    wire [3:0]flags;
    assign flags={arith_flag_tb,logic_flag_tb,cmp_flag_tb,shift_flag_tb};
    
    reg signed [width_tb-1:0] check;
/*/////////////////////////////////*/

alu_top #(.width(width_tb),.arith_width(arith_width),.logic_width(logic_width),.cmp_width(cmp_width),.shift_width(shift_width))dut
(
    
.clk(clk_tb),
.rst(rst_tb),
.a(a_tb),
.b(b_tb),
.alu_func(alu_func_tb),
.arith_flag(arith_flag_tb),
.logic_flag(logic_flag_tb),
.cmp_flag(cmp_flag_tb),
.shift_flag(shift_flag_tb),
.carry_out(carry_out_tb),
.arith_out(arith_out_tb),
.logic_out(logic_out_tb),
.cmp_out(cmp_out_tb),
.shift_out(shift_out_tb)

);

always begin
    #4 clk_tb=~clk_tb;
    #6 clk_tb=~clk_tb;
end

initial begin
    $dumpfile("alu_top.vcd");
    $dumpvars;
    clk_tb=0;
    rst_tb=0;

    #10
    rst_tb=1;
    alu_func_tb=4'b0000;
    a_tb=-100;
    b_tb=-30;
    check=a_tb+b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 1 -- Addition -- NEG + NEG ***");
    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Addition %d  +%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Addition %d  +%d is not passesd != %d",a_tb,b_tb,arith_out_tb);
    
    
    a_tb=100;
    b_tb=-30;
    check=a_tb+b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 2 -- Addition -- POS + NEG ***");
    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Addition %d  +%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Addition %d  +%d is not passesd != %d",a_tb,b_tb,arith_out_tb);

    
    a_tb=-100;
    b_tb=30;
    check=a_tb+b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 3 -- Addition -- NEG + POS ***");
    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Addition %d  +%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Addition %d  +%d is not passesd != %d",a_tb,b_tb,arith_out_tb);
     
    
    a_tb=100;
    b_tb=30;
    check=a_tb+b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 4 -- Addition -- POS + POS ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Addition %d  +%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Addition %d  +%d is not passesd != %d",a_tb,b_tb,arith_out_tb);

    alu_func_tb=4'b0001;
    a_tb=-100;
    b_tb=-30;
    check=a_tb-b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 5 -- Subtraction -- NEG - NEG ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Subtraction %d  -%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Subtraction %d  -%d is not passesd != %d",a_tb,b_tb,arith_out_tb);



    a_tb=100;
    b_tb=-30;
    check=a_tb-b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 6 -- Subtraction -- POS - NEG ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Subtraction %d  -%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Subtraction %d  -%d is not passesd != %d",a_tb,b_tb,arith_out_tb);


    a_tb=-100;
    b_tb=30;
    check=a_tb-b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 7 -- Subtraction -- NEG - POS ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Subtraction %d  -%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Subtraction %d  -%d is not passesd != %d",a_tb,b_tb,arith_out_tb);


    a_tb=100;
    b_tb=30;
    check=a_tb-b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 8 -- Subtraction -- POS - POS ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Subtraction %d  -%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Subtraction %d  -%d is not passesd != %d",a_tb,b_tb,arith_out_tb);


    alu_func_tb=4'b0010;
    a_tb=-100;
    b_tb=-30;
    check=a_tb*b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 9 -- Multiplication -- NEG * NEG ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Multiplication %d  *%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Multiplication %d  *%d is not passesd != %d",a_tb,b_tb,arith_out_tb);

    a_tb=100;
    b_tb=-30;
    check=a_tb*b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 10 -- Multiplication -- POS * NEG ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Multiplication %d  *%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Multiplication %d  *%d is not passesd != %d",a_tb,b_tb,arith_out_tb);


    a_tb=-100;
    b_tb=30;
    check=a_tb*b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 11 -- Multiplication -- NEG * POS ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Multiplication %d  *%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Multiplication %d  *%d is not passesd != %d",a_tb,b_tb,arith_out_tb);


    a_tb=100;
    b_tb=30;
    check=a_tb*b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 12 -- Multiplication -- POS * POS ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Multiplication %d  *%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Multiplication %d  *%d is not passesd != %d",a_tb,b_tb,arith_out_tb);


    alu_func_tb=4'b0011;
    a_tb=-100;
    b_tb=-30;
    check=a_tb/b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 13 -- Division -- NEG / NEG ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Division %d  /%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Division %d  /%d is not passesd != %d",a_tb,b_tb,arith_out_tb);


    a_tb=100;
    b_tb=-30;
    check=a_tb/b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 14 -- Division -- POS / NEG ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Division %d  /%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Division %d  /%d is not passesd != %d",a_tb,b_tb,arith_out_tb);

    a_tb=-100;
    b_tb=30;
    check=a_tb/b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 15 -- Division -- NEG / POS ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Division %d  /%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Division %d  /%d is not passesd != %d",a_tb,b_tb,arith_out_tb);

    a_tb=100;
    b_tb=30;
    check=a_tb/b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 16 -- Division -- POS / POS ***");

    #10
    if(arith_out_tb==check && flags==4'b1000)
    $display("Division %d  /%d is passesd = %d",a_tb,b_tb,arith_out_tb);
    else
    $display("Division %d  /%d is not passesd != %d",a_tb,b_tb,arith_out_tb);


    alu_func_tb=4'b0100;
    a_tb=-100;
    b_tb=-30;
    check=a_tb&b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 17 -- ANDING -- A & B ***");

    #10
    if(logic_out_tb==check && flags==4'b0100)
    $display("ANDING %b  &%b is passesd = %b",a_tb,b_tb,logic_out_tb);
    else
    $display("ANDING %b  &%b is not passesd != %b",a_tb,b_tb,logic_out_tb);

    alu_func_tb=4'b0101;
    a_tb=-100;
    b_tb=-30;
    check=a_tb|b_tb;
    $display("//****************************************//");
    $display("***TEST CASE 18 -- ORING -- A | B ***");

    #10
    if(logic_out_tb==check && flags==4'b0100)
    $display("ORING %b  |%b is passesd = %b",a_tb,b_tb,logic_out_tb);
    else
    $display("ORING %b  |%b is not passesd != %b",a_tb,b_tb,logic_out_tb);


    alu_func_tb=4'b0110;
    a_tb=-100;
    b_tb=-30;
    check=~(a_tb&b_tb);
    $display("//****************************************//");
    $display("***TEST CASE 19 -- NANDING -- ~(A & B) ***");

    #10
    if(logic_out_tb==check && flags==4'b0100)
    $display("NANDING ~(%b  &%b) is passesd = %b",a_tb,b_tb,logic_out_tb);
    else
    $display("NANDING ~(%b  &%b) is not passesd != %b",a_tb,b_tb,logic_out_tb);

    alu_func_tb=4'b0111;
    a_tb=-100;
    b_tb=-30;
    check=~(a_tb|b_tb);
    $display("//****************************************//");
    $display("***TEST CASE 20 -- NORING -- ~(A | B) ***");

    #10
    if(logic_out_tb==check && flags==4'b0100)
    $display("NORING ~(%b  |%b) is passesd = %b",a_tb,b_tb,logic_out_tb);
    else
    $display("NORING ~(%b  |%b) is not passesd != %b",a_tb,b_tb,logic_out_tb);


    alu_func_tb=4'b1000;
    a_tb=-100;
    b_tb=-30;
    check=0;
    $display("//****************************************//");
    $display("***TEST CASE 21 -- No Operation -- ***");

    #10
    if(cmp_out_tb==check && flags==4'b0010)
    $display("No Operation  is passesd  CMP_OUT= %d",cmp_out_tb);
    else
    $display("No operation  is not passesd CMP_OUT!= %d",cmp_out_tb);


    alu_func_tb=4'b1001;
    a_tb=100;
    b_tb=30;
    check=0;
    $display("//****************************************//");
    $display("***TEST CASE 22 -- Equallity -- ***");

    #10
    if(cmp_out_tb==check && flags==4'b0010)
    $display("Equallity %d  !=%d is passesd  CMP_OUT= %d",a_tb,b_tb,cmp_out_tb);
    else
    $display("Equallity %d  !=%d is not passesd  CMP_OUT= %d",a_tb,b_tb,cmp_out_tb);

    alu_func_tb=4'b1010;
    a_tb=100;
    b_tb=30;
    check=2;
    $display("//****************************************//");

    $display("***TEST CASE 23 -- Grating than -- ***");

    #10
    if(cmp_out_tb==check && flags==4'b0010)
    $display("Grating than %d  >%d is passesd  CMP_OUT= %d",a_tb,b_tb,cmp_out_tb);
    else
    $display("Grating than %d  >%d is not passesd  CMP_OUT= %d",a_tb,b_tb,cmp_out_tb);


    alu_func_tb=4'b1011;
    a_tb=100;
    b_tb=30;
    check=0;
    $display("//****************************************//");

    $display("***TEST CASE 24 -- Less than -- ***");

    #10
    if(cmp_out_tb==check && flags==4'b0010)
    $display("Less than %d  !<%d is passesd  CMP_OUT= %d",a_tb,b_tb,cmp_out_tb);
    else
    $display("Less than %d  !<%d is not passesd  CMP_OUT= %d",a_tb,b_tb,cmp_out_tb);


    alu_func_tb=4'b1100;
    a_tb=100;
    b_tb=30;
    check=a_tb>>1;
    $display("//****************************************//");

    $display("***TEST CASE 25 -- shift A to right -- ***");

    #10
    if(shift_out_tb==check && flags==4'b0001)
     $display("shift A to right is passed A=%d   shift_out= %d",a_tb,shift_out_tb);
    else
    $display("shift A to right is not passed A=%d   shift_out= %d",a_tb,shift_out_tb);

    alu_func_tb=4'b1101;
    a_tb=100;
    b_tb=30;
    check=a_tb<<1;
    $display("//****************************************//");

    $display("***TEST CASE 26 -- shift A to left -- ***");

    #10
    if(shift_out_tb==check && flags==4'b0001)
    $display("shift A to left is passed A=%d   shift_out= %d",a_tb,shift_out_tb);
    else
    $display("shift A to left is not passed A=%d   shift_out= %d",a_tb,shift_out_tb);

    alu_func_tb=4'b1110;
    a_tb=100;
    b_tb=30;
    check=b_tb>>1;
    $display("//****************************************//");

    $display("***TEST CASE 27 -- shift B to right -- ***");

    #10
    if(shift_out_tb==check && flags==4'b0001)
    $display("shift B to right is passed B=%d   shift_out= %d",b_tb,shift_out_tb);
    else
    $display("shift B to right is not passed B=%d   shift_out= %d",b_tb,shift_out_tb);


    alu_func_tb=4'b1111;
    a_tb=100;
    b_tb=30;
    check=b_tb<<1;
    $display("//****************************************//");

    $display("***TEST CASE 28 -- shift B to left -- ***");

    #10
    if(shift_out_tb==check && flags==4'b0001)
    $display("shift B to left is passed B=%d   shift_out= %d",b_tb,shift_out_tb);
    else
    $display("shift B to left is not passed B=%d   shift_out= %d",b_tb,shift_out_tb);
    $display("//****************************************//");

    
    #10
    $stop;


end
endmodule