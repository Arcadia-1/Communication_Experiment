library verilog;
use verilog.vl_types.all;
entity argmin_getter is
    port(
        \out\           : out    vl_logic_vector(1 downto 0);
        in0             : in     vl_logic_vector(3 downto 0);
        in1             : in     vl_logic_vector(3 downto 0);
        in2             : in     vl_logic_vector(3 downto 0);
        in3             : in     vl_logic_vector(3 downto 0)
    );
end argmin_getter;
