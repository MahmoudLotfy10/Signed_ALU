module cmp_unit #(
    parameter in_width=16,
    parameter cmp_width=3

) (
    input wire signed [in_width-1:0]  a,b,
    input wire                        cmp_enable,
    input wire        [1:0]           alu_func_cmp,
    input wire                        clk,rst,
    output reg                        cmp_flag,
    output reg        [cmp_width-1:0] cmp_out
    
);  

reg cmp_flag_comp;
reg [cmp_width-1:0] cmp_out_comp;

always @(posedge clk , negedge rst) begin
        if (!rst)
        begin
            cmp_out<=0;
            cmp_flag<=0;
        end
        else if(clk) begin
            cmp_out<=cmp_out_comp;
            cmp_flag<=cmp_flag_comp;
        end
        else begin
            cmp_out<=cmp_out;
            cmp_flag<=cmp_flag;
        end
    end

    always @(*) begin
        cmp_out_comp  =0  ;
        cmp_flag_comp =0 ;
        if(cmp_enable)
        begin
        case (alu_func_cmp)
            2'b00:begin
                cmp_out_comp=0;
                cmp_flag_comp=1;
            end 
            2'b01:begin
                if(a==b)
                cmp_out_comp=1;
                else
                cmp_out_comp=0;

                cmp_flag_comp=1;
            end
            2'b10:begin
                if(a>b)
                cmp_out_comp=2;
                else
                cmp_out_comp=0;
                
                cmp_flag_comp=1;
            end 
            2'b11:begin
                if(a<b)
                cmp_out_comp=3;
                else
                cmp_out_comp=0;
                
                cmp_flag_comp=1;
            end
            default: begin
            cmp_out_comp  =0  ;
            cmp_flag_comp =0 ;
            end
        endcase
        end
        else
        begin
            cmp_out_comp  =0  ;
            cmp_flag_comp =0 ;
        end
    end


endmodule