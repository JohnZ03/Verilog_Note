`timescale 1ns / 100ps

module trigger_from_FIFO(
    input wire clk,
    input wire reset,

    // IOs can be refered to [[fifo_]]
    // input wire fifo_full_i,
    // input wire fifo_empty_i,
    // input wire fifo_valid_i,  // Probably won't need

    // FIFO write and read enable
    input wire fifo_wr_en_i,
    input wire fifo_rd_en_i,

    // fifo_rd_data_count gives word number available in fifo
    // fifo_wr_data_count gives total number of words written
    // ! Get the width correct
    input wire [20 : 0] fifo_rd_data_count_i,

    output wire trigger_FIFO_full_o,
    output wire trigger_FIFO_empty_o
);

    // Set Parameters Here
    parameter frame_size = 1280;
    parameter frame_upper_bound = 10;
    parameter frame_lower_bound = 2;
    parameter pre_trig = 1;

    // Registers
    reg trigger_FIFO_full_reg;
    reg trigger_FIFO_empty_reg;

    // Assign registers to outputs
    assign trigger_FIFO_full_o = trigger_FIFO_full_reg;
    assign trigger_FIFO_empty_o = trigger_FIFO_empty_reg;

    // Sequential check for upper bound
	always @ (posedge clk, negedge reset) begin
        if (!reset) begin
            trigger_FIFO_full_reg <= 1'b0;
        end
        else begin
            // Check if reaching upper bound
            // 1 Flag check
            // 2 fifo data count check (upper_bound-1_word)
            // 3 if final word is being written this cycle
            if ((trigger_FIFO_full_reg == 1'b0)
                && (fifo_rd_data_count_i == (frame_size * frame_upper_bound - pre_trig))
                && (fifo_wr_en_i))
            begin
                trigger_FIFO_full_reg <= 1'b1;
            end
            // Check if upper bound trigger can be released
            // 1 Flag check
            // 2 fifo data count check (upper_bound-1_frame+1_word)
            // 3 if final word is being read this cycle
            else if ((trigger_FIFO_full_reg == 1'b1)
                && (fifo_rd_data_count_i == (frame_size * (frame_upper_bound-1) + pre_trig))
                && (fifo_rd_en_i))
            begin
                trigger_FIFO_full_reg <= 1'b0;
            end
            else
            // ! Release trigger in 'else'
            begin
                trigger_FIFO_full_reg <= trigger_FIFO_full_reg;
            end
        end
    end

    // Sequential check for lower bound
    always @ (posedge clk, negedge reset) begin
        if (!reset) begin
            trigger_FIFO_empty_reg <= 1'b0;
        end
        else begin
            // Check if reaching lower bound
            // 1 Flag check
            // 2 fifo data count check (lower_bound+1_word)
            // 3 if final word is being read this cycle
            if ((trigger_FIFO_empty_reg == 1'b0)
                && (fifo_rd_data_count_i == (frame_size * frame_lower_bound + pre_trig))
                && (fifo_rd_en_i))
            begin
                trigger_FIFO_empty_reg <= 1'b1;
            end
            // Check if upper bound trigger can be released
            // 1 Flag check
            // 2 fifo data count check (lower_bound+1_frame-1_word)
            // 3 if final word is being written this cycle
            else if ((trigger_FIFO_empty_reg == 1'b1)
                && (fifo_rd_data_count_i == (frame_size * (frame_lower_bound+1) - pre_trig))
                && (fifo_wr_en_i))
            begin
                trigger_FIFO_empty_reg <= 1'b0;
            end
            else
            // ! Release trigger in 'else'
            begin
                trigger_FIFO_empty_reg <= trigger_FIFO_empty_reg;
            end
        end
    end

endmodule