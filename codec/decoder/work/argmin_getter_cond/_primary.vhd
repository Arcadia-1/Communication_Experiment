library verilog;
use verilog.vl_types.all;
entity argmin_getter_cond is
    port(
        \out\           : out    vl_logic_vector(1 downto 0);
        state           : in     vl_logic_vector(1 downto 0);
        in0             : in     vl_logic_vector(3 downto 0);
        in1             : in     vl_logic_vector(3 downto 0);
        in2             : in     vl_logic_vector(3 downto 0);
        in3             : in     vl_logic_vector(3 downto 0);
        s0              : in     vl_logic_vector(1 downto 0);
        s1              : in     vl_logic_vector(1 downto 0);
        s2              : in     vl_logic_vector(1 downto 0);
        s3              : in     vl_logic_vector(1 downto 0)
    );
end argmin_getter_cond;
