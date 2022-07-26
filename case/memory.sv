module TOP #(parameter WIDTH = 1, PSIZE = 1, DEPTH = 2**PSIZE) (
    input clk,
    input rst_n,
    input in_wr,
    input in_rd ,
    input [WIDTH-1:0] in_data,
    input [PSIZE-1:0] in_wr_addr ,
    input [PSIZE-1:0] in_rd_addr,
    output [WIDTH-1:0] out_data
);
integer i;
reg [WIDTH-1:0] mem [DEPTH-1:0];

always @(posedge clk) begin
    if(~rst_n) begin
        for(i=0; i<DEPTH; i++) begin
            mem[i] <= {WIDTH{1'b0}};
        end
    end else if(in_wr) begin
	    mem[in_wr_addr] <= in_data;
    end
end

always @(posedge clk)
    if(~rst_n)
        out_data <=  {WIDTH{1'b0}};
    else if(in_rd)
        out_data <= mem[in_rd_addr];







endmodule
