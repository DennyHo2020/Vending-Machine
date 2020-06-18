`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 274
// Engineer: Denny Ho
// 
// Create Date: 10/26/2019 06:37:05 PM
// Design Name: Vending Machine Testbench
// Module Name: VendingMachine_tb
// Project Name: Lab 4
// Target Devices: BASYS3
//////////////////////////////////////////////////////////////////////////////////


module VendingMachine_tb();
    reg N, D, Q, Reset, Clk;
    wire Candy;
    wire [5:0] Number;
    integer i;
    
    localparam CLK_PERIOD = 5;
    
    VendingMachine m1(Clk, Reset, N, D, Q, Candy, Number);
    
    initial begin
        // No Coin entered
        Clk = 0;
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b0;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b0; Clk = 0;

        // Sum of 25 cents
        #5 Clk = 0;
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b1;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b0; Clk = 0;
        #5 Reset = 1;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b0; Clk = 0;
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b0; Clk = 0; Reset = 0;
        
        // More than 1 coin entered
        #5 N <= 1'b1; D <= 1'b1; Q <= 1'b0;
        #5 Clk = 1;
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b0; Clk = 0;
        
        // Sum of 30 cents, 5 cent change
        #5 N <= 1'b1; D <= 1'b0; Q <= 1'b0;
        #5 Clk = 0;
        #5 Clk = 1;
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b0; Clk = 0;
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b1;
        #5 Clk = 1;
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b0; Clk = 0;
        #5 Clk = 1;
        #5 Clk = 0;
        #5 Reset = 1;
        #5 Clk = 1;
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b0; Clk = 0; Reset = 0;

        // Sum of 15 cents
        #5 N <= 1'b0; D <= 1'b1; Q <= 1'b0;
        #5 Clk = 1;        
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b0; Clk = 0;
        #5 N <= 1'b1; D <= 1'b0; Q <= 1'b0; 
        #5 Clk = 1;        
        #5 N <= 1'b0; D <= 1'b0; Q <= 1'b0; Clk = 0;
    end
endmodule
