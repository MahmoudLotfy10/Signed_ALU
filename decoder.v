module decoder (
    input wire [1:0] alu_func_decoder,
    output reg arith_enable,logic_enable,cmp_enable,shift_enable
);
    
    always @(*) begin
            {arith_enable,logic_enable,cmp_enable,shift_enable}=4'b0000;
        case (alu_func_decoder)
            2'b00:begin 
                {arith_enable,logic_enable,cmp_enable,shift_enable}=4'b1000;
            end
             2'b01:begin
                {arith_enable,logic_enable,cmp_enable,shift_enable}=4'b0100;
            end
             2'b10:begin
                {arith_enable,logic_enable,cmp_enable,shift_enable}=4'b0010;
            end
            2'b11:begin
                {arith_enable,logic_enable,cmp_enable,shift_enable}=4'b0001;
            end 
            default: begin
                {arith_enable,logic_enable,cmp_enable,shift_enable}=4'b0000;
            end
        endcase
    end
endmodule