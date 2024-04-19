`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
//    that can be driven / tested by the cocotb test.py.
// */
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

//   // Wire up the inputs and outputs:
//   reg clk;
//   reg rst_n;
//   reg ena;
//   reg [7:0] ui_in;
//   reg [7:0] uio_in;
//   wire [7:0] uo_out;
//   wire [7:0] uio_out;
//   wire [7:0] uio_oe;

//   // Replace tt_um_example with your module name:
//   tt_um_8bitALU_verilog  (

//       // Include power ports for the Gate Level test:
// `ifdef GL_TEST
//       .VPWR(1'b1),
//       .VGND(1'b0),
// `endif

//       .ui_in  (ui_in),    // Dedicated inputs
//       .uo_out (uo_out),   // Dedicated outputs
//       .uio_in (uio_in),   // IOs: Input path
//       .uio_out(uio_out),  // IOs: Output path
//       .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
//       .ena    (ena),      // enable - goes high when design is selected
//       .clk    (clk),      // clock
//       .rst_n  (rst_n)     // not reset
//   );

// endmodule
    reg clk;
    reg rst_n; 
    reg ena;
    reg IN0;
    reg IN1; 
    reg IN2; 
    reg IN3; 
    reg IN4; 
    reg IN5; 
    reg IN6; 
    reg IN7; 
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;
 
    wire OUT0;
    wire OUT1;
    wire OUT2;
    wire OUT3;
    wire OUT4;
    wire OUT5;
    wire OUT6;
    wire OUT7;

tt_um_8bitALU user_project(
.clk(clk),
  .rst_n(rst_n),
.ena(ena),
.IN0(IN0),
.IN1(IN1), 
.IN2(IN2), 
.IN3(IN3), 
.IN4(IN4), 
.IN5(IN5), 
.IN6(IN6), 
.IN7(IN7),
.OUT0(OUT0),
.OUT1(OUT1),
.OUT2(OUT2),
.OUT3(OUT3),
.OUT4(OUT4),
.OUT5(OUT5),
.OUT6(OUT6),
.OUT7(OUT7),
      .ui_in  (ui_in),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe)  // IOs: Enable path (active high: 0=input, 1=output)
);
endmodule
   
