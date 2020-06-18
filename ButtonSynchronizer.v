`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 274
// Engineer: Denny Ho
// 
// Create Date: 10/26/2019 04:52:04 PM
// Design Name: Button Synchronizer
// Module Name: ButtonSynchronizer
// Project Name: Lab 4
// Target Devices: BASYS3
// Description: 
//////////////////////////////////////////////////////////////////////////////////


module ButtonSynchronizer(Clk, bi, Rst, bo);
    input Clk, bi, Rst;
    output reg bo;
    
    localparam [1:0] start = 0, state1 = 1, state2 = 2;
    reg [1:0] state;
    
    // On Rising Clk edge
    always @ (posedge Clk) begin 
        if (Rst) begin
            state = start;
            bo = 0;
        end
        else begin
            // Check Current State, then do state transitions and set outputs
            case(state)
                // Start State Transition
                start: begin
                    bo = 0;
                    if (bi) begin
                        state = state1;
                        bo = 1;
                    end
                end
                // State 1 Transition
                state1: begin
                    if (bi) begin 
                        state = state2;
                        bo = 0;
                    end
                    else begin
                        state = start;
                        bo = 0;
                    end
                end
                // State 2 Transition
                state2: begin
                    bo = 0;
                    if (!bi) begin
                        state = start;
                        bo = 0;
                    end  
                end
                // No state, intialize start state
                default: begin
                    state = start;
                end
             
            endcase
        end
        /*
        // Set Output
        case (state)
            // Start State Ouput
            start: begin
                bo = 0;
            end
            // State 1 Output
            state1: begin
                bo = 1;
            end
            // State 2 Output
            state2: begin
                bo = 0;
            end
        endcase
        */
    end
endmodule
