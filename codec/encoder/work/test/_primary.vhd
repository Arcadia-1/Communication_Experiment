library verilog;
use verilog.vl_types.all;
entity test is
    generic(
        h_cycle         : integer := 3
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of h_cycle : constant is 1;
end test;
