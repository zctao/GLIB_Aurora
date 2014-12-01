library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity gtx_serdes is

    generic (
        g_SIMULATION : integer := 0);
    port (
        gtx_refclk_i : in  std_logic;
        gtx_reset_i  : in  std_logic;
        gtx_lbena_i  : in  std_logic;
        tx_reset_i   : in  std_logic;
        rx_reset_i   : in  std_logic;
        tx_data_i    : in  std_logic_vector(39 downto 0);
        gtx_rxp_i    : in  std_logic;
        gtx_rxn_i    : in  std_logic;
        gtx_ready_o  : out std_logic;
        tx_usrclk_o  : out std_logic;
        rx_usrclk_o  : out std_logic;
        gtx_refclk_o : out std_logic;
        rx_data_o    : out std_logic_vector(39 downto 0);
        gtx_txp_o    : out std_logic;
        gtx_txn_o    : out std_logic
		  );

end entity gtx_serdes;

architecture rtl of gtx_serdes is
    
component V6_GTXWIZARD_V1_4 
generic
(
    -- Simulation attributes
    WRAPPER_SIM_GTXRESET_SPEEDUP    : integer   := 0 -- Set to 1 to speed up sim reset
);
port
(

--    --_________________________________________________________________________
--    --_________________________________________________________________________
--     ------------------------ Loopback and Powerdown Ports ----------------------
--    GTX0_LOOPBACK_IN                        : in   std_logic_vector(2 downto 0);
--    ------------------- Receive Ports - RX Data Path interface -----------------
--    GTX0_RXDATA_OUT                         : out  std_logic_vector(39 downto 0);
--    GTX0_RXRESET_IN                         : in   std_logic;
--    GTX0_RXUSRCLK_IN                        : in   std_logic;
--    GTX0_RXUSRCLK2_IN                       : in   std_logic;
--    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
--    GTX0_RXEQMIX_IN                         : in   std_logic_vector(2 downto 0);
--    GTX0_RXN_IN                             : in   std_logic;
--    GTX0_RXP_IN                             : in   std_logic;
--    ------------------------ Receive Ports - RX PLL Ports ----------------------
--    GTX0_GTXRXRESET_IN                      : in   std_logic;
--    GTX0_MGTREFCLKRX_IN                     : in   std_logic;
--    GTX0_PLLRXRESET_IN                      : in   std_logic;
--    GTX0_RXPLLLKDET_OUT                     : out  std_logic;
--    GTX0_RXRESETDONE_OUT                    : out  std_logic;
--    ------------------ Transmit Ports - TX Data Path interface -----------------
--    GTX0_TXDATA_IN                          : in   std_logic_vector(39 downto 0);
--    GTX0_TXOUTCLK_OUT                       : out  std_logic;
--    GTX0_TXRESET_IN                         : in   std_logic;
--    GTX0_TXUSRCLK_IN                        : in   std_logic;
--    GTX0_TXUSRCLK2_IN                       : in   std_logic;
--    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
--    GTX0_TXN_OUT                            : out  std_logic;
--    GTX0_TXP_OUT                            : out  std_logic;
--    ----------------------- Transmit Ports - TX PLL Ports ----------------------
--    GTX0_GTXTXRESET_IN                      : in   std_logic;
--    GTX0_TXRESETDONE_OUT                    : out  std_logic
--GTX0  (X0Y17)
    
    ------------------------ Loopback and Powerdown Ports ----------------------
    GTX0_LOOPBACK_IN                        : in   std_logic_vector(2 downto 0);
    ------------------- Receive Ports - RX Data Path interface -----------------
    GTX0_RXDATA_OUT                         : out  std_logic_vector(39 downto 0);
    GTX0_RXRESET_IN                         : in   std_logic;
    GTX0_RXUSRCLK_IN                        : in   std_logic;
    GTX0_RXUSRCLK2_IN                       : in   std_logic;
    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    GTX0_RXEQMIX_IN                         : in   std_logic_vector(2 downto 0);
    GTX0_RXN_IN                             : in   std_logic;
    GTX0_RXP_IN                             : in   std_logic;
    ------------------------ Receive Ports - RX PLL Ports ----------------------
    GTX0_GTXRXRESET_IN                      : in   std_logic;
    GTX0_MGTREFCLKRX_IN                     : in   std_logic;
    GTX0_PLLRXRESET_IN                      : in   std_logic;
    GTX0_RXPLLLKDET_OUT                     : out  std_logic;
    GTX0_RXRESETDONE_OUT                    : out  std_logic;
    ------------------ Transmit Ports - TX Data Path interface -----------------
    GTX0_TXDATA_IN                          : in   std_logic_vector(39 downto 0);
    GTX0_TXOUTCLK_OUT                       : out  std_logic;
    GTX0_TXRESET_IN                         : in   std_logic;
    GTX0_TXUSRCLK_IN                        : in   std_logic;
    GTX0_TXUSRCLK2_IN                       : in   std_logic;
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    GTX0_TXDIFFCTRL_IN                      : in   std_logic_vector(3 downto 0);
    GTX0_TXN_OUT                            : out  std_logic;
    GTX0_TXP_OUT                            : out  std_logic;
    GTX0_TXPOSTEMPHASIS_IN                  : in   std_logic_vector(4 downto 0);
    --------------- Transmit Ports - TX Driver and OOB signalling --------------
    GTX0_TXPREEMPHASIS_IN                   : in   std_logic_vector(3 downto 0);
    ----------------------- Transmit Ports - TX PLL Ports ----------------------
    GTX0_GTXTXRESET_IN                      : in   std_logic;
    GTX0_TXRESETDONE_OUT                    : out  std_logic




);
end component;

component MGT_USRCLK_SOURCE_MMCM
generic
(
    MULT                 : real             := 8.0;
    DIVIDE               : integer          := 1;    
    CLK_PERIOD           : real             := 8.33;    
    OUT0_DIVIDE          : real             := 2.0;
    OUT1_DIVIDE          : integer          := 4;
    OUT2_DIVIDE          : integer          := 1;
    OUT3_DIVIDE          : integer          := 1
);
port
( 
    CLK0_OUT                : out std_logic;
    CLK1_OUT                : out std_logic;
    CLK2_OUT                : out std_logic;
    CLK3_OUT                : out std_logic;
    CLK_IN                  : in  std_logic;
    MMCM_LOCKED_OUT         : out std_logic;
    MMCM_RESET_IN           : in  std_logic
);
end component;
--************************** Register Declarations ****************************

    signal   gtx0_txresetdone_r              : std_logic;
    signal   gtx0_txresetdone_r2             : std_logic;
    signal   gtx0_rxresetdone_r              : std_logic;
    signal   gtx0_rxresetdone_r2             : std_logic;

--**************************** Wire Declarations ******************************
    -------------------------- MGT Wrapper Wires ------------------------------
    --________________________________________________________________________
    --________________________________________________________________________
    --GTX0   (X0Y17)
	 ------------------------ Loopback and Powerdown Ports ----------------------
    signal  gtx0_loopback_i                 : std_logic_vector(2 downto 0);
	 ------------------ Receive Ports - RX Data Path interface -----------------
    signal  gtx0_rxdata_i                   : std_logic_vector(39 downto 0);
    signal  gtx0_rxreset_i                  : std_logic;
   ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    signal  gtx0_rxeqmix_i                  : std_logic_vector(2 downto 0);
   ------------------------ Receive Ports - RX PLL Ports ----------------------
    signal  gtx0_gtxrxreset_i               : std_logic;
    signal  gtx0_pllrxreset_i               : std_logic;
    signal  gtx0_rxplllkdet_i               : std_logic;
    signal  gtx0_rxresetdone_i              : std_logic;
	 ------------------ Transmit Ports - TX Data Path interface -----------------

    signal q0_clk0_refclk_i   : std_logic;
    signal tied_to_ground     : std_logic;
    signal tied_to_ground_vec : std_logic_vector(63 downto 0);
    signal tied_to_vcc        : std_logic;
    signal tied_to_vcc_vec    : std_logic_vector(7 downto 0);
    signal tied_to_zero    : std_logic_vector(2 downto 0);
    --signal tile0_plllkdet      : std_logic;
     
    signal txoutclk_mmcm0_reset_i : std_logic;
	 signal gtx0_txusrclk2_i  : std_logic;
    signal gtx0_txusrclk0        : std_logic;
    signal tile0_refclkout_to_cmt : std_logic; 	 	 	 	 
	 signal gtx0_txplllkdet_i : std_logic;
	 signal gtx0_txusrclk_i : std_logic;
	 signal gtx0_txreset_i : std_logic;
	 signal gtx0_txresetdone_i : std_logic;
	 signal gtx0_txoutclk_i : std_logic;
	 signal txoutclk_mmcm0_locked_i : std_logic;
	 signal gtx0_loopback_in : std_logic;	 
    signal tile0_loopback0 : std_logic_vector(2 downto 0);
	 ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    signal  gtx0_txdiffctrl_i               : std_logic_vector(3 downto 0);
    signal  gtx0_txpostemphasis_i           : std_logic_vector(4 downto 0);
    --------------- Transmit Ports - TX Driver and OOB signalling --------------
    signal  gtx0_txpreemphasis_i            : std_logic_vector(3 downto 0);




begin  -- architecture rtl

    --  Static signal Assigments
    tied_to_ground     <= '0';
    tied_to_ground_vec <= x"0000000000000000";
    tied_to_vcc        <= '1';
    tied_to_vcc_vec    <= x"ff";
	 
	  -----------------------Dedicated GTX Reference Clock Inputs ---------------
    -- The dedicated reference clock inputs you selected in the GUI are implemented using
    -- IBUFDS_GTXE1 instances.
    --
    -- In the UCF file for this example design, you will see that each of
    -- these IBUFDS_GTXE1 instances has been LOCed to a particular set of pins. By LOCing to these
    -- locations, we tell the tools to use the dedicated input buffers to the GTX reference
    -- clock network, rather than general purpose IOs. To select other pins, consult the 
    -- Implementation chapter of UG___, or rerun the wizard.
    --
    -- This network is the highest performace (lowest jitter) option for providing clocks
    -- to the GTX transceivers.
    
--    q0_clk0_refclk_ibufds_i : IBUFDS_GTXE1
--    port map
--    (
--        O                               =>      q0_clk0_refclk_i,
--        ODIV2                           =>      open,
--        CEB                             =>      tied_to_ground,
--        I                               =>      Q0_CLK0_MGTREFCLK_PAD_P_IN,
--        IB                              =>      Q0_CLK0_MGTREFCLK_PAD_N_IN
--    );

	 
	 
	 
	 
    txoutclk_mmcm0_reset_i <= not gtx0_rxplllkdet_i ; --	gtx0_txplllkdet_i;
	 
    txoutclk_mmcm0_i : MGT_USRCLK_SOURCE_MMCM
    generic map
    (
        MULT                            =>      8.0,
        DIVIDE                          =>      1,
        CLK_PERIOD                      =>      8.33,
        OUT0_DIVIDE                     =>      8.0,
        OUT1_DIVIDE                     =>      4,
        OUT2_DIVIDE                     =>      1,
        OUT3_DIVIDE                     =>      1
    )
    port map
    (
        CLK0_OUT                        =>      gtx0_txusrclk2_i,
        CLK1_OUT                        =>      gtx0_txusrclk_i,
        CLK2_OUT                        =>      open,
        CLK3_OUT                        =>      open,
        CLK_IN                          =>      gtx0_txoutclk_i,
        MMCM_LOCKED_OUT                 =>      txoutclk_mmcm0_locked_i,
        MMCM_RESET_IN                   =>      txoutclk_mmcm0_reset_i
    );


   -- gtx_refclk_o <= tile0_refclkout_to_cmt;
      gtx_refclk_o <= gtx0_txoutclk_i;
   -- cmp_refclkout_pll0_bufg : BUFG
      --  port map (
       --     I => tile0_refclkout,
       --     O => tile0_refclkout_to_cmt
       --     );
--  Static signal Assigments
    tied_to_ground     <= '0';
    tied_to_ground_vec <= x"0000000000000000";
    tied_to_vcc        <= '1';
    tied_to_vcc_vec    <= x"ff";
    tied_to_zero<= "000";
    tx_usrclk_o <=  gtx0_txusrclk2_i;
    rx_usrclk_o <=  gtx0_txusrclk2_i;
	 
	 
	 gtx0_txdiffctrl_i                            <= "1010";
    gtx0_txpreemphasis_i                         <= tied_to_ground_vec(3 downto 0);
    gtx0_txpostemphasis_i                        <= tied_to_ground_vec(4 downto 0);


    -- Hold the TX in reset till the TX user clocks are stable
    --tile0_txreset0 <= not refclkout_pll0_locked or tx_reset_i;

    -- Hold the RX in reset till the RX user clocks are stable
    --tile0_rxreset0 <= not refclkout_pll0_locked or rx_reset_i;

    -- Set near-end PMA loopback when gtx_lbena_i = '1'
    tile0_loopback0 <= "010" when gtx_lbena_i = '1' else "000";----------------------------- The GTX Wrapper -----------------------------
    
    -- Use the instantiation template in the example directory to add the GTX wrapper to your design.
    -- In this example, the wrapper is wired up for basic operation with a frame generator and frame 
    -- checker. The GTXs will reset, then attempt to align and transmit data. If channel bonding is 
    -- enabled, bonding should occur after alignment.

    -- Hold the TX in reset till the TX user clocks are stable
    gtx0_txreset_i                           <= not txoutclk_mmcm0_locked_i;

    -- Hold the RX in reset till the RX user clocks are stable
  
    gtx0_rxreset_i                           <= not txoutclk_mmcm0_locked_i;

    v6_gtxwizard_v1_4_i : V6_GTXWIZARD_V1_4
    --generic map
    --(
        --WRAPPER_SIM_GTXRESET_SPEEDUP    =>      EXAMPLE_SIM_GTXRESET_SPEEDUP
   -- )
    port map
    (
        ------------------------ Loopback and Powerdown Ports ----------------------
    GTX0_LOOPBACK_IN     => tile0_loopback0,
      ------------------- Receive Ports - RX Data Path interface -----------------
    GTX0_RXDATA_OUT    => rx_data_o,
    GTX0_RXRESET_IN    => gtx0_rxreset_i ,
    GTX0_RXUSRCLK_IN   => gtx0_txusrclk_i,                          
    GTX0_RXUSRCLK2_IN  => gtx0_txusrclk2_i,  
                     
    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    GTX0_RXEQMIX_IN => tied_to_zero,                            
    GTX0_RXN_IN   => gtx_rxn_i,                             
    GTX0_RXP_IN   => gtx_rxp_i,                             
    ------------------------ Receive Ports - RX PLL Ports ----------------------
    GTX0_GTXRXRESET_IN     => gtx_reset_i,
    GTX0_MGTREFCLKRX_IN    =>  gtx_refclk_i,     
    GTX0_PLLRXRESET_IN     => gtx_reset_i,
    GTX0_RXPLLLKDET_OUT    =>gtx0_rxplllkdet_i,                     
    GTX0_RXRESETDONE_OUT   =>gtx0_rxresetdone_i,                     
    ------------------ Transmit Ports - TX Data Path interface -----------------
    GTX0_TXDATA_IN     => tx_data_i,
    GTX0_TXOUTCLK_OUT  => gtx0_txoutclk_i,                        
    GTX0_TXRESET_IN    => gtx0_txreset_i ,
    GTX0_TXUSRCLK_IN   => gtx0_txusrclk_i,
    GTX0_TXUSRCLK2_IN  => gtx0_txusrclk2_i,  
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
	 GTX0_TXDIFFCTRL_IN   =>      gtx0_txdiffctrl_i,
    GTX0_TXN_OUT       => gtx_txn_o,
    GTX0_TXP_OUT       => gtx_txp_o, 
    GTX0_TXPOSTEMPHASIS_IN    =>      gtx0_txpostemphasis_i,	

	 --------------- Transmit Ports - TX Driver and OOB signalling --------------
        GTX0_TXPREEMPHASIS_IN           =>      gtx0_txpreemphasis_i,

    ----------------------- Transmit Ports - TX PLL Ports ----------------------
	  GTX0_GTXTXRESET_IN   => gtx_reset_i,
     GTX0_TXRESETDONE_OUT  =>gtx0_txresetdone_i         

      );         
                    
            
           
         --------------------- Shared Ports - Tile and PLL Ports --------------------
                 
       -------------------------- User Module Resets -----------------------------
    -- All the User Modules i.e. FRAME_GEN, FRAME_CHECK and the sync modules
    -- are held in reset till the RESETDONE goes high. 
    -- The RESETDONE is registered a couple of times on USRCLK2 and connected 
    -- to the reset of the modules                        
                   

   process( gtx0_txusrclk2_i,gtx0_rxresetdone_i)
    begin
        if(gtx0_rxresetdone_i = '0') then
            gtx0_rxresetdone_r  <= '0'   after 1 ns;
            gtx0_rxresetdone_r2 <= '0'   after 1 ns;
        elsif(gtx0_txusrclk2_i'event and gtx0_txusrclk2_i = '1') then
            gtx0_rxresetdone_r  <= gtx0_rxresetdone_i   after 1 ns;
            gtx0_rxresetdone_r2 <= gtx0_rxresetdone_r   after 1 ns;
        end if;
    end process;
    process( gtx0_txusrclk2_i,gtx0_txresetdone_i)
    begin
        if(gtx0_txresetdone_i = '0') then
            gtx0_txresetdone_r  <= '0'   after 1 ns;
            gtx0_txresetdone_r2 <= '0'   after 1 ns;
        elsif(gtx0_txusrclk2_i'event and gtx0_txusrclk2_i = '1') then
            gtx0_txresetdone_r  <= gtx0_txresetdone_i   after 1 ns;
            gtx0_txresetdone_r2 <= gtx0_txresetdone_r   after 1 ns;
        end if;
    end process;
	 gtx_ready_o <=  gtx0_txresetdone_r2 and gtx0_rxresetdone_r2 ;
end architecture rtl;
