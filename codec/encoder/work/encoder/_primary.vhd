library verilog;
use verilog.vl_types.all;
entity encoder is
    port(
        \out\           : out    vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        \in\            : in     vl_logic;
        reset           : in     vl_logic
    );
end encoder;
