library verilog;
use verilog.vl_types.all;
entity tracker is
    port(
        err             : out    vl_logic_vector(15 downto 0);
        p_s             : out    vl_logic_vector(7 downto 0);
        p_err           : in     vl_logic_vector(15 downto 0);
        \in\            : in     vl_logic_vector(1 downto 0)
    );
end tracker;
