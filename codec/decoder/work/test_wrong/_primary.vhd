library verilog;
use verilog.vl_types.all;
entity test_wrong is
    generic(
        h_sys_cycle     : integer := 3;
        h_cycle         : vl_notype
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of h_sys_cycle : constant is 1;
    attribute mti_svvh_generic_type of h_cycle : constant is 3;
end test_wrong;
