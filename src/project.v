/*  
 * Copyright (c) 2024 Your Name  
 * SPDX-License-Identifier: Apache-2.0  
 */  

`default_nettype none

module tt_um_xor_encryption (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,    // IOs: Input path
    output wire [7:0] uio_out,   // IOs: Output path
    output wire [7:0] uio_oe,    // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,       // always 1 when the design is powered, so you can ignore it
    input  wire       clk,       // clock
    input  wire       rst_n      // reset_n - low to reset
);

  // define xor byte
  // localparam [7:0] KEY = 8'hBE;
  // localparam [7:0] KEY_HIGH = 8'hCA;

  // XOR Logic
  assign uio_oe  = 8'b11111111; // enable all uio
  assign uo_out  = ui_in ^ uio_in; // Xor ui_in with uio_in
  assign uio_out = ui_in; // but not work because enable all uio to input

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
