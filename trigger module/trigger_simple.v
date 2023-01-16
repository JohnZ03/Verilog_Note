`timescale 1ns / 100ps

module trigger_from_FIFO #(
    input wire clk,
    input wire reset,

    // IOs can be refered to [[fifo_]]
    input wire fifo_full_i,
    input wire fifo_empty_i,
    input wire fifo_valid_i,  // Probably won't need

    // fifo_rd_data_count gives word number available in fifo
    // fifo_wr_data_count gives total number of words written
    // ! Get the width correct
    input wire [9 : 0] fifo_rd_data_count_i,

    output wire trigger_o
);

    // Set Parameters Here
    parameter frame_upper_bound = 10;
    parameter frame_lower_bound = 2;

    // Registers
    reg trigger_reg;

    // Sequential check of the fifo capacity
	always @ (posedge clk) begin
        if (reset) begin
            trigger_reg <= 1'b0;
        end
        else begin
            if (fifo_rd_data_count_i >= ('d1280 * frame_lower_bound) 
                && fifo_rd_data_count_i <= ('d1280 * frame_upper_bound))
            begin
                trigger_reg <= 1'b0;
            end
            else begin
                trigger_reg <= 1'b1;
            end
        end
    end

endmodule