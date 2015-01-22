library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--! specific packages
library unisim;
use unisim.vcomponents.all;
--! system packages
use work.ipbus.all;
use work.system_package.all;
use work.wb_package.all;
use work.system_flash_sram_package.all;
use work.system_pcie_package.all;
--! user packages
use work.user_package.all;


entity system_core is
port
(
   --================================--
	-- SYSTEM MGT REFCLKs 
	--================================--
	clk125_2_p            	            : in	  std_logic;										
	clk125_2_n            	            : in	  std_logic;										 
   --================================--  
	-- SYSTEM FABRIC CLOCKS   
	--================================--  
	pri_clk_p            	            : in	  std_logic;										
	pri_clk_n            	            : in	  std_logic; 									
	--================================--  
	-- AMC  
	--================================--  
	sys_eth_amc_p0_tx_p		            : out	  std_logic;
	sys_eth_amc_p0_tx_n		            : out	  std_logic;
	sys_eth_amc_p0_rx_p		            : in	  std_logic;
	sys_eth_amc_p0_rx_n		            : in	  std_logic;
   ------------------------------------
	sys_eth_amc_p1_tx_p		            : out	  std_logic;
	sys_eth_amc_p1_tx_n		            : out	  std_logic;
	sys_eth_amc_p1_rx_p		            : in	  std_logic;
	sys_eth_amc_p1_rx_n		            : in	  std_logic;
   ------------------------------------  
   sys_pcie_amc_tx_p		               : out	  std_logic_vector(0 to 3);	
   sys_pcie_amc_tx_n		               : out	  std_logic_vector(0 to 3);	
   sys_pcie_amc_rx_p		               : in	  std_logic_vector(0 to 3);	
   sys_pcie_amc_rx_n		               : in	  std_logic_vector(0 to 3);	
	--================================--  
	-- GBE  
	--================================--  
	gbe_tx_p						            : out	  std_logic;
	gbe_tx_n						            : out	  std_logic;
	gbe_rx_p						            : in	  std_logic;
	gbe_rx_n						            : in	  std_logic;
	gbe_reset_n					            : out	  std_logic;	
	gbe_int_n					            : in	  std_logic;	
	gbe_scl_mdc 				            : inout std_logic;   -- By default is mdc
	gbe_sda_mdio				            : inout std_logic;   -- By default is mdio   
	--================================--  
	-- FMC2 RESERVED MGT   
	--================================--  
	fmc2_tx_p					            : out	  std_logic;
	fmc2_tx_n					            : out	  std_logic;
	fmc2_rx_p					            : in	  std_logic;
	fmc2_rx_n					            : in	  std_logic; 
	--================================--  
	-- CLK CIRCUITRY 
	--================================--  
	xpoint1_s40   		                  : out	  std_logic;
	xpoint1_s41   	                     : out	  std_logic;
	xpoint1_s30   	                     : out	  std_logic;
	xpoint1_s31   	                     : out	  std_logic;
	xpoint1_s20   	                     : out	  std_logic;
	xpoint1_s21   	                     : out	  std_logic;
	xpoint1_s10   	                     : out	  std_logic;
	xpoint1_s11   	                     : out	  std_logic;
	-----------             
	xpoint2_s10	 			               : out	  std_logic;
	xpoint2_s11	 			               : out	  std_logic;
	------------------------------------  
	ics874003_fsel	 		               : out	  std_logic;
	ics874003_mr	 			            : out	  std_logic;
	ics874003_oe	 			            : out	  std_logic;
	------------------------------------  
	tclkb_dr_en				               : out	  std_logic;
	------------------------------------  
   cdce_pwr_down				            : out	  std_logic;	
	cdce_ref_sel				            : out	  std_logic;	
	cdce_sync					            : out	  std_logic;	
	cdce_spi_clk				            : out	  std_logic;	
	cdce_spi_le					            : out	  std_logic;	
	cdce_spi_mosi				            : out	  std_logic;	
	cdce_pll_lock				            : in	  std_logic;	
	cdce_spi_miso				            : in	  std_logic;	
   --------------             
  	cdce_sec_ref_p			               : out	  std_logic;
   cdce_sec_ref_n			               : out	  std_logic;  
	--================================--  
	-- VARIOUS 
	--================================--  
	fpga_reset_b	 			            : in	  std_logic;				
	fpga_power_on_reset_b	            : in	  std_logic;						
   ------------------------------------     
	fpga_scl  					            : inout std_logic;				
	fpga_sda						            : inout std_logic;  
   ------------------------------------   
   sfp_mod_abs					            : in	  std_logic_vector(1 to 4);		
	sfp_rxlos					            : in	  std_logic_vector(1 to 4);		
	sfp_txfault					            : in	  std_logic_vector(1 to 4);	
   ------------------------------------      
	sys_v6_led_3                        : out	  std_logic;
   ------------------------------------  
	v6_cpld						            : inout std_logic_vector(0 to 5);
	--================================--  
	-- FMC PRESENT   
	--================================--  
	fmc1_present_l				            : in	  std_logic;
	fmc2_present_l				            : in	  std_logic;
	--================================--  
	-- MEMORIES (FLASH & SRAMs)
	--================================--  
	sram1_addr					            : out	  std_logic_vector(20 downto 0);
	sram1_data					            : inout std_logic_vector(35 downto 0);
	sram2_addr					            : out	  std_logic_vector(20 downto 0);
	sram2_data					            : inout std_logic_vector(35 downto 0);
	------------------------------------
   fpga_a22 			                  : out	  std_logic;	
   fpga_a21			                     : out	  std_logic;	
   fpga_rs0	 		  			            : out	  std_logic;				
	fpga_rs1  					            : out	  std_logic;   
   ------------------------------------  
	sram_adv_ld_l				            : out	  std_logic_vector(1 to 2);	
	sram_ce1_l					            : out	  std_logic_vector(1 to 2);				
	sram_cen_l					            : out	  std_logic_vector(1 to 2);		
	sram_clk						            : out	  std_logic_vector(1 to 2);
	sram_mode					            : out	  std_logic_vector(1 to 2);
	sram_oe_l	   			            : out	  std_logic_vector(1 to 2);
	sram_we_l					            : out	  std_logic_vector(1 to 2);
	------------------------------------  
	sram2_ce2					            : out	  std_logic;	
	--================================--  
	-- USER INTERFACE
	--================================--  
	user_reset_o				            : out	  std_logic;
   ------------------------------------  
   user_clk125_2_o                     : out	  std_logic;
   user_clk125_2_bufg_o	               : out	  std_logic;
   user_pri_clk_o			               : out	  std_logic;
   ---------            
   sec_clk_i              	            : in	  std_logic;		
   sys_pcie_mgt_refclk_i               : in 	  std_logic;
   user_sys_pcie_dma_clk_o             : out	  std_logic;    
   ------------------------------------  
   cdce_out0_gtxe1_i                   : in    std_logic; 
   cdce_out3_gtxe1_i                   : in    std_logic;   
   ------------------------------------
   user_cdce_sel_i			            : in	  std_logic;
	user_cdce_sync_i			            : in	  std_logic;
	------------------------------------  
   user_sram_control_i		            : in 	  userSramControlR_array(1 to 2);
	user_sram_addr_i			            : in 	  array_2x21bit;
	user_sram_wdata_i			            : in 	  array_2x36bit;
	user_sram_rdata_o			            : out   array_2x36bit;
	------------------------------------ 		  
	user_mac_addr_i 			            : in    std_logic_vector(47 downto 0);
   user_ip_addr_i				            : in    std_logic_vector(31 downto 0);
   ------------------------------------   
   user_mac_syncacqstatus_o            : out	  std_logic_vector(0 to 3);
	user_mac_serdes_locked_o            : out	  std_logic_vector(0 to 3);
   ------------------------------------  
   user_sys_pcie_slv_i                 : in    R_slv_to_ezdma2;									
   user_sys_pcie_slv_o                 : out   R_slv_from_ezdma2; 	   						
   user_sys_pcie_dma_i                 : in    R_userDma_to_ezdma2_array  (1 to 7);		
   user_sys_pcie_dma_o                 : out   R_userDma_from_ezdma2_array(1 to 7);		
   user_sys_pcie_int_i                 : in    R_int_to_ezdma2;									
   user_sys_pcie_int_o                 : out   R_int_from_ezdma2; 								
	user_sys_pcie_cfg_o                 : out   R_cfg_from_ezdma2; 								
   ------------------------------------  
	user_wb_miso_i				            : in 	  wb_miso_bus_array(0 to number_of_wb_slaves-1);
	user_wb_mosi_o				            : out   wb_mosi_bus_array(0 to number_of_wb_slaves-1);
	------------------------------------  
	user_ipb_clk_o				            : out	  std_logic;
	user_ipb_miso_i			            : in 	  ipb_rbus_array(0 to number_of_ipb_slaves-1);
	user_ipb_mosi_o			            : out   ipb_wbus_array(0 to number_of_ipb_slaves-1)
	------------------------------------
   );                    	
end system_core;
	
architecture system_core_arch of system_core is                    	


--##########################################--
--########## SIGNAL AND CONSTANT ###########--
--############## DECLARATIONS ##############--
--##########################################--

attribute keep                         : string;

---------------------------------------
signal reset, rst_mac, rst_gtx			: std_logic;
---------------------------------------   
signal clk125_2_mgt, clk125_2				: std_logic;
signal pri_clk            					: std_logic;
---------------------------------------   
signal clk_125_from_glib_pll				: std_logic;
signal clk_31_25_A_from_glib_pll			: std_logic;
signal clk_31_25_B_from_glib_pll			: std_logic;
signal clk_31_25_C_from_glib_pll			: std_logic;
signal clk_inv_31_25_from_glib_pll		: std_logic;
signal clk_200_from_glib_pll				: std_logic;
signal locked_from_glib_pll				: std_logic;
---------------------------------------   
signal ipb_clk									: std_logic;
attribute keep of ipb_clk					: signal is "true";
signal ipb_inv_clk							: std_logic;
signal ipb_rst									: std_logic_vector(3 downto 0);
signal busy_from_ipb_arb					: std_logic;
signal ipb_from_masters						: ipb_wbus_array(3 downto 0);
signal ipb_to_masters						: ipb_rbus_array(3 downto 0);
signal ipb_from_eth							: ipb_wbus;		
signal ipb_to_eth								: ipb_rbus;		
signal ipb_from_pcie	   					: ipb_wbus;		
signal ipb_to_pcie							: ipb_rbus;		
signal ipb_to_fabric							: ipb_wbus;		
signal ipb_from_fabric						: ipb_rbus;
signal ipb_to_slaves							: ipb_wbus_array(number_of_slaves-1 downto 0);
signal ipb_from_slaves						: ipb_rbus_array(number_of_slaves-1 downto 0);
---------------------------------------   
signal clk_from_sys_pcie					: std_logic;	
signal busy_from_sys_pcie					: std_logic;	
---------------------------------------   
signal eth_mgt_refclk       				: std_logic;
signal gbe_mgt_resetdone 					: std_logic;
signal mac_clk125_o							: std_logic_vector(0 to 3);
signal mac_clk125								: std_logic_vector(0 to 3);
attribute keep of mac_clk125				: signal is "true";
signal mac_rxd									: array_4x8bit;
signal mac_rxclko								: std_logic_vector(0 to 3);
signal mac_rxdvld								: std_logic_vector(0 to 3);
signal mac_rxgoodframe						: std_logic_vector(0 to 3);
signal mac_rxbadframe						: std_logic_vector(0 to 3);
signal mac_txd									: array_4x8bit;
signal mac_txdvld								: std_logic_vector(0 to 3);
signal mac_txack								: std_logic_vector(0 to 3);
signal mac_syncacqstatus					: std_logic_vector(0 to 3);
signal mac_serdes_locked					: std_logic_vector(0 to 3);
---------------------------------------   
signal ipb_clk_sram1							: std_logic;
signal ipb_clk_sram2							: std_logic;
signal sram_w									: wSramR_array(1 to 2);
attribute keep of sram_w					: signal is "true";
signal sram_r									: rSramR_array(1 to 2);
attribute keep of sram_r					: signal is "true";
---------------------------------------
signal flash_w									: wFlashR;
attribute keep of flash_w					: signal is "true";
signal flash_r									: rFlashR;
attribute keep of flash_r					: signal is "true";  
---------------------------------------   
signal regs_to_ipbus			            : array_32x32bit;			
signal regs_from_ipbus		            : array_32x32bit;			
---------------   
signal reg_ctrl								: std_logic_vector(31 downto 0); --  4
signal reg_ctrl_2								: std_logic_vector(31 downto 0); --  5
signal reg_status								: std_logic_vector(31 downto 0);	--  7
signal reg_status_2							: std_logic_vector(31 downto 0); --  8
signal reg_ctrl_sram							: std_logic_vector(31 downto 0); --  6
signal reg_status_sram						: std_logic_vector(31 downto 0);	--  9
signal reg_spi_command						: std_logic_vector(31 downto 0); -- 10
signal reg_spi_txdata						: std_logic_vector(31 downto 0); -- 11
signal reg_spi_rxdata						: std_logic_vector(31 downto 0); -- 12
signal reg_i2c_settings						: std_logic_vector(31 downto 0);	-- 13
signal reg_i2c_command						: std_logic_vector(31 downto 0); -- 14
signal reg_i2c_reply							: std_logic_vector(31 downto 0); -- 15
---------------------------------------   
signal cdce_sync_done						: std_logic;
signal cdce_sync_busy						: std_logic;
signal cdce_sync_clk							: std_logic;
signal cdce_sync_cmd							: std_logic;
---------------------------------------	
signal gbt_phase_mon_reset 				: std_logic; 
signal sfp_phase_mon_threshold_upper	: std_logic_vector( 7 downto 0);
signal sfp_phase_mon_threshold_lower	: std_logic_vector( 7 downto 0);
signal sfp_phase_mon_stats          	: std_logic_vector(15 downto 0);
signal sfp_phase_mon_done           	: std_logic;
signal sfp_phase_mon_phase_ok          : std_logic;
signal fmc1_phase_mon_threshold_upper  : std_logic_vector( 7 downto 0);
signal fmc1_phase_mon_threshold_lower  : std_logic_vector( 7 downto 0);
signal fmc1_phase_mon_stats            : std_logic_vector(15 downto 0);
signal fmc1_phase_mon_done             : std_logic;
signal fmc1_phase_mon_phase_ok         : std_logic;
---------------------------------------   
   
   
--@@@@@@@@@@@@@@@@@@@@@@--   
--@@@@@@@@@@@@@@@@@@@@@@--   
--@@@@@@@@@@@@@@@@@@@@@@--
begin-- ARCHITECTURE
--@@@@@@@@@@@@@@@@@@@@@@--                              
--@@@@@@@@@@@@@@@@@@@@@@--
--@@@@@@@@@@@@@@@@@@@@@@--


--===================================--
	clk125_2_ibufds_gtxe1: ibufds_gtxe1 
--===================================--
	port map ( i => clk125_2_p, ib => clk125_2_n, ceb => '0', o => clk125_2_mgt);
--===================================--
   eth_mgt_refclk                      <= clk125_2_mgt;
 

--===================================--
	clk125_2_bufg: bufg 
--===================================--
	port map ( i => clk125_2_mgt, o => clk125_2);
--===================================--   


--===================================--
	pri_clk_ibufgds: ibufgds
--===================================--
  	generic map (capacitance => "dont_care", diff_term => true, ibuf_delay_value => "0", ibuf_low_pwr => true, iostandard => "lvds_25")	
   port map 	(i => pri_clk_p, ib => pri_clk_n, o => pri_clk);	
--===================================--   


--===================================--
   cdce_sec_ref_obufds: obufds
--===================================--
   generic map (iostandard => "lvds_25")
   port map (O => cdce_sec_ref_p, OB => cdce_sec_ref_n, I => sec_clk_i);
--===================================--


--===================================--
--###################################--
--###################################--
--###################################--
--###################################--
--###################################--
--###################################--
--===================================--


--===================================--
rst: entity work.reset_ctrl
--===================================--
port map
(
	clk					   	            => ipb_clk,
	ext_reset1_b				            => locked_from_glib_pll,
	ext_reset2_b				            => fpga_power_on_reset_b,
	rst_mac_o					            => rst_mac,
	rst_gtx_o					            => rst_gtx,
	rst_fabric_o     			            => reset
);
--===================================--
	
   gbe_reset_n 				            <= not reset;


--===================================--
glib_pll: entity work.mmcm_no_ibufg
--===================================--
port map
(
   reset 		    			            => '0',
   clk_in1         			            => clk125_2, 		  				    -- (no ibufg)
   clk_out1       			            => clk_125_from_glib_pll,
   clk_out2        			            => clk_31_25_A_from_glib_pll, 
   clk_out3         			            => clk_31_25_B_from_glib_pll,	    -- (no bufg)
   clk_out4         			            => clk_31_25_C_from_glib_pll,	    -- (no bufg)
   clk_out5      				            => clk_inv_31_25_from_glib_pll,       
   clk_out6      				            => clk_200_from_glib_pll,
   locked          			            => locked_from_glib_pll  
);
--===================================--

	ipb_clk						            <= clk_31_25_A_from_glib_pll;
	ipb_clk_sram1				            <= clk_31_25_B_from_glib_pll;
	ipb_clk_sram2				            <= clk_31_25_C_from_glib_pll;
	ipb_inv_clk					            <= clk_inv_31_25_from_glib_pll;
      
      
	mac_clk125(amc_p0) 		            <= clk125_2; 
	mac_clk125(amc_p1) 		            <= clk125_2; 
	mac_clk125(phy) 			            <= clk125_2; 
   mac_clk125(fmc2) 			            <= clk125_2; 


--===================================--
hb: entity work.sys_heartbeat
--===================================--
port map 
(
	reset_i                             => reset,
	clk_i                               => pri_clk,
	heartbeat_o                         => sys_v6_led_3
);


eth_A: if crate_operation = true generate

	--================================--
	amc_p0_eth: entity work.eth_v6_basex 
	--================================--
	port map
	(
		clk125_i 				            => mac_clk125(amc_p0),
		clk125_o 				            => open,	--mac_clk125_o(amc_p0),
		rst_mac					            => rst_mac, 
		rst_gtx					            => rst_gtx, 
		---------------------------------
		basex_clk 				            => eth_mgt_refclk, 			
		basex_txp 				            => sys_eth_amc_p0_tx_p,				
		basex_txn 				            => sys_eth_amc_p0_tx_n,				
		basex_rxp 				            => sys_eth_amc_p0_rx_p,				
		basex_rxn 				            => sys_eth_amc_p0_rx_n,				
		---------------------------------
		sync_acq 				            => mac_syncacqstatus(amc_p0),	
		locked 					            => mac_serdes_locked(amc_p0),			
		---------------------------------            
		txd 						            => mac_txd(amc_p0),
		txdvld 					            => mac_txdvld(amc_p0),
		txack 					            => mac_txack(amc_p0),
		---------------------------------            
		rxd 						            => mac_rxd(amc_p0),
		rxclko					            => mac_rxclko(amc_p0),
		rxdvld 					            => mac_rxdvld(amc_p0),
		rxgoodframe 			            => mac_rxgoodframe(amc_p0),
		rxbadframe 				            => mac_rxbadframe(amc_p0)
	);
	--================================--

	ipb_rst(amc_p0)			   <= '1' 	when rst_mac = '1'						else
                                 '1'	when mac_syncacqstatus(amc_p0)='0'	else
                                 '1'	when mac_serdes_locked(amc_p0)='0'	else		
                                 '0';
	
	--================================--
	amc_p0_ipb_ctrl: entity work.ipbus_ctrl 
	--================================--
	port map
	(
		ipb_clk 					            => ipb_clk,			
		rst 						            => ipb_rst(amc_p0),
		---------------------------------            
		mac_txclk 				            => mac_clk125(amc_p0),		
		mac_txd 					            => mac_txd(amc_p0),
		mac_txdvld 				            => mac_txdvld(amc_p0),
		mac_txack 				            => mac_txack(amc_p0),
		---------------------------------            
		mac_rxclk 				            => mac_clk125(amc_p0), --mac_rxclko(amc_p0),
		mac_rxd 					            => mac_rxd(amc_p0),
		mac_rxdvld 				            => mac_rxdvld(amc_p0),
		mac_rxgoodframe		            => mac_rxgoodframe(amc_p0),
		mac_rxbadframe 		            => mac_rxbadframe(amc_p0),
		---------------------------------            
		mac_addr 				            => user_mac_addr_i, 
		ip_addr 					            => user_ip_addr_i,  
		---------------------------------            
		ipb_out 					            => ipb_from_masters(amc_p0),
		ipb_in 					            => ipb_to_masters(amc_p0)
	);
	--================================--


	amc_p1_en: if sys_eth_p1_enable = true generate
   
      --=============================--
      amc_p1_eth: entity work.eth_v6_basex 
      --=============================--
      port map
      (
         clk125_i 				         => mac_clk125(amc_p1),
         clk125_o 				         => open, --mac_clk125_o(amc_p1),
         rst_mac					         => rst_mac, 
         rst_gtx					         => rst_gtx, 
         ------------------------------         
         basex_clk 				         => eth_mgt_refclk, 			
         basex_txp 				         => sys_eth_amc_p1_tx_p,				
         basex_txn 				         => sys_eth_amc_p1_tx_n,				
         basex_rxp 				         => sys_eth_amc_p1_rx_p,				
         basex_rxn 				         => sys_eth_amc_p1_rx_n,				
         ------------------------------         
         sync_acq 				         => mac_syncacqstatus(amc_p1),	
         locked 					         => mac_serdes_locked(amc_p1),			
         ------------------------------         
         txd 						         => mac_txd(amc_p1),
         txdvld 					         => mac_txdvld(amc_p1),
         txack 					         => mac_txack(amc_p1),
         ------------------------------         
         rxd 						         => mac_rxd(amc_p1),
         rxclko					         => open, --mac_rxclko(amc_p1),
         rxdvld 					         => mac_rxdvld(amc_p1),
         rxgoodframe 			         => mac_rxgoodframe(amc_p1),
         rxbadframe 				         => mac_rxbadframe(amc_p1)
      );
      --=============================--

      ipb_rst(amc_p1)			<= '1' 	when rst_mac = '1' 						else
                                 '1'	when mac_syncacqstatus(amc_p1)='0'	else
                                 '1'	when mac_serdes_locked(amc_p1)='0'	else		
                                 '0';

      --=============================--
      amc_p1_ipb_ctrl: entity work.ipbus_ctrl 
      --=============================--
      port map
      (
         ipb_clk 					         => ipb_clk,			
         rst 						         => ipb_rst(amc_p1),
         ------------------------------         
         mac_txclk 				         => mac_clk125(amc_p1),		
         mac_txd 					         => mac_txd(amc_p1),
         mac_txdvld 				         => mac_txdvld(amc_p1),
         mac_txack 				         => mac_txack(amc_p1),
         ------------------------------         
         mac_rxclk 				         => mac_clk125(amc_p1), --mac_rxclko(amc_p1),
         mac_rxd 					         => mac_rxd(amc_p1),
         mac_rxdvld 				         => mac_rxdvld(amc_p1),
         mac_rxgoodframe		         => mac_rxgoodframe(amc_p1),
         mac_rxbadframe 		         => mac_rxbadframe(amc_p1),
         ------------------------------         
         mac_addr 				         => user_mac_addr_i,
         ip_addr 					         => user_ip_addr_i,
         ------------------------------         
         ipb_out 					         => ipb_from_masters(amc_p1),
         ipb_in 					         => ipb_to_masters(amc_p1)
      );
      --================================--
   
   end generate;
   
   amc_p1_dis: if sys_eth_p1_enable = false generate
   
      ipb_from_masters(amc_p1).ipb_strobe <= '0';
   
   end generate;
   
	ipb_from_masters(phy).ipb_strobe 	<= '0';
   ipb_from_masters(fmc2).ipb_strobe 	<= '0';

end generate;


eth_B: if crate_operation = false generate

	--================================--
	phy_eth: entity work.eth_v6_sgmii 
	--================================--
	port map
	(
		clk125_i 				            => mac_clk125(phy),
		clk125_o 				            => open,	--mac_clk125_o(phy),
		rst 						            => reset,
		---------------------------------            
		sgmii_clk 				            => eth_mgt_refclk, 		
		sgmii_txp 				            => gbe_tx_p,					
		sgmii_txn 				            => gbe_tx_n,					
		sgmii_rxp 				            => gbe_rx_p,					
		sgmii_rxn 				            => gbe_rx_n,					
		---------------------------------            
		sync_acq 				            => mac_syncacqstatus(phy),	
		locked 					            => mac_serdes_locked(phy),	
		---------------------------------            
		txd 						            => mac_txd(phy),
		txdvld 					            => mac_txdvld(phy),
		txack 					            => mac_txack(phy),
		---------------------------------            
		rxd 						            => mac_rxd(phy),
		rxclko					            => open,	--mac_rxclko(phy),
		rxdvld 					            => mac_rxdvld(phy),
		rxgoodframe 			            => mac_rxgoodframe(phy),
		rxbadframe 				            => mac_rxbadframe(phy)
	);
	--================================--

	ipb_rst(phy)				   <= '1' 	when rst_mac = '1' 					else
                                 '1'	when mac_syncacqstatus(phy)='0'	else
                                 '1'	when mac_serdes_locked(phy)='0'	else		
                                 '0';

	--================================--
	phy_ipb_ctrl: entity work.ipbus_ctrl 
	--================================--
	port map
	(
		ipb_clk 					            => ipb_clk,			
		rst 						            => ipb_rst(phy),
		---------------------------------            
		mac_txclk 				            => mac_clk125(phy),		
		mac_txd 					            => mac_txd(phy),
		mac_txdvld 				            => mac_txdvld(phy),
		mac_txack 				            => mac_txack(phy),
		---------------------------------            
		mac_rxclk 				            => mac_clk125(phy), --mac_rxclko(phy),
		mac_rxd 					            => mac_rxd(phy),
		mac_rxdvld 				            => mac_rxdvld(phy),
		mac_rxgoodframe		            => mac_rxgoodframe(phy),
		mac_rxbadframe 		            => mac_rxbadframe(phy),
		---------------------------------            
		mac_addr 				            => user_mac_addr_i,
		ip_addr 					            => user_ip_addr_i,
		---------------------------------            
		ipb_out 					            => ipb_from_masters(phy),
		ipb_in 					            => ipb_to_masters(phy)
	);
	--================================--


	--================================--
	fmc2_eth: entity work.eth_v6_basex 
	--================================--
	port map
	(
		clk125_i 				            => mac_clk125(fmc2),
		clk125_o 				            => open,	--mac_clk125_o(fmc2),
		rst_mac					            => rst_mac, 
		rst_gtx					            => rst_gtx, 
		---------------------------------            
		basex_clk 				            => eth_mgt_refclk, 
		basex_txp 				            => fmc2_tx_p,				
		basex_txn 				            => fmc2_tx_n,				
		basex_rxp 				            => fmc2_rx_p,				
		basex_rxn 				            => fmc2_rx_n,				
		---------------------------------            
		sync_acq 				            => mac_syncacqstatus(fmc2),	
		locked 					            => mac_serdes_locked(fmc2),			
		---------------------------------            
		txd 						            => mac_txd(fmc2),
		txdvld 					            => mac_txdvld(fmc2),
		txack 					            => mac_txack(fmc2),
		---------------------------------            
		rxd 						            => mac_rxd(fmc2),
		rxclko					            => open,	--mac_rxclko(fmc2),
		rxdvld 					            => mac_rxdvld(fmc2),
		rxgoodframe 			            => mac_rxgoodframe(fmc2),
		rxbadframe 				            => mac_rxbadframe(fmc2)
	);
	--================================--

	--	fmc2_rate_sel				<= '0';	--> has to be done inside the user logic
	--	fmc2_tx_disable			<= '0';	--> has to be done inside the user logic

	ipb_rst(fmc2)				   <= '1' 	when rst_mac = '1' 					else
                                 '1'	when mac_syncacqstatus(fmc2)='0'	else
                                 '1'	when mac_serdes_locked(fmc2)='0'	else		
                                 '0';

	--================================--
	fmc2_ipb_ctrl: entity work.ipbus_ctrl 
	--================================--
	port map
	(
		ipb_clk 					            => ipb_clk,			
		rst 						            => ipb_rst(fmc2),
		---------------------------------            
		mac_txclk 				            => mac_clk125(fmc2),		
		mac_txd 					            => mac_txd(fmc2),
		mac_txdvld 				            => mac_txdvld(fmc2),
		mac_txack 				            => mac_txack(fmc2),
		---------------------------------            
		mac_rxclk 				            => mac_clk125(fmc2),	--mac_rxclko(fmc2),
		mac_rxd 					            => mac_rxd(fmc2),
		mac_rxdvld 				            => mac_rxdvld(fmc2),
		mac_rxgoodframe		            => mac_rxgoodframe(fmc2),
		mac_rxbadframe 		            => mac_rxbadframe(fmc2),
		---------------------------------            
		mac_addr 				            => user_mac_addr_i,
		ip_addr 					            => user_ip_addr_i,
		---------------------------------            
		ipb_out 					            => ipb_from_masters(fmc2),
		ipb_in 					            => ipb_to_masters(fmc2)
	);
	--================================--

	ipb_from_masters(amc_p0).ipb_strobe <= '0';
	ipb_from_masters(amc_p1).ipb_strobe <= '0';

end generate;


--===================================--
ipb_arb: entity work.ipbus_master_arb				
--===================================--
port map
(
	ipb_clk						            => ipb_clk,			
	rst							            => reset,
	bus_busy_o					            =>	busy_from_ipb_arb,
	ipb_from_masters			            => ipb_from_masters,
	ipb_to_masters				            => ipb_to_masters,
	ipb_from_fabric			            => ipb_to_eth,		
	ipb_to_fabric				            => ipb_from_eth		
);
--===================================--


sys_pcie_en: if sys_pcie_enable = true generate 

   --================================--						
   sys_pcie: entity work.pcie_glib_wrapper             	
   --================================--
   port map (													
      reset_i 					            => reset,																
      ---------------------------------            											
      pcie_mgt_refclk_i		            => sys_pcie_mgt_refclk_i,    	                         
      ---------------------------------                                           
      pcie_tx_p_o 			            => sys_pcie_amc_tx_p,	
      pcie_tx_n_o 			            => sys_pcie_amc_tx_n,	
      pcie_rx_p_i				            => sys_pcie_amc_rx_p,	
      pcie_rx_n_i				            => sys_pcie_amc_rx_n,	
      ---------------------------------                                       				
      ipbus_clk_i				            => ipb_clk,					
      ipbus_i 					            => ipb_to_pcie,      	
      ipbus_o 					            => ipb_from_pcie,	   	
      ---------------------------------                                       		
      pcie_clk_o				            => clk_from_sys_pcie,	     	
      pcie_slv_i				            => user_sys_pcie_slv_i,	
      pcie_slv_o				            => user_sys_pcie_slv_o,
      pcie_dma_i				            => user_sys_pcie_dma_i,
      pcie_dma_o  			            => user_sys_pcie_dma_o,
      pcie_interrupt_i		            => user_sys_pcie_int_i,
      pcie_interrupt_o		            => user_sys_pcie_int_o,
      ---------------------------------            									         
      pcie_cfg_o 				            => user_sys_pcie_cfg_o, 		
      retraining_cnt_o		            => open,      				
      link_rdy_o				            => open,						
      ipbus_busy_o			            => busy_from_sys_pcie,		
      test_mode_i				            => (others => '0')
   );   
   --================================--                  
   
   user_sys_pcie_dma_clk_o             <= clk_from_sys_pcie;
   
   --================================--                  
   pcie_eth_arb: entity work.pcie_or_eth_to_ipbus_arb 
   --================================--                  
   port map                                           
   (                                                  
      reset_i 					            => reset,					
      ---------------------------------                                          
      pcie_clk_i 				            => clk_from_sys_pcie,       
      pcie_busy_i 			            => busy_from_sys_pcie,      
      pcie_from_ipbus_o 	            => ipb_to_pcie,			
      pcie_to_ipbus_i 		            => ipb_from_pcie,       
      ---------------------------------                                          
      eth_busy_i 				            => busy_from_ipb_arb,   
      eth_from_ipbus_o 		            => ipb_to_eth,				
      eth_to_ipbus_i 		            => ipb_from_eth,        
      ---------------------------------                                          
      arb_from_fabric_i 	            => ipb_from_fabric,     
      arb_to_fabric_o 		            => ipb_to_fabric   		
   );                                            		
   --================================--  						   

end generate;

sys_pcie_dis: if sys_pcie_enable = false generate  
  
   user_sys_pcie_dma_clk_o             <= '0';    
   ------------------------------------            
   ipb_to_eth                          <= ipb_from_fabric;  
   ipb_to_fabric                       <= ipb_from_eth; 	 

end generate;


--===================================--
ipb_fabric: entity work.ipbus_fabric
--===================================--
generic map (NSLV => number_of_slaves) 
port map
(
	ipb_clk					               => ipb_clk,
	rst						               => reset,
	------------------------------------               
	ipb_in					               => ipb_to_fabric,
	ipb_out					               => ipb_from_fabric,
	------------------------------------               
	ipb_to_slaves			               => ipb_to_slaves,
	ipb_from_slaves		               => ipb_from_slaves
);
--================================--


--===================================--
ipb_usr_fabric: entity work.ipbus_user_fabric
--===================================--
generic map (NSLV => number_of_ipb_slaves)
port map
(
	ipb_clk					               => ipb_clk,
	rst						               => reset,
	------------------------------------               
	ipb_in					               => ipb_to_slaves(user_ipb),
	ipb_out					               => ipb_from_slaves(user_ipb),
	------------------------------------               
	ipb_to_slaves			               => user_ipb_mosi_o,
	ipb_from_slaves		               => user_ipb_miso_i
);	
--===================================--


--===================================--
wb_bridge: entity work.ipbus_to_wb_bridge
--===================================--
port map
(
	ipb_clk					               => ipb_clk,
	rst						               => reset,
	ipb_in					               => ipb_to_slaves(user_wb),
	ipb_out					               => ipb_from_slaves(user_wb),
	------------------------------------
	wb_to_slaves			               => user_wb_mosi_o,
	wb_from_slaves			               => user_wb_miso_i
);
--===================================--


--===================================--
ipb_sys_regs: entity work.system_regs
--===================================--
port map
(
	clk						               => ipb_clk,
	reset						               => reset,
	------------------------------------
	ipbus_in					               => ipb_to_slaves(sys_regs),
	ipbus_out				               => ipb_from_slaves(sys_regs),
	------------------------------------
	regs_o					               => regs_from_ipbus,
	regs_i					               => regs_to_ipbus				
);
--===================================--


--===================================--
sram1_if: entity work.glib_sram_interface_wrapper
--===================================--
generic map
(		
	-- Built Int Self Test(BIST):
	bist_maxaddresswrite	               => 2*(2**20)-1,                 -- = 2M memory locations
	bist_initialdelay		               => 200
)					               
port map             
(			               
	reset_i 					               => reset,	
	user_select_i 			               => reg_ctrl_sram(0),            -- 0: ipbus, 1: user
	------------------------------------               
	ipbus_clk_i 			               => ipb_clk_sram1,			
	ipbus_i 					               => ipb_to_slaves(sram1),
	ipbus_o					               => ipb_from_slaves(sram1),	
	ipbus_bist_i 			               => (reg_ctrl_sram(1), '0'),
	------------------------------------               	
	user_control_i			               => user_sram_control_i(sram1),	
	user_addr_i 			               => user_sram_addr_i(sram1),
	user_data_i 			               => user_sram_wdata_i(sram1),
	user_data_o 			               => user_sram_rdata_o(sram1),
	user_bist_i 			               => ('0', '0'),	                 -- bist start from user	
	------------------------------------	
	bist_seed_i 				            => seed_constants(1),
	bist_test_o.startErrInj             => open,
	bist_test_o.testDone 	            => reg_status_sram(0),
	bist_test_o.testResult 	            => reg_status_sram(1),
	bist_test_o.errCounter( 7 downto 0)	=> reg_status_sram(11 downto 4),
	bist_test_o.errCounter(20 downto 8)	=> open,		
	------------------------------------	
	sram_i					               => sram_r(sram1), 
	sram_o 					               => sram_w(sram1)							
);
--===================================--	


--===================================--
sram2_if: entity work.glib_sram_interface_wrapper
--===================================--
generic map
(		
	-- Built Int Self Test(BIST):
	bist_maxaddresswrite	=> 2*(2**20)-1,                                -- = 2M memory locations
	bist_initialdelay		=> 200
)					
port map
(			
	reset_i 					               => reset,	
	user_select_i 			               => reg_ctrl_sram(16),           -- 0: ipbus, 1: user
	------------------------------------
	ipbus_clk_i 			               => ipb_clk_sram2,			
	ipbus_i 					               => ipb_to_slaves(sram2),
	ipbus_o					               => ipb_from_slaves(sram2),	
	ipbus_bist_i 			               => (reg_ctrl_sram(17), '0'),
	------------------------------------
	user_control_i			               => user_sram_control_i(sram2),			
	user_addr_i 			               => user_sram_addr_i(sram2),
	user_data_i 			               => user_sram_wdata_i(sram2),
	user_data_o 			               => user_sram_rdata_o(sram2),	
	user_bist_i 			               => ('0', '0'),	                 -- bist start from user	
	------------------------------------	
	bist_seed_i 				            => seed_constants(2),
	bist_test_o.startErrInj             => open,
	bist_test_o.testDone 	            => reg_status_sram(16),
	bist_test_o.testResult 	            => reg_status_sram(17),
	bist_test_o.errCounter( 7 downto 0)	=> reg_status_sram(27 downto 20),
	bist_test_o.errCounter(20 downto 8)	=> open ,		
	------------------------------------	
	sram_i					               => sram_r(sram2), 
	sram_o 					               => sram_w(sram2)							
);
--===================================--	


--===================================--
flash_if: entity work.flash_interface_wrapper 
--===================================--
port map
(
	reset_i 					               => reset,
	------------------------------------
	ipbus_clk_i 			               => ipb_clk,
	ipbus_i 					               => ipb_to_slaves(flash),
	ipbus_o 					               => ipb_from_slaves(flash),
	------------------------------------
	flash_i 					               => flash_r,
	flash_o 					               => flash_w
);
--===================================--


--===================================--
buffers: entity work.sram_flash_buffers
--===================================--
port map 
(
	reset_i 					               => reset,
	flash_select_i			               => reg_ctrl_sram(20),	        -- 0: sram2, 1: flash
	------------------------------------               
	sram1_i 					               => sram_w(sram1),
	sram1_o 					               => sram_r(sram1),
	------------------------------------               
	sram2_i 					               => sram_w(sram2),
	sram2_o 					               => sram_r(sram2),
	------------------------------------               
	flash_i 					               => flash_w,
	flash_o 					               => flash_r,	
	------------------------------------               
	sram1_addr_o 			               => sram1_addr,
	sram1_data_io			               => sram1_data,
	sram2_addr_o 			               => sram2_addr,
	sram2_data_io			               => sram2_data,	
	------------------------------------
   fpga_a(22)                          => fpga_a22,
   fpga_a(21)                          => fpga_a21,
   fpga_rs(0)                          => fpga_rs0,
   fpga_rs(1)                          => fpga_rs1,
   ------------------------------------
   sram_clk_o 				               => sram_clk,
	sram_ce1_b_o			               => sram_ce1_l,
	sram_cen_b_o 			               => sram_cen_l,
	sram_oe_b_o 			               => sram_oe_l,
	sram_we_b_o 			               => sram_we_l,
	sram_mode_o 			               => sram_mode,
	sram_adv_ld_o 			               => sram_adv_ld_l,	
	sram2_ce2_o 			               => sram2_ce2	
);	
--===================================--


--===================================--
icap_if: entity work.icap_interface_wrapper 
--===================================--
port map
(
	reset_i					               => reset,				
	conf_trigg_i			               => reg_ctrl_2(4),                      			 				
	fsm_conf_page_i		               => reg_ctrl_2(1 downto 0),                      			 				
	------------------------------------               
	ipbus_clk_i				               => ipb_clk,			
	ipbus_inv_clk_i		               => ipb_inv_clk,
	ipbus_i					               => ipb_to_slaves(icap),				
	ipbus_o	   			               => ipb_from_slaves(icap)
);
--===================================--


--===================================--
i2c: entity work.i2c_master
--===================================--
port map
(
	reset						               => reset,
	clk						               => ipb_clk, 
	------------------------------------               
	settings					               => reg_i2c_settings(12 downto 0),
	command					               => reg_i2c_command,        	      -- reg_i2c_command[31:28] clears automatically
	reply						               => reg_i2c_reply,
	------------------------------------               
	scl(0)					               => fpga_scl,
	scl(1)					               => open,--gbe_scl_mdc,
	sda(0)					               => fpga_sda,				
	sda(1)					               => open --gbe_sda_mdio				
	); 			
--===================================--


--===================================--
spi: entity work.spi_master
--===================================--
port map
(
	reset_i					               => reset,  
	clk_i						               => ipb_clk,
	------------------------------------
	data_i					               => reg_spi_txdata,
	enable_i					               => reg_spi_command(31),	
	ssdelay_i				               => reg_spi_command(27 downto 18),
	hold_i					               => reg_spi_command(17 downto 15),
	msbfirst_i				               => reg_spi_command(14),
	cpha_i					               => reg_spi_command(13),
	cpol_i					               => reg_spi_command(12),
	prescaler_i				               => reg_spi_command(11 downto 0),
	data_o					               => reg_spi_rxdata,
	------------------------------------
	ss_b_o					               => cdce_spi_le,
	sck_o						               => cdce_spi_clk,
	mosi_o 					               => cdce_spi_mosi,
	miso_i 					               => cdce_spi_miso
);
--===================================--


--===================================--
cdce_synch: entity work.cdce_synchronizer
--===================================--
generic map
(	
	pwrdown_delay 			               => 1000,
	sync_delay 				               => 1000000	
)
port map
(	
	reset_i					               => reset,
	------------------------------------               
	ipbus_ctrl_i			               => (not reg_ctrl(7)), 	-- reg[5][7]: 0 -> IPBUS, 1-> USER
	ipbus_sel_i				               => reg_ctrl(5),
	ipbus_pwrdown_i		               => reg_ctrl(4),
	ipbus_sync_i			               => reg_ctrl(6), 	      -- rising edge needed
	------------------------------------               										            						
	user_sel_i				               => user_cdce_sel_i,                 
	user_pwrdown_i			               => '1',                 
	user_sync_i				               => user_cdce_sync_i,
	------------------------------------               
	pri_clk_i				               => pri_clk,
	sec_clk_i				               => sec_clk_i,
	pwrdown_o				               => cdce_pwr_down,
	sync_o					               => cdce_sync,
	ref_sel_o				               => cdce_ref_sel,	
	------------------------------------               
	sync_cmd_o				               => cdce_sync_cmd,	
	sync_clk_o				               => cdce_sync_clk,	
	sync_busy_o				               => cdce_sync_busy,	
	sync_done_o				               => cdce_sync_done	
);
--===================================--


--===================================--
gbt_phase_monitoring: entity work.cdce_phase_mon_v2_wrapper
--===================================--
port map
(	
   reset_i              		         => reset or gbt_phase_mon_reset,       
   ------------------------------------ 
   ipbus_clk_i             		      => ipb_clk,       
   ttclk_i	               		      => pri_clk,  
   unrelated_clk_i       		         => clk125_2,    
   ------------------------------------  
   sfp_ttclk_x6_cdce_i     		      => cdce_out0_gtxe1_i,
   sfp_threshold_upper_i   		      => sfp_phase_mon_threshold_upper,
   sfp_threshold_lower_i   		      => sfp_phase_mon_threshold_lower,
   sfp_monitoring_stats_o  		      => sfp_phase_mon_stats,
   sfp_done_o             		         => sfp_phase_mon_done,
   sfp_phase_ok_o         		         => sfp_phase_mon_phase_ok,
   ------------------------------------    
   fmc1_ttclk_x6_cdce_i     		      => cdce_out3_gtxe1_i,
   fmc1_threshold_upper_i   		      => fmc1_phase_mon_threshold_upper,
   fmc1_threshold_lower_i   		      => fmc1_phase_mon_threshold_lower,
   fmc1_monitoring_stats_o  		      => fmc1_phase_mon_stats,
   fmc1_done_o           		         => fmc1_phase_mon_done,  
   fmc1_phase_ok_o       		         => fmc1_phase_mon_phase_ok 
);


--===================================--
-- io/reg mapping
--===================================--

	user_reset_o				            <= reset;
   user_clk125_2_o                     <= clk125_2_mgt;
	user_clk125_2_bufg_o                <= clk125_2;   
   user_pri_clk_o				            <= pri_clk;   
	user_ipb_clk_o			               <= ipb_clk;
   user_mac_syncacqstatus_o            <= mac_syncacqstatus;
	user_mac_serdes_locked_o            <= mac_serdes_locked;
	
	------------------------------------

                                          reg_ctrl          <= regs_from_ipbus(4);
                                          reg_ctrl_2			<= regs_from_ipbus(5);
	regs_to_ipbus(6)                    <=	reg_status;
	regs_to_ipbus(7)                    <=	reg_status_2;
                                          reg_ctrl_sram		<= regs_from_ipbus(8);
	regs_to_ipbus(9)                    <=	reg_status_sram;
                                          reg_spi_txdata		<= regs_from_ipbus(10);
                                          reg_spi_command	<= regs_from_ipbus(11);
	regs_to_ipbus(12)                   <=	reg_spi_rxdata;
                                          reg_i2c_settings	<= regs_from_ipbus(13);
                                          reg_i2c_command	<= regs_from_ipbus(14);
	regs_to_ipbus(15)                   <=	reg_i2c_reply;	
	   
   -- gbt_phase_moninoring
   
   
   --                                  (default: xxxx|xxxx|xxxx|xxxx|0110|1111|0100|1111)
                                       sfp_phase_mon_threshold_lower <= regs_from_ipbus(16)( 7 downto 0);  
                                       sfp_phase_mon_threshold_upper <= regs_from_ipbus(16)(15 downto 8); 
   regs_to_ipbus(17)(15 downto  0)  <= sfp_phase_mon_stats; 
   regs_to_ipbus(17)(31 downto 16)  <= (others => '0');  
   
   --                                  (default: xxxx|xxxx|xxxx|xxxx|0000|0000|0000|0000)
                                       fmc1_phase_mon_threshold_lower <= regs_from_ipbus(18)( 7 downto 0);  
                                       fmc1_phase_mon_threshold_upper <= regs_from_ipbus(18)(15 downto 8); 
   regs_to_ipbus(19)(15 downto  0)  <= fmc1_phase_mon_stats; 
   regs_to_ipbus(19)(31 downto 16)  <= (others => '0');  
      
	-- reg_ctrl                         (default: xxxx|x0xx|1010|1010|xx11|xx0x|0111|x001)

	ics874003_fsel				            <= reg_ctrl( 0); 		-- default: 1 (fclka jitter cleaner output frequency 125MHz)
	ics874003_mr				            <= reg_ctrl( 1); 		-- default: 0 (fclka jitter cleaner normal mode)
	ics874003_oe				            <= reg_ctrl( 2); 		-- default: 0 (fclka jitter cleaner output disabled)
--									            	reg_ctrl( 3); 		--          x
--	(cdce)ipbus_pwrdown_i			      => reg_ctrl( 4),		-- default: 1 (powered up)
--	(cdce)ipbus_sel_i					      => reg_ctrl( 5), 		-- default: 1 (select primary clock)
--	(cdce)ipbus_sync_i				      => reg_ctrl( 6),		-- default: 1 (disable sync mode), rising edge needed
-- (cdce)ipbus_ctrl_i				      => reg_ctrl( 7))		-- default: 0 (ipbus controlled)
--	                                    <= reg_ctrl( 8); 		--          x
	tclkb_dr_en					            <= reg_ctrl( 9); 		-- default: 0 (disable tclkb -> mlvds)
--									            	reg_ctrl(10); 		--          x 
--									            	reg_ctrl(11); 		--          x 
	xpoint2_s10					            <= reg_ctrl(12);		-- default: 1 (OUT_1 driven by IN_4)
	xpoint2_s11					            <= reg_ctrl(13);		-- default: 1 (OUT_1 driven by IN_4)
--									            	reg_ctrl(14); 		--          x 
--									            	reg_ctrl(15); 		--          x 
	xpoint1_s10					            <= reg_ctrl(16); 	   -- default: 0 (xpoint_4x4 OUT_1 driven by IN_2)
	xpoint1_s11					            <= reg_ctrl(17); 	   -- default: 1  		 
	xpoint1_s20					            <= reg_ctrl(18); 	   -- default: 0 (xpoint_4x4 OUT_2 driven by IN_2)
	xpoint1_s21					            <= reg_ctrl(19); 	   -- default: 1  	 
	xpoint1_s30					            <= reg_ctrl(20); 	   -- default: 0 (xpoint_4x4 OUT_3 driven by IN_2)
	xpoint1_s31					            <= reg_ctrl(21); 	   -- default: 1  	
	xpoint1_s40					            <= reg_ctrl(22); 	   -- default: 0 (xpoint_4x4 OUT_4 driven by IN_2)
	xpoint1_s41					            <= reg_ctrl(23);	   -- default: 1
--									            	reg_ctrl(24); 		--          x 
--									            	reg_ctrl(25); 		--          x 
   gbt_phase_mon_reset                 <= reg_ctrl(26);	   -- default: 0 
--									            	reg_ctrl(27); 		--          x  
   v6_cpld(5)								   <=	reg_ctrl(28);	   -- default: 1 (fpga_program_b control)  
--									            	reg_ctrl(29); 		--          x  
--									            	reg_ctrl(30); 		--          x  
--									            	reg_ctrl(31); 		--          x  
   
	-- reg_status
	
	reg_status( 0)				            <= sfp_mod_abs(1);
	reg_status( 1)				            <= sfp_rxlos  (1);
	reg_status( 2)				            <= sfp_txfault(1);
	reg_status( 3)				            <= '0';
	reg_status( 4)				            <= sfp_mod_abs(2);
	reg_status( 5)				            <= sfp_rxlos  (2);
	reg_status( 6)				            <= sfp_txfault(2);
	reg_status( 7)				            <= '0';
	reg_status( 8)				            <= sfp_mod_abs(3);
	reg_status( 9)				            <= sfp_rxlos  (3);
	reg_status(10)				            <= sfp_txfault(3);
	reg_status(11)				            <= '0';
	reg_status(12)				            <= sfp_mod_abs(4);
	reg_status(13)				            <= sfp_rxlos  (4);
	reg_status(14)				            <= sfp_txfault(4);
	reg_status(15)				            <= '0';
	reg_status(16) 			            <= not gbe_int_n;
	reg_status(17)				            <= not fmc1_present_l;			
	reg_status(18) 			            <= not fmc2_present_l;				
	reg_status(19) 			            <= not fpga_reset_b;				
   reg_status(20)                      <=	v6_cpld(0);	
   reg_status(21)                      <=	v6_cpld(1);	
   reg_status(22)                      <=	v6_cpld(2);	
   reg_status(23)                      <=	v6_cpld(3);	
   reg_status(24)                      <=	v6_cpld(4);	
   reg_status(25)                      <=	'0';--v6_cpld(5);
	reg_status(26) 			            <= '0';	
	reg_status(27)				            <= cdce_pll_lock;
	reg_status(28)				            <= sfp_phase_mon_done;
	reg_status(29)				            <= sfp_phase_mon_phase_ok;
	reg_status(30)				            <= fmc1_phase_mon_done;
	reg_status(31)				            <= fmc1_phase_mon_phase_ok;
   
--===================================--

end system_core_arch;