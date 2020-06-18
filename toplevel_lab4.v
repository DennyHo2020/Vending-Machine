`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 274
// Engineer: Denny Ho
// 
// Create Date: 10/26/2019 06:20:30 PM
// Design Name: Top Level Vending Machine
// Module Name: toplevel_lab4
// Project Name: Lab 4 
// Target Devices: BASYS3
// Description: Vending Machine accepts Nickels, Dimes, and Quarters with button
// presses. Candy is given/lit when 25 cents have been inputed. Two buttons cannot be
// pressed at once, the input will not be considered. TwoDigitDisplay will display the 
// amount of money inserted, and if candy is lit, it will display one's change. 
//
//////////////////////////////////////////////////////////////////////////////////


module toplevel_lab4(Clk, Reset, N, D, Q, Candy, out7, en_out);
    input Clk, Reset, N, D, Q;
    output Candy, out7, en_out;
    wire Candy, boN, boD, boQ;
    wire [6:0] out7;
    wire [3:0] en_out;
    
    wire [5:0] Number;
    
    ClkDiv a1(Clk, 1'b0, ClkOut);
    
    // Button for Coins
    ButtonSynchronizer a2(ClkOut, N, Reset, boN);
    ButtonSynchronizer a3(ClkOut, D, Reset, boD);
    ButtonSynchronizer a4(ClkOut, Q, Reset, boQ);
    
    VendingMachine a5(ClkOut, Reset, boN, boD, boQ, Candy, Number);
    
    TwoDigitDisplay a6(Clk, Number, out7, en_out);
    
endmodule
