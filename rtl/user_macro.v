`timescale 1ns/1ps
module user_macro #(parameter IO_W = 8) (
  input  wire              wb_clk_i,
  input  wire              wb_rst_i,
  input  wire [IO_W-1:0]   io_in,
  output reg  [IO_W-1:0]   io_out,
  output wire [IO_W-1:0]   io_oeb
);
  assign io_oeb = {IO_W{1'b0}}; // active-low output enable
  always @(posedge wb_clk_i) begin
    if (wb_rst_i) io_out <= {IO_W{1'b0}};
    else          io_out <= io_in ^ {IO_W{1'b1}};
  end
endmodule
