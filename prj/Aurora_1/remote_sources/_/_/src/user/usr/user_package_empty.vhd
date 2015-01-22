library ieee;
use ieee.std_logic_1164.all;
 
package user_package is

	--=== system pcie ========--
   constant sys_pcie_enable         : boolean  := false;   
   constant sys_eth_p1_enable       : boolean  := false;   
   
   -- (Note!! Add user_sys_pcie_constants_package.vhd if system pcie enabled)
  

	--=== wishbone slaves ========--
	constant number_of_wb_slaves		: positive := 1 ;
	
	constant user_wb_space				: integer  := 0 ;
--	constant user_wb_timer				: integer  := 1 ;
	
	
	--=== ipb slaves =============
	-- crs 6/24/2013
	-- Set number of slaves to 1. This gives us a single address space that we will
	-- decode internally.
	constant number_of_ipb_slaves		: positive := 1 ;
   constant user_ipb_space				: integer  := 0 ; -- the only ipb space

-- comment out original stuff
--	constant user_ipb_regs				: integer  := 0 ; -- offset
-- constant user_ipb_memory         : integer  := 1 ; -- memory
   constant user_ipb_memory2        : integer  := 2 ; -- dual ported memory
--	constant user_ipb_timer			   : integer  := 1 ;

 component verilog_trigger_top port(
    reset: in std_logic;
	 cross_clk: in std_logic;
    ipb_clk: in std_logic;
    ipb_strobe: in std_logic;
    ipb_addr: in std_logic_vector(31 downto 0);
    ipb_write: in std_logic;
    ipb_wdata: in std_logic_vector(31 downto 0);

    ipb_rdata: out std_logic_vector(31 downto 0);
    ipb_ack: out std_logic;
    ipb_err: out std_logic;
	 
	 my_gt_refclk_p: in std_logic;
	 my_gt_refclk_n: in std_logic;
	 my_init_clk: in std_logic;
	 
	 my_sfp_txp1: out std_logic;
	 my_sfp_txn1: out std_logic;
	 my_sfp_rxp1: in std_logic;
	 my_sfp_rxn1: in std_logic;
	 my_sfp_txp2: out std_logic;
	 my_sfp_txn2: out std_logic;
	 my_sfp_rxp2: in std_logic;
	 my_sfp_rxn2: in std_logic
	 );
	 
 end component;

end user_package;
   
package body user_package is
end user_package;