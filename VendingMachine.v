`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 274
// Engineer: Denny Ho
// 
// Create Date: 10/26/2019 05:18:50 PM
// Design Name: Vending Machine
// Module Name: VendingMachine
// Project Name: Lab 4
// Target Devices: BASYS3
// Description: Vending Machine sells candy for 25 cents, if more 
// than 25 cents is inputed the change will be output through Number. 
// 
//////////////////////////////////////////////////////////////////////////////////


module VendingMachine(Clk, Reset, N, D, Q, Candy, Number);
    input Clk, Reset, N, D, Q;
    output Candy, Number;
    reg Candy;
    reg [5:0] Number;
    
    localparam [4:0] start = 0, state5 = 1, state10 = 2, state15 = 3, state20 = 4, 
        state25 = 5, state30 = 6, state35 = 7, state40 = 8, state45 = 9; 
    reg[4:0] state = start;
    
    always @ (posedge Clk) begin
        if (Reset) begin
            state = start;
            Candy = 0;
            Number = 0;
        end
        
        else begin
            // Check Current State, then do state transitions and set output
            case(state)
                // Start State, 0 Cents
                start: begin
                    state = start;
                    Candy = 0;
                    Number = 0;
                    // Nickel Inserted
                    if (N & ~D & ~Q) begin
                        state = state5;
                        Number = 5;
                    end
                    // Dime Inserted
                    else if (~N & D & ~Q) begin
                        state = state10;
                        Number = 10;
                    end
                    // Quarter Inserted
                    else if (~N & ~D & Q) begin
                        state = state25;
                        Candy = 1;
                    end
                end
                // 5 Cents
                state5: begin
                    state = state5;
                    Candy = 0;
                    Number = 5;
                    if (N & ~D & ~Q) begin
                        state = state10;
                        Number = 10;
                    end
                    else if (~N & D & ~Q) begin
                        state = state15;
                        Number = 15;
                    end
                    else if (~N & ~D & Q) begin
                        state = state30;
                        Number = 5;
                        Candy = 1;
                    end
                end
                // 10 Cents
                state10: begin
                    state = state10;
                    Candy = 0;
                    Number = 10;
                    if (N & ~D & ~Q) begin
                        state = state15;
                        Number = 15;
                    end
                    else if (~N & D & ~Q) begin
                        state = state20;
                        Number = 20;
                    end
                    else if (~N & ~D & Q) begin
                        state = state35;
                        Number = 10;
                        Candy = 1;
                    end
                end
                // 15 Cents
                state15: begin
                    if (N & ~D & ~Q) begin
                        state = state20;
                        Number = 20;
                    end
                    else if (~N & D & ~Q) begin
                        state = state25;
                        Number = 0;
                        Candy = 1;
                    end
                    else if (~N & ~D & Q) begin
                        state = state40;
                        Candy = 1;
                        Number = 15; 
                    end
                end
                // 20 Cents
                state20: begin
                    if (N & ~D & ~Q) begin
                        state = state25;
                        Number = 0;
                        Candy = 1;
                    end
                    else if (~N & D & ~Q) begin
                        state = state30;
                        Candy = 1;
                        Number = 5;
                    end
                    else if (~N & ~D & Q) begin
                        state = state45;
                        Candy = 1;
                        Number = 20;
                    end
                end
            endcase
        end
    end
endmodule
