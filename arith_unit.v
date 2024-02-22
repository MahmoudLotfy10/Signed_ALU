module arith_unit #(
    parameter in_width=4,
    parameter out_width=16
) (
    input wire signed [in_width-1:0]   a,b,
    input wire                         arith_enable,
    input wire         [1:0]           alu_func_arith,
    input wire                         clk,rst,
    output reg                         carry_out,
    output reg                         arith_flag,
    output reg signed [out_width-1:0]  arith_out
    
);
    reg carry_out_comp,arith_flag_comp;
    reg [out_width-1:0] arith_out_comp;

    always @ (posedge clk , negedge rst) begin
        if (!rst)
        begin
            arith_out<=0;
            carry_out<=0;
            arith_flag<=0;
        end
        else if(clk)begin
            arith_out<=arith_out_comp;
            carry_out<=carry_out_comp;
            arith_flag<=arith_flag_comp;
        end
        else begin
            arith_out<=arith_out;
            carry_out<=carry_out;
            arith_flag<=arith_flag;
        end
    end

    always @(*) begin
            arith_out_comp  =0  ;
            carry_out_comp  =0  ;
            arith_flag_comp =0  ;
        if(arith_enable)
        begin
        case (alu_func_arith)
            2'b00:begin  
                {carry_out_comp,arith_out_comp}=a+b;
                arith_flag_comp=1;
            end 
            2'b01:begin
                {carry_out_comp,arith_out_comp}=a-b;
                arith_flag_comp=1;
            end
            2'b10:begin
                {carry_out_comp,arith_out_comp}=a*b;
                arith_flag_comp=1;
            end 
            2'b11:begin
                {carry_out_comp,arith_out_comp}=a/b;
                arith_flag_comp=1;
            end
            default: begin
            arith_out_comp  =0  ;
            carry_out_comp  =0  ;
            arith_flag_comp =0 ;
            end
        endcase
        end
        else
        begin
            arith_out_comp  =0  ;
            carry_out_comp  =0  ;
            arith_flag_comp =0 ;
        end
    end
     
endmodule