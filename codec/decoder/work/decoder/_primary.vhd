library verilog;
use verilog.vl_types.all;
entity decoder is
    generic(
        COUNTER_SIZE    : integer := 5;
        BUFF_SIZE       : vl_notype
    );
    port(
        \out\           : out    vl_logic;
        en              : out    vl_logic;
        clk             : in     vl_logic;
        sysclk          : in     vl_logic;
        \in\            : in     vl_logic_vector(1 downto 0);
        reset           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of COUNTER_SIZE : constant is 1;
    attribute mti_svvh_generic_type of BUFF_SIZE : constant is 3;
end decoder;
