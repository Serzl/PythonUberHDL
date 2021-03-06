// File: write_pointer.v
// Generated by MyHDL 0.10
// Date: Mon Aug 27 20:07:45 2018


`timescale 1ns/10ps

module write_pointer (
    wr,
    fifo_full,
    wptr,
    fifo_we,
    clk,
    rst_n
);
// Input:
//     wr(bool):write signal
//     fifo_full(bool): fifo full signal
//     clk(bool): clock
//     rst_n(bool): negtive reset signal
//     
// Ouput:
//     wptr(5bit): the write in memory pointer
//     fifo_we(bool): the write enable indication signal

input wr;
input fifo_full;
output [4:0] wptr;
wire [4:0] wptr;
output fifo_we;
wire fifo_we;
input clk;
input rst_n;

wire fifo_we_i;
reg [4:0] wptr_i;




assign fifo_we_i = ((!fifo_full) && wr);


always @(posedge clk, negedge rst_n) begin: WRITE_POINTER_POINTERUPDATE
    if (rst_n) begin
        wptr_i <= 0;
    end
    else if (fifo_we_i) begin
        wptr_i <= (wptr_i + 1);
    end
    else begin
        wptr_i <= wptr_i;
    end
end



assign fifo_we = fifo_we_i;
assign wptr = wptr_i;

endmodule
