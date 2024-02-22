module shift_unit #(
    parameter in_width=16,
    parameter out_width=17
) (
    input wire signed [in_width-1:0]  a,b,
    input wire                        shift_enable,
    input wire        [1:0]           alu_func_shift,
    input wire                        clk,rst,
    output reg                        shift_flag,
    output reg        [out_width-1:0] shift_out
    
);  

reg shift_flag_comp;
reg [out_width-1:0] shift_out_comp;

always @(posedge clk , negedge rst) begin
        if (!rst)
        begin
            shift_out<=0; 
            shift_flag<=0;
        end
        else if(clk) begin
            shift_out<=shift_out_comp;
            shift_flag<=shift_flag_comp;
        end
        else begin
            shift_out<=shift_out;
            shift_flag<=shift_flag;
        end
    end

    always @(*) begin
        shift_out_comp  =0  ;
        shift_flag_comp =0 ;
        if(shift_enable)
        begin
        case (alu_func_shift)
            2'b00:begin
                shift_out_comp=a>>1;
                shift_flag_comp=1;
            end 
            2'b01:begin
                shift_out_comp=a<<1;
                shift_flag_comp=1;
            end
            2'b10:begin
                shift_out_comp=b>>1;
                shift_flag_comp=1;
            end 
            2'b11:begin
                shift_out_comp=b<<1;
                shift_flag_comp=1;
            end
            default: begin
            shift_out_comp  =0  ;
            shift_flag_comp =0 ;
            end
        endcase
        end
        else
        begin
            shift_out_comp  =0  ;
            shift_flag_comp =0 ;
        end
    end


endmodule