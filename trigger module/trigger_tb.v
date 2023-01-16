`timescale 1ns / 100ps

module trigger_tb;
    // clock
    reg clk;
    always
    begin
        clk = 1'b1;
        #20;
        clk = 1'b0;
        #20;
    end

    // RESET
    reg reset=0;

    // fifo signals
    reg fifo_wr_en=0;
    reg fifo_rd_en=0;
    reg [20 : 0] fifo_rd_data_count=12798;

    // Get outputs
    wire trigger_FIFO_empty;    
    wire trigger_FIFO_full;
    
    trigger_from_FIFO DUT (
        .clk(clk),
        .reset(reset),
        .fifo_wr_en_i(fifo_wr_en),
        .fifo_rd_en_i(fifo_rd_en),
        .fifo_rd_data_count_i(fifo_rd_data_count),
        .trigger_FIFO_full_o(trigger_FIFO_full),
        .trigger_FIFO_empty_o(trigger_FIFO_empty)
    );

    initial
    begin
        reset = 1;
        #40;
        reset = 0;

        // Check upper bound trigger
        fifo_wr_en = 1;
        #40;
        fifo_rd_data_count = 12799;
        #40;
        fifo_rd_data_count = 0;
        fifo_wr_en = 0;
        fifo_rd_en = 1;
        #40;
        fifo_rd_data_count = 11521;
        #40;
        
        // Check lower bound trigger
        fifo_rd_data_count = 0;
        fifo_wr_en = 0;
        fifo_rd_en = 0;
        #40;
        fifo_rd_en = 1;
        #40;
        fifo_rd_data_count = 2561;
        #40
        fifo_wr_en = 1;
        fifo_rd_en = 0;
        fifo_rd_data_count = 0;
        #40
        fifo_rd_data_count = 3839;
    end


endmodule