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

entity user_logic is
port
(
	--================================--
	-- USER MGT REFCLKs
	--================================--
   -- BANK_112(Q0):  
   clk125_1_p	                        : in	  std_logic;  		    
   clk125_1_n	                        : in	  std_logic;  		  
   cdce_out0_p	                        : in	  std_logic;  		  
   cdce_out0_n	                        : in	  std_logic; 		  
   -- BANK_113(Q1):                 
   fmc2_clk0_m2c_xpoint2_p	            : in	  std_logic;
   fmc2_clk0_m2c_xpoint2_n	            : in	  std_logic;
   cdce_out1_p	                        : in	  std_logic;       
   cdce_out1_n	                        : in	  std_logic;         
   -- BANK_114(Q2):                 
   pcie_clk_p	                        : in	  std_logic; 			  
   pcie_clk_n	                        : in	  std_logic;			  
   cdce_out2_p  	                     : in	  std_logic;			  
   cdce_out2_n  	                     : in	  std_logic;			  
   -- BANK_115(Q3):                 
   clk125_2_i                          : in	  std_logic;		      
   clk125_2_bufg_i                     : in	  std_logic;       
   fmc1_gbtclk1_m2c_p	               : in	  std_logic;     
   fmc1_gbtclk1_m2c_n	               : in	  std_logic;     
   -- BANK_116(Q4):                 
   fmc1_gbtclk0_m2c_p	               : in	  std_logic;	  
   fmc1_gbtclk0_m2c_n	               : in	  std_logic;	  
   cdce_out3_p	                        : in	  std_logic;		  
   cdce_out3_n	                        : in	  std_logic;		    
   --================================--
	-- USER FABRIC CLOCKS
	--================================--
	xpoint1_clk1_i                      : in	  std_logic;	      
   xpoint1_clk3_p	                     : in	  std_logic;		   
   xpoint1_clk3_n	                     : in	  std_logic;		   
   ------------------------------------  
   cdce_out4_p                         : in	  std_logic;                
   cdce_out4_n                         : in	  std_logic;              
   ------------------------------------
   amc_tclkb_o					            : out	  std_logic;
   ------------------------------------      
   fmc1_clk0_m2c_xpoint2_p	            : in	  std_logic;
   fmc1_clk0_m2c_xpoint2_n	            : in	  std_logic;
   fmc1_clk1_m2c_p		               : in	  std_logic;	
   fmc1_clk1_m2c_n		               : in	  std_logic;	
   fmc1_clk2_bidir_p		               : in	  std_logic;	
   fmc1_clk2_bidir_n		               : in	  std_logic;	
   fmc1_clk3_bidir_p		               : in	  std_logic;	
   fmc1_clk3_bidir_n		               : in	  std_logic;	
   ------------------------------------
   fmc2_clk1_m2c_p	                  : in	  std_logic;		
   fmc2_clk1_m2c_n	                  : in	  std_logic;		
	--================================--
	-- GBT PHASE MONITORING MGT REFCLK
	--================================--
   cdce_out0_gtxe1_o                   : out   std_logic;  		  
   cdce_out3_gtxe1_o                   : out   std_logic;  
	--================================--
	-- AMC PORTS
	--================================--
   amc_port_tx_p				            : out	  std_logic_vector(1 to 15);
	amc_port_tx_n				            : out	  std_logic_vector(1 to 15);
	amc_port_rx_p				            : in	  std_logic_vector(1 to 15);
	amc_port_rx_n				            : in	  std_logic_vector(1 to 15);
	------------------------------------
	amc_port_tx_out			            : out	  std_logic_vector(17 to 20);	
	amc_port_tx_in				            : in	  std_logic_vector(17 to 20);		
	amc_port_tx_de				            : out	  std_logic_vector(17 to 20);	
	amc_port_rx_out			            : out	  std_logic_vector(17 to 20);	
	amc_port_rx_in				            : in	  std_logic_vector(17 to 20);	
	amc_port_rx_de				            : out	  std_logic_vector(17 to 20);	
	--================================--
	-- SFP QUAD
	--================================--
	sfp_tx_p						            : out	  std_logic_vector(1 to 4);
	sfp_tx_n						            : out	  std_logic_vector(1 to 4);
	sfp_rx_p						            : in	  std_logic_vector(1 to 4);
	sfp_rx_n						            : in	  std_logic_vector(1 to 4);
	sfp_mod_abs					            : in	  std_logic_vector(1 to 4);		
	sfp_rxlos					            : in	  std_logic_vector(1 to 4);		
	sfp_txfault					            : in	  std_logic_vector(1 to 4);				
	--================================--
	-- FMC1
	--================================--
	fmc1_tx_p					            : out	  std_logic_vector(1 to 4);
	fmc1_tx_n                           : out	  std_logic_vector(1 to 4);
	fmc1_rx_p                           : in	  std_logic_vector(1 to 4);
	fmc1_rx_n                           : in	  std_logic_vector(1 to 4);
	------------------------------------
	fmc1_io_pin					            : inout fmc_io_pin_type;
	------------------------------------
	fmc1_clk_c2m_p				            : out	  std_logic_vector(0 to 1);
	fmc1_clk_c2m_n				            : out	  std_logic_vector(0 to 1);
	fmc1_present_l				            : in	  std_logic;
	--================================--
	-- FMC2
	--================================--
	fmc2_io_pin					            : inout fmc_io_pin_type;
	------------------------------------
	fmc2_clk_c2m_p				            : out	  std_logic_vector(0 to 1);
	fmc2_clk_c2m_n				            : out	  std_logic_vector(0 to 1);
	fmc2_present_l				            : in	  std_logic;
   --================================--      
	-- SYSTEM GBE   
	--================================--      
   sys_eth_amc_p1_tx_p		            : in	  std_logic;	
   sys_eth_amc_p1_tx_n		            : in	  std_logic;	
   sys_eth_amc_p1_rx_p		            : out	  std_logic;	
   sys_eth_amc_p1_rx_n		            : out	  std_logic;	
	------------------------------------
	user_mac_syncacqstatus_i            : in	  std_logic_vector(0 to 3);
	user_mac_serdes_locked_i            : in	  std_logic_vector(0 to 3);
	--================================--   										
	-- SYSTEM PCIe				   												
	--================================--   
   sys_pcie_mgt_refclk_o	            : out	  std_logic;	  
   user_sys_pcie_dma_clk_i             : in	  std_logic;	  
   ------------------------------------
	sys_pcie_amc_tx_p		               : in	  std_logic_vector(0 to 3);    
   sys_pcie_amc_tx_n		               : in	  std_logic_vector(0 to 3);    
   sys_pcie_amc_rx_p		               : out	  std_logic_vector(0 to 3);    
   sys_pcie_amc_rx_n		               : out	  std_logic_vector(0 to 3);    
   ------------------------------------
	user_sys_pcie_slv_o	               : out   R_slv_to_ezdma2;									   	
	user_sys_pcie_slv_i	               : in    R_slv_from_ezdma2; 	   						    
	user_sys_pcie_dma_o                 : out   R_userDma_to_ezdma2_array  (1 to 7);		   					
	user_sys_pcie_dma_i                 : in 	  R_userDma_from_ezdma2_array(1 to 7);		   	
	user_sys_pcie_int_o 	               : out   R_int_to_ezdma2;									   	
	user_sys_pcie_int_i 	               : in    R_int_from_ezdma2; 								    
	user_sys_pcie_cfg_i 	               : in	  R_cfg_from_ezdma2; 								   	
	--================================--
	-- SRAMs
	--================================--
	user_sram_control_o		            : out	  userSramControlR_array(1 to 2);
	user_sram_addr_o			            : out	  array_2x21bit;
	user_sram_wdata_o			            : out	  array_2x36bit;
	user_sram_rdata_i			            : in 	  array_2x36bit;
	------------------------------------
   sram1_bwa                           : out	  std_logic;  
   sram1_bwb                           : out	  std_logic;  
   sram1_bwc                           : out	  std_logic;  
   sram1_bwd                           : out	  std_logic;  
   sram2_bwa                           : out	  std_logic;  
   sram2_bwb                           : out	  std_logic;  
   sram2_bwc                           : out	  std_logic;  
   sram2_bwd                           : out	  std_logic;    
   --================================--               
	-- CLK CIRCUITRY              
	--================================--    
   fpga_clkout_o	  			            : out	  std_logic;	
   ------------------------------------
   sec_clk_o		                     : out	  std_logic;	
	------------------------------------
	user_cdce_locked_i			         : in	  std_logic;
	user_cdce_sel_o			            : out	  std_logic;
	user_cdce_sync_o			            : out	  std_logic;
	--================================--  
	-- USER BUS  
	--================================--       
	wb_miso_o				               : out	  wb_miso_bus_array(0 to number_of_wb_slaves-1);
	wb_mosi_i				               : in 	  wb_mosi_bus_array(0 to number_of_wb_slaves-1);
	------------------------------------
	ipb_clk_i				               : in 	  std_logic;
	ipb_miso_o			                  : out	  ipb_rbus_array(0 to number_of_ipb_slaves-1);
	ipb_mosi_i			                  : in 	  ipb_wbus_array(0 to number_of_ipb_slaves-1);   
   --================================--
	-- VARIOUS
	--================================--
   reset_i						            : in	  std_logic;	    
   ------------------------------------   
   sn			                           : in    std_logic_vector(7 downto 0);	   
   ------------------------------------   
   amc_slot_i									: in    std_logic_vector( 3 downto 0);	   
	mac_addr_o 					            : out   std_logic_vector(47 downto 0);
   ip_addr_o					            : out   std_logic_vector(31 downto 0);
   ------------------------------------	
   user_v6_led_o                       : out	  std_logic_vector(1 to 2)
);                         	
end user_logic;
							
architecture user_logic_arch of user_logic is                      	


   --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
   --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
   --@@@@@@@@@ PLACE YOUR DECLARATIONS BELOW THIS COMMENT @@@@@@@@@@--
   --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
   --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--

   attribute keep                               : boolean; 
   
   --==============================================================================================--
   
   constant fmc1 				   						: integer := 0;
   constant sfp  											: integer := 1; 
   
   constant link1		   						      : integer := 1;
   constant link2									      : integer := 2;
   constant link3		   						      : integer := 3;
   constant link4									      : integer := 4;

   --==============================================================================================--
   
   type array_2x6bit is array (0 to 1) of std_logic_vector(5 downto 0);
   
   signal cdce_out0									   : std_logic;	
   signal cdce_out3								      : std_logic;   
   signal interface_clk							      : std_logic; 
   signal tx_frame_clk 						         : std_logic;
   signal rx_frame_clk	                        : std_logic;   
   
   signal gtx_txreset_from_gbt_link_rst	      : std_logic; 
   signal gtx_rxreset_from_gbt_link_rst	      : std_logic; 
   signal gbt_txreset_from_gbt_link_rst         : std_logic;
   signal gbt_rxreset_from_gbt_link_rst         : std_logic; 
   ------------------------------
   signal tx_reset_to_gtx  	                  : std_logic_vector(0 to 1); 
   signal rx_reset_to_gtx  	                  : std_logic_vector(0 to 1); 
   signal reset_to_gbt_enc                      : std_logic_vector(0 to 1);
   signal reset_to_gbt_dec                      : std_logic_vector(0 to 1);   
   
   signal regs_from_wb								   : array_64x32bit;
   signal regs_to_wb									   : array_64x32bit;
   
   signal scl_i         							   : std_logic;
   signal scl_o	      							   : std_logic;
   signal scl_oe_l      							   : std_logic;
   signal sda_i         							   : std_logic;
   signal sda_o         							   : std_logic;
   signal sda_oe_l      							   : std_logic;

   signal heartbeat_clka				            : std_logic;
   signal heartbeat_clkb				            : std_logic; 
	
   signal reg_i2c_settings						      : std_logic_vector(31 downto 0);		 
	signal reg_i2c_command						      : std_logic_vector(31 downto 0);		 
   signal reg_i2c_reply    					      : std_logic_vector(31 downto 0);
   ------------------------------
   signal reg_link_ctrl		                     : array_2x32bit;     
	signal reg_gtx_ctrl                          : array_2x32bit;
 	signal reg_bitslip_ctrl                      : array_2x32bit;
   signal reg_gbt_status                        : array_2x32bit;
   ------------------------------
	signal reg_slow_bert_ctrl                 	: array_2x32bit;   
   signal reg_slow_bert_status_words_lo      	: array_2x32bit;
   signal reg_slow_bert_status_words_hi      	: array_2x32bit;
   signal reg_slow_bert_status_errors_lo  	   : array_2x32bit;
   signal reg_slow_bert_status_errors_hi  	   : array_2x32bit;
   ------------------------------
   signal reg_fast_bert_ctrl                   	: array_2x32bit;
   signal reg_fast_bert_status_words_lo        	: array_2x32bit;
   signal reg_fast_bert_status_words_hi        	: array_2x32bit;
   signal reg_fast_bert_status_errors_lo       	: array_2x32bit;
   signal reg_fast_bert_status_errors_hi	      : array_2x32bit;
   ------------------------------
   signal reg_slow_bert_pd_pattern	            : array_2x32bit;  -- FMC1 not connected
   signal reg_slow_bert_pd_ctrl                 : array_2x32bit;  -- FMC1 not connected  
   ------------------------------ 
   signal reg_fast_bert_pd_pattern              : array_2x32bit;  -- FMC1 not connected
   signal reg_fast_bert_pd_ctrl                 : array_2x32bit;  -- FMC1 not connected 
   
   signal pg_data                               : std_logic_vector(83 downto 0);
   ------------------------------ 
   type   gbt_link_clks_in_array                is array(0 to 1) of gbt_link_clks_in;                              
   signal clks_to_gbt_link                      : gbt_link_clks_in_array;                                        
   type   gbt_link_clks_out_array               is array(0 to 1) of gbt_link_clks_out(1 to 1);                              
   signal clks_from_gbt_link                    : gbt_link_clks_out_array;
   ------------------------------   
   type   gbt_enc_in_2d_array                   is array(0 to 1) of gbt_enc_in_array(1 to 1);                              
   signal to_gbt_enc                            : gbt_enc_in_2d_array; 
   type   gbt_enc_out_2d_array                  is array(0 to 1) of gbt_enc_out_array(1 to 1);                              
   signal from_gbt_enc                          : gbt_enc_out_2d_array;
   ------------------------------   
   type   gtx_in_2d_array                       is array(0 to 1) of gtx_in_array(1 to 1);                              
   signal to_gtx                                : gtx_in_2d_array;
   type   gtx_out_2d_array                      is array(0 to 1) of gtx_out_array(1 to 1);                              
   signal from_gtx                              : gtx_out_2d_array; 
   ------------------------------   
   type   gbt_dec_in_2d_array                   is array(0 to 1) of gbt_dec_in_array(1 to 1);                              
   signal to_gbt_dec                            : gbt_dec_in_2d_array; 
   type   gbt_dec_out_2d_array                  is array(0 to 1) of gbt_dec_out_array(1 to 1);                              
   signal from_gbt_dec                          : gbt_dec_out_2d_array; 
   
   signal clear_if_to_slow_bert                 : std_logic_vector(0 to 1); 
   signal latch_if_to_slow_bert                 : std_logic_vector(0 to 1); 
   signal enable_if_to_slow_bert                : std_logic_vector(0 to 1); 
   signal load_if_to_slow_bert                  : std_logic_vector(0 to 1); 
   signal latency_if_to_slow_bert               : array_2x6bit;
   ------------------------------
   signal clear_if_to_fast_bert                 : std_logic_vector(0 to 1); 
   signal latch_if_to_fast_bert                 : std_logic_vector(0 to 1); 
   signal enable_if_to_fast_bert                : std_logic_vector(0 to 1); 
   signal load_if_to_fast_bert                  : std_logic_vector(0 to 1); 
   signal latency_if_to_fast_bert               : array_2x6bit;    
   
   signal fast_bert_pd_checkwidth               : array_2x8bit;
   signal fast_bert_pd_deassertdelay            : array_2x8bit;
   signal fast_bert_pd_enable                   : std_logic_vector(0 to 1);    
   signal pd_tx_flag_from_fast_bert             : std_logic_vector(0 to 1);
   signal pd_rx_flag_from_fast_bert             : std_logic_vector(0 to 1);
   ------------------------------            
   signal slow_bert_pd_checkwidth               : array_2x8bit;
   signal slow_bert_pd_deassertdelay            : array_2x8bit;
   signal slow_bert_pd_enable                   : std_logic_vector(0 to 1);    
   signal pd_tx_flag_from_slow_bert             : std_logic_vector(0 to 1);
   signal pd_rx_flag_from_slow_bert             : std_logic_vector(0 to 1);
   
   signal v6_led                                : std_logic_vector(1 to 2);
   ------------------------------      
   signal fmc2_led                              : std_logic_vector(1 to 4);
   signal fmc1_tx_disable                       : std_logic;
   signal fmc1_rate_sel                         : std_logic;
  
   --==============================================================================================--  
   
   constant usr_ver_major					         : integer range 0 to  15 :=  1;
   constant usr_ver_minor					         : integer range 0 to  15 :=  0;
   constant usr_ver_build					         : integer range 0 to 255 :=  0;
   constant usr_ver_year 					         : integer range 0 to  99 := 13;
   constant usr_ver_month					         : integer range 0 to  12 := 02;
   constant usr_ver_day  					         : integer range 0 to  31 := 15;


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

   mac_addr_o 				         <= x"080030F10000";  -- 08:00:30:F1:00:00 
   ip_addr_o				         <= x"c0a8006f";      -- 192.168.0.111


   --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
   --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
   --@@@@@@@@@@@@ PLACE YOUR LOGIC BELOW THIS COMMENT @@@@@@@@@@@@--
   --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
   --@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--


   --=====================--
	hb: entity work.heartbeat
	--=====================--
   generic map(                  period_clka     => 125000000,       period_clkb	    => 40000000)
   port	  map(reset => reset_i, clka            => clk125_2_bufg_i, clkb            => xpoint1_clk1_i,
                                 heartbeat_clka  => heartbeat_clka,  heartbeat_clkb  => heartbeat_clkb);
	--=====================--

   --====================================--	
	usr_i2c: entity work.i2c_master_no_iobuf -- (Used only when GLIB equipped with Versatile Link FMC (EDA-02420-V1-0) carrying a VTRx)
	--====================================--
	port map
	(
		clk			                => wb_mosi_i(user_wb_regs).wb_clk,
		reset			                => wb_mosi_i(user_wb_regs).wb_rst,
		--- i2c registers ----------       
		settings		                => reg_i2c_settings(12 downto 0),
		command		                => reg_i2c_command,
		reply			                => reg_i2c_reply,
		--- ctrl signals -----------       
		busy			                => open,
		----------------------------       
		scl_i(0)		                => scl_i,
		scl_i(1)		                =>	'0',		
		scl_o(0)		                =>	scl_o,	
		scl_o(1)		                =>	open,	
		scl_oe_l(0)	                =>	scl_oe_l,		
		scl_oe_l(1)	                =>	open,		
		sda_i(0)		                => sda_i,
		sda_i(1)		                => '0',
		sda_o(0)		                => sda_o,
		sda_o(1)		                => open,
		sda_oe_l(0)	                => sda_oe_l,
		sda_oe_l(1)	                => open
	); 			
	--====================================--
   
   --=============================--
	pg: entity work.pattern_generator -- (Example data traffic generation)
	--=============================--
	port map
	(
		clk_i 					       => tx_frame_clk,
		frame_o 					       => pg_data
	);		
	--=============================--	  
  	
	
	--==============================================================================================--
	--##############################################################################################--
	--##############################################################################################--
	--#### GBT LINK MODULES - BEGIN ################################################################--
	--##############################################################################################--
	--##############################################################################################--
 	--==============================================================================================--
  
   
   --==============================================================================================--
   -- Clock and Reset scheme 
   --==============================================================================================-- 
   
   --========--
   -- Common --
   --========--
   
   interface_clk                        <= wb_mosi_i(user_wb_regs).wb_clk;
   tx_frame_clk                         <= xpoint1_clk1_i;
   rx_frame_clk                         <= xpoint1_clk1_i;
  
   --==========--
   -- SFP QUAD --
   --==========--
   
   -- SFP quad GTX reference clock:
	sfp_gtxe1: ibufds_gtxe1 port map ( i => cdce_out0_p, ib => cdce_out0_n, o => cdce_out0, ceb => '0');
  
   -- SFP quad GBT phase monitoring:
   cdce_out0_gtxe1_o                    <= cdce_out0;     
   
   -- SFP GBT link clocks:
   clks_to_gbt_link(sfp).interface_clk  <= interface_clk;
   clks_to_gbt_link(sfp).gtx_tx_refclk	 <= cdce_out0;
   clks_to_gbt_link(sfp).gtx_rx_refclk  <= cdce_out0;	
   clks_to_gbt_link(sfp).tx_frame_clk	 <= tx_frame_clk;
   clks_to_gbt_link(sfp).rx_frame_clk   <= rx_frame_clk;
   clks_to_gbt_link(sfp).drp_dclk 	    <= '0';     

   --===========--
   -- FMC1 QUAD --
   --===========-- 
   
   -- FMC1 GTX reference clock:    
	fmc1_gtxe1: ibufds_gtxe1 port map (i => cdce_out3_p, ib => cdce_out3_n, o => cdce_out3, ceb => '0');
   
   -- FMC1 GBT phase monitoring:
   cdce_out3_gtxe1_o                    <= cdce_out3;      

   -- SFP GBT link clocks:
   clks_to_gbt_link(fmc1).interface_clk <= interface_clk;
   clks_to_gbt_link(fmc1).gtx_tx_refclk <= cdce_out3;
   clks_to_gbt_link(fmc1).gtx_rx_refclk <= cdce_out3;	
   clks_to_gbt_link(fmc1).tx_frame_clk	 <= tx_frame_clk;
   clks_to_gbt_link(fmc1).rx_frame_clk  <= rx_frame_clk;
   clks_to_gbt_link(fmc1).drp_dclk 	    <= '0';    
  
   --==============================================================================================--   
   
   --=======================================--
	gbt_link_rst: entity work.glibLink_rst_ctrl 
	--=======================================--
	port map 
	(
		clk_i 					   => interface_clk,                                               
		reset_i 					   =>	reset_i,                                                                      
		gtx_txreset_o 			   => gtx_txreset_from_gbt_link_rst,                              
		gtx_rxreset_o 			   => gtx_rxreset_from_gbt_link_rst,                             
		gbt_txreset_o 			   => gbt_txreset_from_gbt_link_rst,                                      
		gbt_rxreset_o 			   => gbt_rxreset_from_gbt_link_rst,                              
		busy_o 					   => open,                                                                         
		done_o 					   => open                                                                          
	);
	--=======================================--   

   to_gtx (sfp) (1).tx_reset  <= gtx_txreset_from_gbt_link_rst or tx_reset_to_gtx (sfp) ;
   to_gtx (fmc1)(1).tx_reset  <= gtx_txreset_from_gbt_link_rst or tx_reset_to_gtx (fmc1);
   to_gtx (sfp) (1).rx_reset  <= gtx_rxreset_from_gbt_link_rst or rx_reset_to_gtx (sfp) ;
   to_gtx (fmc1)(1).rx_reset  <= gtx_rxreset_from_gbt_link_rst or rx_reset_to_gtx (fmc1);
   to_gbt_enc(sfp) (1).reset  <= gbt_txreset_from_gbt_link_rst or reset_to_gbt_enc(sfp) ;
   to_gbt_enc(fmc1)(1).reset  <= gbt_txreset_from_gbt_link_rst or reset_to_gbt_enc(fmc1);
   to_gbt_dec(sfp) (1).reset  <= gbt_rxreset_from_gbt_link_rst or reset_to_gbt_dec(sfp) ;
   to_gbt_dec(fmc1)(1).reset  <= gbt_rxreset_from_gbt_link_rst or reset_to_gbt_dec(fmc1);   
   
   
   --==============================================================================================--
   -- GBT link instantiations
   --==============================================================================================--    
   
   to_gbt_enc(fmc1)(link1).data       <= pg_data;
   
   to_gtx(fmc1)(link1).drp_daddr      <= x"00";
   to_gtx(fmc1)(link1).drp_den        <= '0';
   to_gtx(fmc1)(link1).drp_di         <= x"0000";
   to_gtx(fmc1)(link1).drp_dwe		  <= '0';
   -----------------------------------
   to_gtx(fmc1)(link1).prbs_txen      <= "000";
   to_gtx(fmc1)(link1).prbs_rxen      <= "000";
   to_gtx(fmc1)(link1).prbs_forcerr   <= '0';
   to_gtx(fmc1)(link1).prbs_errcntrst <= '0';      
   
   --===============================--
   fmc1_quad: entity work.glib_gbt_link
   --===============================--
   generic map
   (	            
      num_links   			           => 1,    -- min: 1, max: 4 
      rx_gearbox   			           => "ram" -- "ram" or "reg"         
   )	               
   port map             
   (	               
      clks_i     			              => clks_to_gbt_link  (fmc1),                                  
      clks_o     			              => clks_from_gbt_link(fmc1),               
      --------------------------------
      gbt_enc_i  			              => to_gbt_enc  (fmc1),             
      gbt_enc_o   			           => from_gbt_enc(fmc1),             
      --------------------------------
      gtx_i       			           => to_gtx  (fmc1),              
      gtx_o       			           => from_gtx(fmc1),              
      --------------------------------
      gbt_dec_i   			           => to_gbt_dec  (fmc1),              
      gbt_dec_o   			           => from_gbt_dec(fmc1)              
   );
   --===============================-- 
   
   --==============================================================================================--   
  
   to_gbt_enc(sfp)(link1).data        <= pg_data;
   
   to_gtx(sfp)(link1).drp_daddr       <= x"00";
   to_gtx(sfp)(link1).drp_den         <= '0';
   to_gtx(sfp)(link1).drp_di          <= x"0000";
   to_gtx(sfp)(link1).drp_dwe		     <= '0';
   -----------------------------------
   to_gtx(sfp)(link1).prbs_txen       <= "000";
   to_gtx(sfp)(link1).prbs_rxen       <= "000";
   to_gtx(sfp)(link1).prbs_forcerr    <= '0';
   to_gtx(sfp)(link1).prbs_errcntrst  <= '0';    
  
   --===============================--
   sfp_quad: entity work.glib_gbt_link
   --===============================--
   generic map
   (	            
      num_links   			           => 1,    -- min: 1, max: 4
      rx_gearbox   			           => "ram" -- "ram" or "reg"         
   )	
   port map
   (	
      clks_i     			              => clks_to_gbt_link  (sfp),                                  
      clks_o     			              => clks_from_gbt_link(sfp),               
      --------------------------------
      gbt_enc_i  			              => to_gbt_enc  (sfp),             
      gbt_enc_o   			           => from_gbt_enc(sfp),             
      --------------------------------
      gtx_i       			           => to_gtx  (sfp),              
      gtx_o       			           => from_gtx(sfp),              
      --------------------------------
      gbt_dec_i   			           => to_gbt_dec  (sfp),              
      gbt_dec_o   			           => from_gbt_dec(sfp)              
   );
   --===============================-- 
 

	--==============================================================================================--
	--##############################################################################################--
	--##############################################################################################--
	--#### GBT LINK MODULES - END ##################################################################--
	--##############################################################################################--
	--##############################################################################################--
 	--==============================================================================================--

 
   --==============================================================================================--
   -- BERTs - example data processing
   --==============================================================================================--   
   
	gbt_link_bert_gen: for i in 0 to 1 generate      
     
      --===============================--
      fast_bert: entity work.bert_wrapper
      --===============================--
      generic map (n => 20)
      port map
      (
         -- Reset and clocks:
         reset_i			                               => reset_i,	                  
         tx_clk_i				                            => clks_from_gbt_link(i).tx_word_clk,	 	            
         rx_clk_i      		                            => clks_from_gbt_link(i).rx_word_clk(link1), 	            
         -- Data:             
         tx_data_i				                         => from_gbt_enc(i)(link1).word,				      
         rx_data_i	   		                         => from_gbt_dec(i)(link1).shiftedword,			       
         -- BERT:                   
         bert_tx_o_reg_o				                   => open,		                                          
         bert_rx_o_reg_o						             => open,                                              
         bert_number_of_words_o				             => open,	                                             
         bert_number_of_word_errors_o		             => open,                                              
         bert_word_error_o					                => open,                                              
         -- Pattern detector:                                                                                
         pd_tx_matchflag_o				                   => pd_tx_flag_from_fast_bert(i),            
         pd_rx_matchflag_o				                   => pd_rx_flag_from_fast_bert(i),                      
         -- Control/Status registers interface:                                                              
         reset_if_i					                      => wb_mosi_i(user_wb_regs).wb_rst,			            
         clk_if_i						                      => interface_clk,			            
         --------------------------------                                                        
         bert_enable_if_i				                   => enable_if_to_fast_bert(i),	          	
         bert_clear_if_i					                => clear_if_to_fast_bert(i),	             
         bert_load_if_i					                   => load_if_to_fast_bert(i),               
         bert_latch_if_i				                   => latch_if_to_fast_bert(i),	             	
         bert_latency_if_i				                   => latency_if_to_fast_bert(i),            
         bert_number_of_words_if_o(31 downto  0) 		 => reg_fast_bert_status_words_lo ( i),	
         bert_number_of_words_if_o(63 downto 32) 		 => reg_fast_bert_status_words_hi ( i),				
         bert_number_of_word_errors_if_o(31 downto  0) => reg_fast_bert_status_errors_lo( i),
         bert_number_of_word_errors_if_o(63 downto 32) => reg_fast_bert_status_errors_hi( i),
         --------------------------------
         pd_enable_if_i                                => fast_bert_pd_enable(i), 
         pd_checkwidth_if_i                            => fast_bert_pd_checkwidth(i),         
         pd_pattern_if_i                               => reg_fast_bert_pd_pattern(i)(19 downto 0),
         pd_deassertdelay_if_i                         => fast_bert_pd_deassertdelay(i)
      );                    	
      --===============================--
  
      --===============================--
      slow_bert: entity work.bert_wrapper
      --===============================--
      generic map (n => 84)
      port map
      (
         -- Reset and clocks:
         reset_i				                            => reset_i,                  
         tx_clk_i				                            => tx_frame_clk,		            
         rx_clk_i      		                            => rx_frame_clk,		                            
         -- Data:                                                                                       
         tx_data_i				                         => pg_data,				                                  
         rx_data_i	   		                         => from_gbt_dec(i)(link1).data,				                      
         -- BERT:                                                                                       
         bert_tx_o_reg_o				                   => open,		                                     
         bert_rx_o_reg_o						             => open,                                         
         bert_number_of_words_o				             => open,	                                        
         bert_number_of_word_errors_o		             => open,                                         
         bert_word_error_o					                => open,                                         
         -- Pattern detector:                                                                           
         pd_tx_matchflag_o				                   => pd_tx_flag_from_slow_bert(i),	                                        
         pd_rx_matchflag_o			                      => pd_rx_flag_from_slow_bert(i),	      
         -- Control/Status registers interface:
         reset_if_i					                      => wb_mosi_i(user_wb_regs).wb_rst,			      
         clk_if_i						                      => wb_mosi_i(user_wb_regs).wb_clk,			      
         --------------------------------            
         bert_enable_if_i				                   => enable_if_to_slow_bert(i),	
         bert_clear_if_i					                => clear_if_to_slow_bert(i),	
         bert_load_if_i					                   => load_if_to_slow_bert(i),
         bert_latch_if_i				                   => latch_if_to_slow_bert(i),	
         bert_latency_if_i				                   => latency_if_to_slow_bert(i),
         bert_number_of_words_if_o(31 downto  0) 		 => reg_slow_bert_status_words_lo (i),				
         bert_number_of_words_if_o(63 downto 32) 		 => reg_slow_bert_status_words_hi (i),				
         bert_number_of_word_errors_if_o(31 downto  0) => reg_slow_bert_status_errors_lo(i),
         bert_number_of_word_errors_if_o(63 downto 32) => reg_slow_bert_status_errors_hi(i),
         --------------------------------
         pd_enable_if_i                                => slow_bert_pd_enable(i), 
         pd_checkwidth_if_i                            => slow_bert_pd_checkwidth(i),         
         pd_pattern_if_i(31 downto  0)                 => reg_slow_bert_pd_pattern(i),
         pd_pattern_if_i(83 downto 32)                 => (others => '0'),   
         pd_deassertdelay_if_i                         => slow_bert_pd_deassertdelay(i)
      );                    	
      --===============================--
	
   end generate;   
   
   fast_bert_pd_checkwidth   (fmc1)                    <= (others => '0'); 
   fast_bert_pd_deassertdelay(fmc1)                    <= (others => '0'); 
   fast_bert_pd_enable       (fmc1)                    <= '0';
   reg_fast_bert_pd_pattern  (fmc1)                    <= (others => '0');
       
   slow_bert_pd_checkwidth   (fmc1)                    <= (others => '0');  
   slow_bert_pd_deassertdelay(fmc1)                    <= (others => '0');  
   slow_bert_pd_enable       (fmc1)                    <= '0';
   reg_slow_bert_pd_pattern  (fmc1)                    <= (others => '0');
   

	--==============================================================================================--
	-- Control and Status registers instantiation
   --==============================================================================================--
   
   --==============================--
	wb_regs: entity work.wb_user_regs
	--==============================--
	port map
	(
		wb_mosi                             => wb_mosi_i(user_wb_regs),
		wb_miso                             => wb_miso_o(user_wb_regs),
		-------------------------------              
		regs_o                              => regs_from_wb,
		regs_i                              => regs_to_wb
	);
	--==============================--	
   
   --==================--
   -- Register mapping --
   --==================--
   
	regs_to_wb( 0)			                  <= x"55534552"; --"USER"	
	regs_to_wb( 1)			                  <= x"56545278"; --"VTRx"	
	regs_to_wb( 2)			                  <= std_logic_vector(to_unsigned(usr_ver_major,4)) &
                                             std_logic_vector(to_unsigned(usr_ver_minor,4)) &
                                             std_logic_vector(to_unsigned(usr_ver_build,8)) &
                                             std_logic_vector(to_unsigned(usr_ver_year ,7)) &
                                             std_logic_vector(to_unsigned(usr_ver_month,4)) &
                                             std_logic_vector(to_unsigned(usr_ver_day  ,5)) ;   
--	reg_wb    ( 3) -----------------------   
	regs_to_wb( 4)				               <= reg_gbt_status (fmc1);
      reg_gbt_status(fmc1)(8)             <=    from_gbt_dec(fmc1)(link1).aligned;
      reg_gbt_status(fmc1)(4 downto 0)    <=    from_gbt_dec(fmc1)(link1).bit_slip_nbr;
	--------------------------------------
   regs_to_wb( 5)				               <= reg_slow_bert_status_words_lo (fmc1);	
	regs_to_wb( 6)				               <= reg_slow_bert_status_words_hi (fmc1);	
	regs_to_wb( 7)				               <= reg_slow_bert_status_errors_lo(fmc1);	
	regs_to_wb( 8)				               <= reg_slow_bert_status_errors_hi(fmc1);	
--	reg_wb    ( 9) -----------------------                   
	regs_to_wb(10)				               <= reg_gbt_status (sfp);
      reg_gbt_status(sfp)(8)              <=    from_gbt_dec(sfp)(link1).aligned;
      reg_gbt_status(sfp)(4 downto 0)     <=    from_gbt_dec(sfp)(link1).bit_slip_nbr;	
	--------------------------------------
   regs_to_wb(11)				               <= reg_slow_bert_status_words_lo (sfp);	
	regs_to_wb(12)				               <= reg_slow_bert_status_words_hi (sfp);	
	regs_to_wb(13)				               <= reg_slow_bert_status_errors_lo(sfp);	
	regs_to_wb(14)				               <= reg_slow_bert_status_errors_hi(sfp);	
   --------------------------------------                     
	regs_to_wb(15)				               <= reg_i2c_reply;
   --------------------------------------                     
	reg_bitslip_ctrl(fmc1)	               <= regs_from_wb(16);
      to_gtx(fmc1)(link1).rx_slide_enable	<=    reg_bitslip_ctrl(fmc1)(16);   	
      to_gtx(fmc1)(link1).rx_slide_ctrl	<=    reg_bitslip_ctrl(fmc1)(12);  	
      to_gtx(fmc1)(link1).rx_slide_run    <=    reg_bitslip_ctrl(fmc1)( 8);   
      to_gtx(fmc1)(link1).rx_slide_nbr    <=    reg_bitslip_ctrl(fmc1)( 4 downto 0);      
   --------------------------------------                  
	reg_link_ctrl(fmc1)		               <= regs_from_wb(17);
      to_gtx(fmc1)(link1).loopback 			<=	   reg_link_ctrl(fmc1)(30 downto 28);	
      to_gtx(fmc1)(link1).rx_powerdown		<=	   reg_link_ctrl(fmc1)(13 downto 12);
      reset_to_gbt_dec(fmc1)		         <=    reg_link_ctrl(fmc1)(10);      
      to_gtx(fmc1)(link1).rx_sync_reset	<=	   reg_link_ctrl(fmc1)( 9);    
      rx_reset_to_gtx(fmc1)     			   <=	   reg_link_ctrl(fmc1)( 8);	
      to_gtx(fmc1)(link1).tx_powerdown		<=	   reg_link_ctrl(fmc1)( 5 downto  4);	
      reset_to_gbt_enc(fmc1)		         <=    reg_link_ctrl(fmc1)( 2);   
      to_gtx(fmc1)(link1).tx_sync_reset	<=	   reg_link_ctrl(fmc1)( 1);	
      tx_reset_to_gtx(fmc1)		         <=	   reg_link_ctrl(fmc1)( 0);	
-- reg_wb    (18) -----------------------
	reg_gtx_ctrl(fmc1) 		               <= regs_from_wb(19);
      to_gtx(fmc1)(link1).conf_txpol   	<=    reg_gtx_ctrl(fmc1)(24);   
      to_gtx(fmc1)(link1).conf_rxpol		<=    reg_gtx_ctrl(fmc1)(20);   
      to_gtx(fmc1)(link1).conf_eqmix      <=    reg_gtx_ctrl(fmc1)(18 downto 16);   
      to_gtx(fmc1)(link1).conf_preemph	   <=    reg_gtx_ctrl(fmc1)(15 downto 12);   
      to_gtx(fmc1)(link1).conf_pstemph	   <=    reg_gtx_ctrl(fmc1)( 8 downto  4); 
      to_gtx(fmc1)(link1).conf_diff		   <=    reg_gtx_ctrl(fmc1)( 3 downto  0);     
   --------------------------------------      
	reg_slow_bert_ctrl        (fmc1)	      <= regs_from_wb(20);
      clear_if_to_slow_bert  (fmc1)		   <=    reg_slow_bert_ctrl(fmc1)(20);		
      latch_if_to_slow_bert  (fmc1)		   <=    reg_slow_bert_ctrl(fmc1)(16);	
      enable_if_to_slow_bert (fmc1)		   <=    reg_slow_bert_ctrl(fmc1)(12);	
      load_if_to_slow_bert   (fmc1)		   <=    reg_slow_bert_ctrl(fmc1)( 8);		
      latency_if_to_slow_bert(fmc1)		   <=    reg_slow_bert_ctrl(fmc1)( 5 downto 0);    
--	reg_wb    (21)	-----------------------			            	      
--	reg_wb    (22)	-----------------------			            	      
--	reg_wb    (23)	-----------------------			            	      
	reg_bitslip_ctrl(sfp)		            <=	regs_from_wb(24);
      to_gtx(sfp)(link1).rx_slide_enable 	<=    reg_bitslip_ctrl(sfp)(16);      	
      to_gtx(sfp)(link1).rx_slide_ctrl		<=    reg_bitslip_ctrl(sfp)(12);    	
      to_gtx(sfp)(link1).rx_slide_run     <=    reg_bitslip_ctrl(sfp)( 8);   
      to_gtx(sfp)(link1).rx_slide_nbr     <=    reg_bitslip_ctrl(sfp)( 4 downto 0);   
   --------------------------------------      
	reg_link_ctrl(sfp)		               <= regs_from_wb(25);
      to_gtx(sfp)(link1).loopback 		   <=	   reg_link_ctrl(sfp)(30 downto 28);	
      to_gtx(sfp)(link1).rx_powerdown	   <=	   reg_link_ctrl(sfp)(13 downto 12);	
      reset_to_gbt_dec(sfp)		         <=    reg_link_ctrl(sfp)(10);  
      to_gtx(sfp)(link1).rx_sync_reset	   <=	   reg_link_ctrl(sfp)( 9);
      rx_reset_to_gtx(sfp)	      	      <=	   reg_link_ctrl(sfp)( 8);	
      to_gtx(sfp)(link1).tx_powerdown	   <=	   reg_link_ctrl(sfp)( 5 downto  4);	
      reset_to_gbt_enc(sfp) 		         <=    reg_link_ctrl(sfp)( 2);
      to_gtx(sfp)(link1).tx_sync_reset 	<=	   reg_link_ctrl(sfp)( 1);	
      tx_reset_to_gtx(sfp) 		         <=	   reg_link_ctrl(sfp)( 0);	
-- reg_wb    (26) -----------------------
	reg_gtx_ctrl(sfp) 			            <= regs_from_wb(27);
      to_gtx(sfp)(link1).conf_txpol 	   <=    reg_gtx_ctrl(sfp)(24);   
      to_gtx(sfp)(link1).conf_rxpol		   <=    reg_gtx_ctrl(sfp)(20);   
      to_gtx(sfp)(link1).conf_eqmix       <=    reg_gtx_ctrl(sfp)(18 downto 16);   
      to_gtx(sfp)(link1).conf_preemph	   <=    reg_gtx_ctrl(sfp)(15 downto 12);   
      to_gtx(sfp)(link1).conf_pstemph	   <=    reg_gtx_ctrl(sfp)( 8 downto  4); 
      to_gtx(sfp)(link1).conf_diff		   <=    reg_gtx_ctrl(sfp)( 3 downto  0);   
   --------------------------------------      
	reg_slow_bert_ctrl        (sfp)        <= regs_from_wb(28);
      clear_if_to_slow_bert  (sfp)  	   <=    reg_slow_bert_ctrl(sfp)(20);		
      latch_if_to_slow_bert  (sfp)		   <=    reg_slow_bert_ctrl(sfp)(16);	
      enable_if_to_slow_bert (sfp)		   <=    reg_slow_bert_ctrl(sfp)(12);	
      load_if_to_slow_bert   (sfp)		   <=    reg_slow_bert_ctrl(sfp)( 8);		
      latency_if_to_slow_bert(sfp)		   <=    reg_slow_bert_ctrl(sfp)( 5 downto 0);   
--	reg_wb    (29) ----------------------- 
   reg_i2c_settings			               <=	regs_from_wb(30);   
	reg_i2c_command			               <=	regs_from_wb(31);	
--	reg_wb    (32+ 0)	--------------------		      
--	reg_wb    (32+ 1)	--------------------		      
--	reg_wb    (32+ 2) --------------------			      
--	reg_wb    (32+ 3)	--------------------		      
--	reg_wb    (32+ 4)	--------------------			      
	regs_to_wb(32+ 5)			               <= reg_fast_bert_status_words_lo (fmc1);	
	regs_to_wb(32+ 6)			               <= reg_fast_bert_status_words_hi (fmc1);	
	regs_to_wb(32+ 7)			               <= reg_fast_bert_status_errors_lo(fmc1);	
	regs_to_wb(32+ 8)			               <= reg_fast_bert_status_errors_hi(fmc1);	
--	rego_wb   (32+ 9)	--------------------			            	      
--	reg_wb    (32+10)	--------------------		                  
	regs_to_wb(32+11)			               <= reg_fast_bert_status_words_lo (sfp);	
	regs_to_wb(32+12)			               <= reg_fast_bert_status_words_hi (sfp);	
	regs_to_wb(32+13)			               <= reg_fast_bert_status_errors_lo(sfp);	
	regs_to_wb(32+14)			               <= reg_fast_bert_status_errors_hi(sfp);	
--	reg_wb    (32+15)	--------------------		      
--	reg_wb    (32+16)	--------------------      
--	reg_wb    (32+17)	--------------------      
--	reg_wb    (32+18)	--------------------      
--	reg_wb    (32+19)	--------------------      
	reg_fast_bert_ctrl           (fmc1)	   <= regs_from_wb(32+20);                                                
      clear_if_to_fast_bert     (fmc1)    <=    reg_fast_bert_ctrl(fmc1)(20);		                                	
      latch_if_to_fast_bert     (fmc1)    <=    reg_fast_bert_ctrl(fmc1)(16);	                                   	
      enable_if_to_fast_bert    (fmc1)    <=    reg_fast_bert_ctrl(fmc1)(12);	                                   	
      load_if_to_fast_bert      (fmc1)    <=    reg_fast_bert_ctrl(fmc1)( 8);		                                	
      latency_if_to_fast_bert   (fmc1)    <=    reg_fast_bert_ctrl(fmc1)( 5 downto 0);    
--	reg_wb    (32+21) --------------------				      
--	reg_wb    (32+22)	--------------------			      
--	reg_wb    (32+23)	--------------------   
   reg_slow_bert_pd_pattern     (sfp)     <=	regs_from_wb(32+24);   
   reg_slow_bert_pd_ctrl        (sfp)     <= regs_from_wb(32+25);   
      slow_bert_pd_enable       (sfp)     <=    reg_slow_bert_pd_ctrl(sfp)(16);   
      slow_bert_pd_deassertdelay(sfp)     <=    reg_slow_bert_pd_ctrl(sfp)(15 downto 8);   
      slow_bert_pd_checkwidth   (sfp)     <=    reg_slow_bert_pd_ctrl(sfp)( 7 downto 0);   
-- reg_wb    (32+26) --------------------               
-- reg_wb    (32+27) --------------------               
	reg_fast_bert_ctrl           (sfp)     <= regs_from_wb(32+28);  
      clear_if_to_fast_bert     (sfp)     <=    reg_fast_bert_ctrl(sfp)(20);		
      latch_if_to_fast_bert     (sfp) 	   <=    reg_fast_bert_ctrl(sfp)(16);	
      enable_if_to_fast_bert    (sfp) 	   <=    reg_fast_bert_ctrl(sfp)(12);	
      load_if_to_fast_bert      (sfp) 	   <=    reg_fast_bert_ctrl(sfp)( 8);		
      latency_if_to_fast_bert   (sfp) 	   <=    reg_fast_bert_ctrl(sfp)( 5 downto 0);
-- reg_wb    (32+29) --------------------			      
   reg_fast_bert_pd_pattern     (sfp)     <=	regs_from_wb(32+30);
   reg_fast_bert_pd_ctrl        (sfp)     <=	regs_from_wb(32+31);  
      fast_bert_pd_enable       (sfp)     <=    reg_fast_bert_pd_ctrl(sfp)(16);   
      fast_bert_pd_deassertdelay(sfp)     <=    reg_fast_bert_pd_ctrl(sfp)(15 downto 8);      
      fast_bert_pd_checkwidth   (sfp)     <=    reg_fast_bert_pd_ctrl(sfp)( 7 downto 0);

	
	--==============================================================================================--
	-- IO mapping
	--==============================================================================================--
   
   --===================--
   -- GTXs serial lanes --
   --===================--   
   
   to_gtx(fmc1)(link1).rxp <= fmc1_rx_p(1);
   to_gtx(fmc1)(link1).rxn <= fmc1_rx_n(1);
   fmc1_tx_p(1)            <= from_gtx(fmc1)(link1).txp;
   fmc1_tx_n(1)            <= from_gtx(fmc1)(link1).txn;
   
   to_gtx(sfp)(link1).rxp  <= sfp_rx_p(1);
   to_gtx(sfp)(link1).rxn  <= sfp_rx_n(1);
   sfp_tx_p(1)             <= from_gtx(sfp)(link1).txp;  
   sfp_tx_n(1)             <= from_gtx(sfp)(link1).txn;    
   
   --===============--
   -- On-board LEDs --
   --===============--   
   
   v6_led(1)           <= from_gtx(sfp)(link1).resetdone      and from_gtx(fmc1)(link1).resetdone;
   v6_led(2)           <= from_gtx(sfp)(link1).phasealigndone and from_gtx(fmc1)(link1).phasealigndone;
   v6_led_1_obuf: obuf generic map(iostandard => "lvcmos25") port map(o => user_v6_led_o(1), i => v6_led(1));   
   v6_led_2_obuf: obuf generic map(iostandard => "lvcmos25") port map(o => user_v6_led_o(2), i => v6_led(2));   
   
   --==========--
   -- FMC2 LEDs -- (Only valid with FM-S14 Quad SFP FMC card )
   --==========--
   
   fmc2_led(1)	        <= heartbeat_clka;      
   fmc2_led(2)	        <= heartbeat_clkb;
   fmc2_led(3)	        <= user_mac_syncacqstatus_i(phy)  and user_mac_serdes_locked_i(phy);
   fmc2_led(4)	        <= user_mac_syncacqstatus_i(fmc2) and user_mac_serdes_locked_i(fmc2);
   fmc2_la_p_18_obuf:  obuf generic map(iostandard => "lvcmos25") port map(o => fmc2_io_pin.la_p(18), i => fmc2_led(1));   
   fmc2_la_n_18_obuf:  obuf generic map(iostandard => "lvcmos25") port map(o => fmc2_io_pin.la_n(18), i => fmc2_led(2));   
   fmc2_la_p_19_obuf:  obuf generic map(iostandard => "lvcmos25") port map(o => fmc2_io_pin.la_p(19), i => fmc2_led(3));
   fmc2_la_n_19_obuf:  obuf generic map(iostandard => "lvcmos25") port map(o => fmc2_io_pin.la_n(19), i => fmc2_led(4));
   
   --================--
   -- FMC1 SFP1 CTRL -- (Only valid with FM-S14 Quad SFP FMC card )
   --================-- 
   
   
   fmc1_tx_disable     <= '0';        
   fmc1_rate_sel       <= '0';	
   fmc1_la_n_6_obuf:   obuf generic map(iostandard => "lvcmos25") port map(o => fmc1_io_pin.la_n(6), i => fmc1_tx_disable);
   fmc1_la_n_4_obuf:   obuf generic map(iostandard => "lvcmos25") port map(o => fmc1_io_pin.la_n(4), i => fmc1_rate_sel);   
   
   --============--
   -- I2C module -- (Used only when GLIB equipped with Versatile Link FMC (EDA-02420-V1-0) carrying a VTRx)
   --============--  
   
   fmc1_la_p_15_iobuf: iobuf generic map(iostandard => "lvcmos25")
                             port map   (io => fmc1_io_pin.la_p(15), i => scl_o, o => scl_i, t => scl_oe_l);   
   fmc1_la_n_19_iobuf: iobuf generic map(iostandard => "lvcmos25")
                             port map   (io => fmc1_io_pin.la_n(19), i => sda_o, o => sda_i, t => sda_oe_l);   
   

   --==============================================================================================--
   -- Debugging
   --==============================================================================================--    
   
   --===================--
   -- Clocks forwarding --
   --===================--      
   
   -- TX frame clock: (Note!!! tclkb_dr_en must be enabled through system ipbus)
   tx_frame_clk_obuf:    obuf generic map (drive => 24, iostandard => "lvcmos25", slew => "fast") 
                              port map    (o => amc_tclkb_o,       i => tx_frame_clk);
   
   -- SFP clocks forwarding:   
   sfp_tx_wordclk_obuf:  obuf generic map (drive => 24, iostandard => "lvcmos25", slew => "fast") 
                              port map    (o => amc_port_tx_p(12), i => clks_from_gbt_link(sfp).tx_word_clk);     
   sfp_rx_wordclk_obuf:  obuf generic map (drive => 24, iostandard => "lvcmos25", slew => "fast") 
                              port map    (o => amc_port_tx_n(12), i => clks_from_gbt_link(sfp).rx_word_clk(1));
   -- FMC1 clocks forwarding: 
   fmc1_tx_wordclk_obuf: obuf generic map (drive => 24, iostandard => "lvcmos25", slew => "fast") 
                              port map    (o => amc_port_tx_p(13), i => clks_from_gbt_link(fmc1).tx_word_clk);    
   fmc1_rx_wordclk_obuf: obuf generic map (drive => 24, iostandard => "lvcmos25", slew => "fast") 
                              port map    (o => amc_port_tx_n(13), i => clks_from_gbt_link(fmc1).rx_word_clk(1));    

   --========================--
   -- Pattern detector flags --
   --========================--     
   
   -- SFP GBT link core 1 pattern detector flags:
   sfp_fast_pd_tx_flag_obuf: obuf generic map ( drive => 24, iostandard => "lvcmos25", slew => "fast")
                                  port map    ( o => amc_port_tx_p(14), i => pd_tx_flag_from_fast_bert(sfp));
   sfp_fast_pd_rx_flag_obuf: obuf generic map ( drive => 24, iostandard => "lvcmos25", slew => "fast")
                                  port map    ( o => amc_port_tx_n(14), i => pd_rx_flag_from_fast_bert(sfp));    
   
   sfp_slow_pd_tx_flag_obuf: obuf generic map ( drive => 24, iostandard => "lvcmos25", slew => "fast")
                                  port map    ( o => amc_port_tx_p(15), i => pd_tx_flag_from_slow_bert(sfp));
   sfp_slow_pd_rx_flag_obuf: obuf generic map ( drive => 24, iostandard => "lvcmos25", slew => "fast")
                                  port map    ( o => amc_port_tx_n(15), i => pd_rx_flag_from_slow_bert(sfp));            

   --==============================================================================================--

end user_logic_arch;