/*  
 * Copyright (c) 2024 Your Name  
 * SPDX-License-Identifier: Apache-2.0  
 */  

`default_nettype none  

module tt_um_example (  
    input  wire [7:0] ui_in,    // Dedicated inputs  
    output wire [7:0] uo_out,   // Dedicated outputs  
    input  wire [7:0] uio_in,    // IOs: Input path  
    output wire [7:0] uio_out,   // IOs: Output path  
    output wire [7:0] uio_oe,    // IOs: Enable path (active high: 0=input, 1=output)  
    input  wire       ena,       // always 1 when the design is powered, so you can ignore it  
    input  wire       clk,       // clock  
    input  wire       rst_n      // reset_n - low to reset  
);  

  // 定义加密密钥  
  localparam [7:0] KEY = 8'hBE; // 取密钥的低8位  
  localparam [7:0] KEY_HIGH = 8'hCA; // 取密钥的高8位  

  // XOR 加密  
  assign uo_out  = ui_in ^ KEY; // ui_in 与密钥进行异或加密  
  assign uio_out = uio_in ^ KEY; // uio_in 与密钥进行异或加密  
  assign uio_oe  = 8'b11111111; // 使能所有 IO 输出  

  // List all unused inputs to prevent warnings  
  wire _unused = &{ena, clk, rst_n, 1'b0};  

endmodule
