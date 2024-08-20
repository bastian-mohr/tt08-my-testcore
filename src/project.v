/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.  
  assign uio_out = 0;
  assign uio_oe  = 0;

  reg [7:0] my_counter;

    always @(posedge clk) begin
        if (!rst_n)
          my_counter = 0;
        else
          my_counter <= my_counter + 1;
    end

  // List all unused inputs to prevent warnings
  assign uo_out = my_counter;

endmodule
