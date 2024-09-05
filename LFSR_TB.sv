`timescale 1ns / 1ps

module test;

 reg clock;
 reg reset;

 wire [15:0] rnd;

 LFSR uut (
  clock, 
  reset, 
  rnd
 );
 
 initial begin
  clock = 0;
  forever
   #50 clock = ~clock;
   reset = 1;
  end
  
 initial begin
  $dumpfile("gimme_a_10_in_my_grade_pls.vcd");
  $dumpvars(0, test);

  reset = 0;

  // 100 ns para o reset global
  #100;
      reset = 1;
  #200;
  reset = 0;

  #1000000;
  $finish;

 end
 
 initial begin
 $display("clock rnd");
 $monitor("%b,%b", clock, rnd);
 end      
endmodule