
-- VHDL Instantiation Created from source file aurora_8b10b_1.vhd -- 15:45:09 02/18/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
	COMPONENT aurora_8b10b_1
	PORT(
		S_AXI_TX_TDATA : IN std_logic_vector(0 to 15);
		S_AXI_TX_TVALID : IN std_logic;
		S_AXI_TX_TKEEP : IN std_logic_vector(0 to 1);
		S_AXI_TX_TLAST : IN std_logic;
		RXP : IN std_logic;
		RXN : IN std_logic;
		GT_REFCLK1 : IN std_logic;
		WARN_CC : IN std_logic;
		DO_CC : IN std_logic;
		USER_CLK : IN std_logic;
		SYNC_CLK : IN std_logic;
		RESET : IN std_logic;
		POWER_DOWN : IN std_logic;
		LOOPBACK : IN std_logic_vector(2 downto 0);
		GT_RESET : IN std_logic;
		INIT_CLK_IN : IN std_logic;
		RXEQMIX_IN : IN std_logic_vector(2 downto 0);
		DADDR_IN : IN std_logic_vector(7 downto 0);
		DCLK_IN : IN std_logic;
		DEN_IN : IN std_logic;
		DI_IN : IN std_logic_vector(15 downto 0);
		DWE_IN : IN std_logic;          
		S_AXI_TX_TREADY : OUT std_logic;
		M_AXI_RX_TDATA : OUT std_logic_vector(0 to 15);
		M_AXI_RX_TVALID : OUT std_logic;
		M_AXI_RX_TKEEP : OUT std_logic_vector(0 to 1);
		M_AXI_RX_TLAST : OUT std_logic;
		TXP : OUT std_logic;
		TXN : OUT std_logic;
		HARD_ERR : OUT std_logic;
		SOFT_ERR : OUT std_logic;
		FRAME_ERR : OUT std_logic;
		CHANNEL_UP : OUT std_logic;
		LANE_UP : OUT std_logic;
		TX_OUT_CLK : OUT std_logic;
		DRDY_OUT : OUT std_logic;
		DRPDO_OUT : OUT std_logic_vector(15 downto 0);
		TX_LOCK : OUT std_logic
		);
	END COMPONENT;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
	Inst_aurora_8b10b_1: aurora_8b10b_1 PORT MAP(
		S_AXI_TX_TDATA => ,
		S_AXI_TX_TVALID => ,
		S_AXI_TX_TREADY => ,
		S_AXI_TX_TKEEP => ,
		S_AXI_TX_TLAST => ,
		M_AXI_RX_TDATA => ,
		M_AXI_RX_TVALID => ,
		M_AXI_RX_TKEEP => ,
		M_AXI_RX_TLAST => ,
		RXP => ,
		RXN => ,
		TXP => ,
		TXN => ,
		GT_REFCLK1 => ,
		HARD_ERR => ,
		SOFT_ERR => ,
		FRAME_ERR => ,
		CHANNEL_UP => ,
		LANE_UP => ,
		WARN_CC => ,
		DO_CC => ,
		USER_CLK => ,
		SYNC_CLK => ,
		RESET => ,
		POWER_DOWN => ,
		LOOPBACK => ,
		GT_RESET => ,
		TX_OUT_CLK => ,
		INIT_CLK_IN => ,
		RXEQMIX_IN => ,
		DADDR_IN => ,
		DCLK_IN => ,
		DEN_IN => ,
		DI_IN => ,
		DRDY_OUT => ,
		DRPDO_OUT => ,
		DWE_IN => ,
		TX_LOCK => 
	);



-- INST_TAG_END ------ End INSTANTIATION Template ------------

-- You must compile the wrapper file aurora_8b10b_1.vhd when simulating
-- the core, aurora_8b10b_1. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".
