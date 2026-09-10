module dds_tb;
    reg clk;
    reg rst_n;
    reg [7:0] freq_word;
    wire [7:0] sin_out;
    
    dds uut(
        .clk(clk),
        .rst_n(rst_n),
        .freq_word(freq_word),
        .sin_out(sin_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
         
    end

    initial begin
            $dumpfile("dds.vcd");
            $dumpvars(0, dds_tb);

            rst_n = 0;
            freq_word = 8'd0;
            #20;
          

            rst_n = 1;
            freq_word = 8'd4;
          #1000;           

            $display("DDS Simulation Finished!");
            $finish;
    end
endmodule