library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--! xilinx packages
library unisim;
use unisim.vcomponents.all;
--! system packages
use work.system_flash_sram_package.all;
use work.system_gbt_link_package.all;
use work.system_pcie_package.all;
use work.system_package.all;
use work.fmc_package.all;
use work.wb_package.all;
use work.ipbus.all;
--! user packages
use work.user_package.all;
--use work.user_logic_ram.all;

entity user_logic is
  port
    (
      --================================--
      -- USER MGT REFCLKs
      --================================--
      -- BANK_112(Q0):
      clk125_1_p                                : in      std_logic;
      clk125_1_n                                : in      std_logic;
      cdce_out0_p                               : in      std_logic;
      cdce_out0_n                               : in      std_logic;
      -- BANK_113(Q1):
      fmc2_clk0_m2c_xpoint2_p                   : in      std_logic;
      fmc2_clk0_m2c_xpoint2_n                   : in      std_logic;
      cdce_out1_p                               : in      std_logic;
      cdce_out1_n                               : in      std_logic;
      -- BANK_114(Q2):
      pcie_clk_p                                : in      std_logic;
      pcie_clk_n                                : in      std_logic;
      cdce_out2_p                               : in      std_logic;
      cdce_out2_n                               : in      std_logic;
      -- BANK_115(Q3):
      clk125_2_i                                : in      std_logic;
      clk125_2_bufg_i                           : in      std_logic;
      fmc1_gbtclk1_m2c_p                        : in      std_logic;
      fmc1_gbtclk1_m2c_n                        : in      std_logic;
      -- BANK_116(Q4):
      fmc1_gbtclk0_m2c_p                        : in      std_logic;
      fmc1_gbtclk0_m2c_n                        : in      std_logic;
      cdce_out3_p                               : in      std_logic;
      cdce_out3_n                               : in      std_logic;
      --================================--
      -- USER FABRIC CLOCKS
      --================================--
      xpoint1_clk1_i                            : in      std_logic;
      xpoint1_clk3_p                            : in      std_logic;
      xpoint1_clk3_n                            : in      std_logic;
      ------------------------------------
      cdce_out4_p                               : in      std_logic;
      cdce_out4_n                               : in      std_logic;
      ------------------------------------
      amc_tclkb_o                               : out     std_logic;
      ------------------------------------
      fmc1_clk0_m2c_xpoint2_p                   : in      std_logic;
      fmc1_clk0_m2c_xpoint2_n                   : in      std_logic;
      fmc1_clk1_m2c_p                           : in      std_logic;
      fmc1_clk1_m2c_n                           : in      std_logic;
      fmc1_clk2_bidir_p                         : in      std_logic;
      fmc1_clk2_bidir_n                         : in      std_logic;
      fmc1_clk3_bidir_p                         : in      std_logic;
      fmc1_clk3_bidir_n                         : in      std_logic;
      ------------------------------------
      fmc2_clk1_m2c_p                           : in      std_logic;
      fmc2_clk1_m2c_n                           : in      std_logic;
      --================================--
      -- GBT PHASE MONITORING MGT REFCLK
      --================================--
      cdce_out0_gtxe1_o                         : out   std_logic;
      cdce_out3_gtxe1_o                         : out   std_logic;
      --================================--
      -- AMC PORTS
      --================================--
      amc_port_tx_p : out       std_logic_vector(1 to 15);
      amc_port_tx_n : out         std_logic_vector(1 to 15);
      amc_port_rx_p : in          std_logic_vector(1 to 15);
      amc_port_rx_n : in          std_logic_vector(1 to 15);
      ------------------------------------
      amc_port_tx_out : out       std_logic_vector(17 to 20);
      amc_port_tx_in  : in        std_logic_vector(17 to 20);
      amc_port_tx_de  : out       std_logic_vector(17 to 20);
      amc_port_rx_out : out       std_logic_vector(17 to 20);
      amc_port_rx_in  : in        std_logic_vector(17 to 20);
      amc_port_rx_de  : out       std_logic_vector(17 to 20);
      --================================--
      -- SFP QUAD
      --================================--
      sfp_tx_p                          : out     std_logic_vector(1 to 4);
      sfp_tx_n                          : out     std_logic_vector(1 to 4);
      sfp_rx_p                          : in      std_logic_vector(1 to 4);
      sfp_rx_n                          : in      std_logic_vector(1 to 4);
      sfp_mod_abs                       : in      std_logic_vector(1 to 4);
      sfp_rxlos                         : in      std_logic_vector(1 to 4);
      sfp_txfault                       : in      std_logic_vector(1 to 4);
      --================================--
      -- FMC1
      --================================--
      fmc1_tx_p                           : out   std_logic_vector(1 to 4);
      fmc1_tx_n                           : out   std_logic_vector(1 to 4);
      fmc1_rx_p                           : in    std_logic_vector(1 to 4);
      fmc1_rx_n                           : in    std_logic_vector(1 to 4);
      ------------------------------------
      fmc1_io_pin                         : inout fmc_io_pin_type;
      ------------------------------------
      fmc1_clk_c2m_p                      : out   std_logic_vector(0 to 1);
      fmc1_clk_c2m_n                      : out   std_logic_vector(0 to 1);
      fmc1_present_l                      : in    std_logic;
      --================================--
      -- FMC2
      --================================--
      fmc2_io_pin                          : inout fmc_io_pin_type;
      ------------------------------------
      fmc2_clk_c2m_p                       : out  std_logic_vector(0 to 1);
      fmc2_clk_c2m_n                       : out  std_logic_vector(0 to 1);
      fmc2_present_l                       : in   std_logic;
      --================================--
      -- SYSTEM GBE
      --================================--
      sys_eth_amc_p1_tx_p                           : in          std_logic;
      sys_eth_amc_p1_tx_n                           : in          std_logic;
      sys_eth_amc_p1_rx_p                           : out         std_logic;
      sys_eth_amc_p1_rx_n                           : out         std_logic;
      ------------------------------------
      user_mac_syncacqstatus_i            : in    std_logic_vector(0 to 3);
      user_mac_serdes_locked_i            : in    std_logic_vector(0 to 3);
      --================================--
      -- SYSTEM PCIe
      --================================--
      sys_pcie_mgt_refclk_o               : out   std_logic;
      user_sys_pcie_dma_clk_i             : in    std_logic;
      ------------------------------------
      sys_pcie_amc_tx_p                   : in    std_logic_vector(0 to 3);
      sys_pcie_amc_tx_n                   : in    std_logic_vector(0 to 3);
      sys_pcie_amc_rx_p                   : out   std_logic_vector(0 to 3);
      sys_pcie_amc_rx_n                   : out   std_logic_vector(0 to 3);
      ------------------------------------
      user_sys_pcie_slv_o          : out   R_slv_to_ezdma2;
      user_sys_pcie_slv_i          : in    R_slv_from_ezdma2;
      user_sys_pcie_dma_o          : out   R_userDma_to_ezdma2_array(1 to 7);
      user_sys_pcie_dma_i          : in    R_userDma_from_ezdma2_array(1 to 7);
      user_sys_pcie_int_o          : out   R_int_to_ezdma2;
      user_sys_pcie_int_i          : in    R_int_from_ezdma2;
      user_sys_pcie_cfg_i          : in    R_cfg_from_ezdma2;
      --================================--
      -- SRAMs
      --================================--
      user_sram_control_o            : out      userSramControlR_array(1 to 2);
      user_sram_addr_o               : out      array_2x21bit;
      user_sram_wdata_o              : out      array_2x36bit;
      user_sram_rdata_i              : in       array_2x36bit;
      ------------------------------------
      sram1_bwa                           : out   std_logic;
      sram1_bwb                           : out   std_logic;
      sram1_bwc                           : out   std_logic;
      sram1_bwd                           : out   std_logic;
      sram2_bwa                           : out   std_logic;
      sram2_bwb                           : out   std_logic;
      sram2_bwc                           : out   std_logic;
      sram2_bwd                           : out   std_logic;
      --================================--
      -- CLK CIRCUITRY
      --================================--
      fpga_clkout_o                       : out   std_logic;
      ------------------------------------
      sec_clk_o                           : out   std_logic;
      ------------------------------------
      user_cdce_locked_i                  : in    std_logic;
      user_cdce_sel_o                     : out   std_logic;
      user_cdce_sync_o                    : out   std_logic;
      --================================--
      -- USER BUS
      --================================--
      wb_miso_o : out   wb_miso_bus_array(0 to number_of_wb_slaves-1);
      wb_mosi_i : in    wb_mosi_bus_array(0 to number_of_wb_slaves-1);
      ------------------------------------
      ipb_clk_i  : in       std_logic;
      ipb_miso_o : out   ipb_rbus_array(0 to number_of_ipb_slaves-1);
      ipb_mosi_i : in    ipb_wbus_array(0 to number_of_ipb_slaves-1);
      --================================--
      -- VARIOUS
      --================================--
      reset_i : in          std_logic;
      ------------------------------------
      sn : in    std_logic_vector(7 downto 0);
      ------------------------------------
      amc_slot_i : in    std_logic_vector( 3 downto 0);
      mac_addr_o : out   std_logic_vector(47 downto 0);
      ip_addr_o  : out   std_logic_vector(31 downto 0);
      ------------------------------------
      user_v6_led_o                       : out   std_logic_vector(1 to 2)
      );
end user_logic;

architecture user_logic_arch of user_logic is


  --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
  --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
  --@@@@@@@@ PLACE YOUR DECLARATIONS BELOW THIS COMMENT @@@@@@@@@--
  --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
  --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--


  signal data_from_fifo_o : std_logic_vector(17 downto 0);
  -----------------------------------------------------------------------------
  

--@@@@@@@@@@@@@@@@@@@@@@--
--@@@@@@@@@@@@@@@@@@@@@@--
--@@@@@@@@@@@@@@@@@@@@@@--
begin-- ARCHITECTURE
--@@@@@@@@@@@@@@@@@@@@@@--
--@@@@@@@@@@@@@@@@@@@@@@--
--@@@@@@@@@@@@@@@@@@@@@@--

  
  --#############################--
  --## GLIB IP & MAC ADDRESSES ##--
  --#############################--
  
  ip_addr_o             <= x"c0a8006f";      -- 192.168.0.111
  mac_addr_o            <= x"080030F10000";  -- 08:00:30:F1:00:00


  --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
  --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
  --@@@@@@@@@@@@ PLACE YOUR LOGIC BELOW THIS COMMENT @@@@@@@@@@@@--
  --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
  --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--


-- Pass required signals to the verilog code that is the top level
-- of the L1 trigger code.
	trigger_top : verilog_trigger_top port map(
	-- clocks and reset
	reset => reset_i,													-- active HI
	-- connect the 40 MHz oscillator clock here, make sure the crosspoint switch is configured
	cross_clk => xpoint1_clk1_i,                          -- crossing (event) clock
	-- programming interface
	--inputs
	ipb_clk => ipb_clk_i,											-- programming clock
	ipb_strobe => ipb_mosi_i(user_ipb_space).ipb_strobe,	-- this ipb space is selected for an I/O operation 
	ipb_addr => ipb_mosi_i(user_ipb_space).ipb_addr,		-- slave address, memory or register
	ipb_write => ipb_mosi_i(user_ipb_space).ipb_write,		-- this is a write operation
	ipb_wdata => ipb_mosi_i(user_ipb_space).ipb_wdata,		-- data to write for write operations
	-- outputs
	ipb_rdata => ipb_miso_o(user_ipb_space).ipb_rdata,		-- data returned for read operations
	ipb_ack => ipb_miso_o(user_ipb_space).ipb_ack,			-- 'write' data has been stored, 'read' data is ready
	ipb_err => ipb_miso_o(user_ipb_space).ipb_err,			-- '1' if error, '0' if OK?
	--links
	my_gt_refclk_p => clk125_1_p,
	my_gt_refclk_n => clk125_1_n,
	my_init_clk => xpoint1_clk1_i,
	
	my_sfp_txp1 => sfp_tx_p(1),
	my_sfp_txn1 => sfp_tx_n(1),
	my_sfp_rxp1 => sfp_rx_p(1),
	my_sfp_rxn1 => sfp_rx_n(1),
	
	my_sfp_txp2 => sfp_tx_p(4),
	my_sfp_txn2 => sfp_tx_n(4),
	my_sfp_rxp2 => sfp_rx_p(4),
	my_sfp_rxn2 => sfp_rx_n(4)
 );

              
--=========================================
-- Ram - dual-port
--=========================================
--usr_logic_dpram: entity work.user_logic_dpram
  
--  generic map (
--    widtha     =>             32,         -- data width
--    sizea      =>             1024,       -- depth
--    ADDRWIDTHA =>             10,         -- number of bits
--    widthb     =>             64,         -- data width
--    sizeb      =>             512,
--    ADDRWIDTHb =>             9           -- number of bits
--    )
--  port map (
--    reset => reset_i,
    -- port a - data bus is 32 bits wide
--    CLKA    => ipb_clk_i,
--    ADDA   => ipb_mosi_i(user_ipb_memory2).ipb_addr(9 downto 0),
--    STROBEA => ipb_mosi_i(user_ipb_memory2).ipb_strobe,
--    ACKA    => ipb_miso_o(user_ipb_memory2).ipb_ack,
--    DOA     => ipb_miso_o(user_ipb_memory2).ipb_rdata,
--    DIA     => ipb_mosi_i(user_ipb_memory2).ipb_wdata,
--    WEA     => ipb_mosi_i(user_ipb_memory2).ipb_write,
--    ---------------------------------------------------------------------------
    -- port b
--    CLKB    => ipb_clk_i,
--    ADDB   => addr_to_dpram1,
--    STROBEB => strobe_to_dpram1,
--    ACKB    => ack_from_dpram1,
--    DOB     => data_from_dpram1,
--    WEB     => '0',
--    DIB     => (others=>'0')
--    );

--dual_mem_test : entity work.blk_mem_gen_v7_3
--  PORT MAP (
--    clka => ipb_clk_i,
--    rsta => reset_i,
--    wea => (0 => ipb_mosi_i(user_ipb_memory2).ipb_write),
--    addra => ipb_mosi_i(user_ipb_memory2).ipb_addr(9 downto 0),
--    dina => ipb_mosi_i(user_ipb_memory2).ipb_wdata,
--    douta => ipb_miso_o(user_ipb_memory2).ipb_rdata,
--    clkb => ipb_clk_i,
--    rstb => reset_i,
--    web => (0 => '0'),
--    addrb => addr_to_dpram1,
--    dinb => (others=>'0'),
--    doutb => data_from_dpram1
--  );
----==============================================
---- FIFO
----==============================================
--usr_logic_scfifo: entity work.user_logic_scfifo
--  generic map (
--    ADDRESS_WIDTH => 5,
--    DATA_WIDTH => 18
--  )
--  port map (
--    CLK => ipb_clk_i,
--    RESET => reset_i,
--    ENR => fifo_read_enable_i,
--    ENW => ipb_mosi_i(user_ipb_memory2).ipb_strobe and ipb_mosi_i(user_ipb_memory2).ipb_addr(21),
--    DATAOUT => data_from_fifo_o,
--    DATAIN  => ipb_mosi_i(user_ipb_memory2).ipb_wdata(17 downto 0),
--    empty   => fifo_empty_o,
--    full    => fifo_full_o,
--    err     => fifo_err_o
--  );
       
end user_logic_arch;
