`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 274 
// Engineer: Denny Ho + R. Thamvichai
// 
// Create Date: 10/12/2019 09:55:49 PM
// Design Name: 
// Module Name: ClkDiv
// Project Name: Lab 3
// Target Devices: BASYS3 
//////////////////////////////////////////////////////////////////////////////////

module ClkDiv(Clk, Rst, ClkOut);   
    input Clk, Rst;   
    output reg ClkOut; //to create 1000 Hz clock from 100-MHz on the board    
    // parameter DivVal = 50000000;   
    parameter DivVal = 50000;      
   
    reg [25:0] DivCnt;   
    reg ClkInt;   
    always @(posedge Clk) begin       
        if( Rst == 1 )begin         
            DivCnt <= 0;         
            ClkOut <= 0;         
            ClkInt <= 0;      
        end      
        else begin         
            if( DivCnt == DivVal ) begin
                ClkOut <= ~ClkInt;
                ClkInt <= ~ClkInt;
                DivCnt <= 0;
            end        
            else begin
                ClkOut <= ClkInt;
                ClkInt <= ClkInt;
                DivCnt <= DivCnt + 1;
            end
        end
   end
endmodule
