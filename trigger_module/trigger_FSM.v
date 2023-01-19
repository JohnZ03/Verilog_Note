module trigger_FSM (
    input wire clk,
    input wire reset,

    input wire [20 : 0] adc_fifo_rd_data_count_i,
    input wire [20 : 0] py_fifo_wr_data_count_i,

    output wire trigger_o

);
    // Set Parameters Here
    parameter frame_size = 1280;
    parameter py_fifo_frame_upper_bound = 5;
    parameter adc_fifo_frame_lower_bound = 2;
    parameter pre_trig = 1;

    // Registers
    reg [1:0] state;
    reg [10:0] counter;

    always @(posedge clk, negedge reset) begin
        if (reset) begin
            state <= 2'd0;
            counter <= 0;
        end else begin
            case (state)
            // Idle state
            2'd0: begin
                // Check if 2 frames in adc_fifo
                // Check if 1 frame space in py_fifo
                if ((adc_fifo_rd_data_count_i >= ('d1280 * frame_lower_bound)) 
                    && (adc_fifo_rd_data_count_i <= ('d1280 * frame_upper_bound))) 
                begin
                    state <= 2'd1;
                end
            end

            // Transmission state
            2'd1: begin
                state <= 2'd0;
            end

        endcase
        end
    end

endmodule