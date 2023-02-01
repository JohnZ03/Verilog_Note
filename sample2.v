module ReadOut_FIFO_FSM (
    input wire clk,
    input wire reset,
    
    input wire [4:0] fifo_full_i,

    output wire [3:0] state_o,
    output reg [4:0] fifo_ready_read_o

);

// FSM
reg [7:0] state;

always @ (posedge clk) begin
    if (reset) begin
        state <= 8'hff;
    end else begin
        case (state)
        // ! Note state codes are not consecutive
        // state idle
        8'hff: begin
            // wait for first fifo to fill up
            if (fifo_full_i[0] == 1'b1) begin
                // start readout from fifo 0
                state <= 4'h1;
            end else begin
                // wait in idle
                state <= 4'h0;
            end
        end

        // start readout and wait until fifo is empty
        8'h00: begin
            if (fifo_full_i[0] == 1'b0) begin
                // fifo 0 is empty
                // start readout from fifo 1
                state <= 8'h01;
            end else begin
                // wait until fifo 0 is empty
                state <= 8'h00;
            end
            fifo_ready_read_o <= 5'b00001;
            next_state = 8'h01;
        end
        8'h01: begin
            next_state = 2'b11;
        end
        8'h02: begin
            next_state = 2'b00;
        end
    endcase
    end
end
    
endmodule