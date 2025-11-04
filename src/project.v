/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_arko (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire _unused = &{ena, 1'b0};

  reg [7:0] input_reg;
  reg [7:0] output_reg;

  reg [7:0] counter;

  assign uo_out  = output_reg;  
  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;

  always @ (posedge clk)
    begin
      if (!rst_n)
        begin
          input_reg <= 8'b0;
          output_reg <= 8'b0;
          counter <= 8'b0;
        end
      else
        begin
          input_reg <= ui_in;
          if (input_reg == output_reg)
            begin
              output_reg <= 8'b0;
            end
          else
            begin
              output_reg <= output_reg + 1'b1;
            end
        end
    end

endmodule
