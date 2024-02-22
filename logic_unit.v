module logic_unit #(
    parameter in_width=16,
    parameter out_width=16
) (
    input wire signed [in_width-1:0]    a,b,
    input wire                          logic_enable,
    input wire        [1:0]             alu_func_logic,
    input wire                          clk,rst,
    output reg                          logic_flag,
    output reg        [out_width-1:0]   logic_out
    
);

reg logic_flag_comp;
reg [out_width-1:0] logic_out_comp;

always @(posedge clk , negedge rst) begin
        if (!rst)
        begin
            logic_out<=0;
            logic_flag<=0;
        end
        else if(clk) begin
            logic_out<=logic_out_comp;
            logic_flag<=logic_flag_comp;
        end
        else begin
            logic_out<=logic_out;
            logic_flag<=logic_flag;
        end
    end

    always @(*) begin
        logic_out_comp  =0  ;
        logic_flag_comp =0 ;
        if(logic_enable)
        begin
        case (alu_func_logic)
            2'b00:begin
                logic_out_comp=a&b;
                logic_flag_comp=1;
            end 
            2'b01:begin
                logic_out_comp=a|b;
                logic_flag_comp=1;
            end
            2'b10:begin
                logic_out_comp=~(a&b);
                logic_flag_comp=1;
            end 
            2'b11:begin
                logic_out_comp=~(a|b);
                logic_flag_comp=1;
            end
            default: begin
            logic_out_comp  =0  ;
            logic_flag_comp =0 ;
            end
        endcase
        end
        else
        begin
            logic_out_comp  =0  ;
            logic_flag_comp =0 ;
        end
    end


endmodule