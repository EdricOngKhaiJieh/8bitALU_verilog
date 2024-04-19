module tt_um_8bitALU (

   input  wire [7:0] ui_in,    // Dedicated inputs
   output wire [7:0] uo_out,   // Dedicated outputs
   input  wire [7:0] uio_in,   // IOs: Input path
   output wire [7:0] uio_out,  // IOs: Output path
   output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
  input  IN0,
  input  IN1, 
  input  IN2, 
  input  IN3, 
  input  IN4, 
  input  IN5, 
  input  IN6, 
  input  IN7, 
  output OUT0,
  output OUT1,
  output OUT2,
  output OUT3,
  output OUT4,
  output OUT5,
  output OUT6,
  output OUT7,
  input clk, 
  input rst, 
  input ena
  );
  
//  reg OUT0;
//  reg OUT1;
//  reg OUT2;
//  reg OUT3;
//  reg OUT4;
//  reg OUT5;
//  reg OUT6;
//  reg OUT7;
  reg [7:0] memory1 ;
  reg [7:0] memory2 ; 
  reg [7:0] memory3 ; 
  
//  assign IN0 = 0 ; 
//  assign IN1 = 0 ; 
//  assign IN2 = 0 ; 
//  assign IN3 = 1 ; 
//  assign IN4 = 1 ; 
//  assign IN5 = 1 ; 
//  assign IN6 = 0 ; 
//  assign IN7 = 0 ;
   
  // always @(posedge CLK) begin
  //     OUT0 = ~pd;
  // end
  integer i ; 
  
 always @(posedge clk) 
  begin
   if (rst) begin
    // Reset memory to default values
    memory1 <= 8'd0;
    memory2 <= 8'd0;
    memory3 <= 8'd0;
  end
    else if (ena) begin
    if(IN7 == 0 && IN6 == 0 )
        begin
            memory1 = ({IN2 , IN1 , IN0});
            memory2 = ({IN5 , IN4 , IN3});
            memory3 = memory1 + memory2 ; // decimal of 14
            
        end
        
    if(IN7 == 0 && IN6 == 1 )
        begin
            memory1 = ({IN2 , IN1 , IN0});
            memory2 = ({IN5 , IN4 , IN3});
            memory3 = memory1 - memory2 ; // decimal of 14
        end
        
    if(IN7 == 1 && IN6 == 0 )
        begin
            memory1 = ({IN2 , IN1 , IN0});
            memory2 = ({IN5 , IN4 , IN3});
            memory3 = memory1 * memory2 ; // decimal of 14
        end
        
    if(IN7 == 1 && IN6 == 1 )
        begin
            memory1 = ({IN2 , IN1 , IN0});
            memory2 = ({IN5 , IN4 , IN3});
            memory3 = memory1 / memory2 ; // decimal of 14
        end
        
//        2'b10: {OUT1, OUT0} = 2'b10; // Opcode 10
//        2'b11: {OUT1, OUT0} = 2'b11; // Opcode 11

    end
end

//  assign OUT0 = ~rst ? 1'b0 : memory3[0];
//  assign OUT1 = ~rst ? 1'b0 : memory3[1];
//  assign OUT2 = ~rst ? 1'b0 : memory3[2];
//  assign OUT3 = ~rst ? 1'b0 : memory3[3];
//  assign OUT4 = ~rst ? 1'b0 : memory3[4];
//  assign OUT5 = ~rst ? 1'b0 : memory3[5];
//  assign OUT6 = ~rst ? 1'b0 : IN6;
//  assign OUT7 = ~rst ? 1'b0 : IN7;

  assign OUT0 = rst ? 1'b0 : memory3[0];
  assign OUT1 = rst ? 1'b0 : memory3[1];
  assign OUT2 = rst ? 1'b0 : memory3[2];
  assign OUT3 = rst ? 1'b0 : memory3[3];
  assign OUT4 = rst ? 1'b0 : memory3[4];
  assign OUT5 = rst ? 1'b0 : memory3[5];
  assign OUT6 = rst ? 1'b0 : IN6;
  assign OUT7 = rst ? 1'b0 : IN7;

  assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;
    
endmodule 
