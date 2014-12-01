--=================================================================================================--
--==================================== Module Information =========================================--
--=================================================================================================--
--																																  	--
-- Company:  					CERN (PH-ESE-BE)																			--
-- Engineer: 					Manoel Barros Marin (manoel.barros.marin@cern.ch) (m.barros@ieee.org)	--
-- 																																--
-- Create Date:		    	08/02/2013     																			--
-- Project Name:				glib_gbt_link                   														--
-- Module Name:   		 	glib_gbt_link 							 													--
-- 																																--
-- Language:					VHDL'93                                      									--
--																																	--
-- Target Devices: 			GLIB (Virtex 6)   																		--
-- Tool versions: 			13.2                 																	--
--																																	--
-- Revision:		 			1.0 																							--
--																																	--
-- Additional Comments: 																									--
--																																	--
--=================================================================================================--
--=================================================================================================--
-- IEEE VHDL standard library:
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- Xilinx devices library:
library unisim;
use unisim.vcomponents.all;
-- Custom libraries and packages:
use work.system_gbt_link_package.all;
--=================================================================================================--
--======================================= Module Body =============================================-- 
--=================================================================================================--
entity glib_gbt_link is
	generic (
      NUM_LINKS                     : integer range 1 to 4 := 1;
      RX_GEARBOX                    : string(1 to 3)       := "ram" -- "ram" or "reg"   
	);	
	port (	
      -- Clocks:
      CLKS_I                        : in  gbt_link_clks_in;                                        
      CLKS_O                        : out gbt_link_clks_out;
      -- GBT encoder:
      GBT_ENC_I                     : in  gbt_enc_in_array (1 to NUM_LINKS); 
      GBT_ENC_O                     : out gbt_enc_out_array(1 to NUM_LINKS);
      -- GTX transceiver:
      GTX_I                         : in  gtx_in_array     (1 to NUM_LINKS);
      GTX_O                         : out gtx_out_array    (1 to NUM_LINKS); 
      -- GBT decoder:
      GBT_DEC_I                     : in  gbt_dec_in_array (1 to NUM_LINKS); 
      GBT_DEC_O                     : out gbt_dec_out_array(1 to NUM_LINKS)
	);
end glib_gbt_link;
architecture structural of glib_gbt_link is	
	--============================ Declarations ===========================--
	--Signals:	
   signal gtx_txoutclk  	        : std_logic_vector  (1 to NUM_LINKS);
   signal tx_wordclk    	        : std_logic;               
   signal rx_wordclk	              : std_logic_vector  (1 to NUM_LINKS);
   --------------------------------   
   signal frame_from_gbt_enc       : frame_120b_array  (1 to NUM_LINKS);
   signal word_from_gbt_enc        : word_array        (1 to NUM_LINKS);
   --------------------------------   
   signal aligned_from_gtx         : std_logic_vector  (1 to NUM_LINKS);
   signal word_from_gtx            : word_array        (1 to NUM_LINKS);
   --------------------------------   
   signal bit_slip_nbr_from_gbt_dec: rx_slide_nbr_array(1 to NUM_LINKS);
   signal aligned_from_gbt_dec     : std_logic_vector  (1 to NUM_LINKS);         
   --------------------------------
   signal rx_slide_to_gtx          : std_logic_vector  (1 to NUM_LINKS);
   signal rx_slide_from_gtx        : std_logic_vector  (1 to NUM_LINKS);
   signal rx_slide_run_to_gtx      : std_logic_vector  (1 to NUM_LINKS);
   signal rx_slide_nbr_to_gtx      : rx_slide_nbr_array(1 to NUM_LINKS);   
   
   signal rx_slide_enable_from_int : std_logic_vector  (1 to NUM_LINKS);
   signal rx_slide_ctrl_from_int	  : std_logic_vector  (1 to NUM_LINKS);
   signal rx_slide_run_from_int	  : std_logic_vector  (1 to NUM_LINKS);
   signal rx_slide_nbr_from_int	  : rx_slide_nbr_array(1 to NUM_LINKS);   
	--=====================================================================--		
--========================================================================--
-----		  --===================================================--
begin		--================== Architecture Body ==================-- 
-----		  --===================================================--
--========================================================================--
	--========================= Port Assignments ==========================--	
   CLKS_O.tx_word_clk               <= tx_wordclk;
   ------------------
   rx_word_clk_gen: for i in 1 to NUM_LINKS generate
   
      CLKS_O.rx_word_clk(i)         <= rx_wordclk(i);  
      ------------------   
      GBT_ENC_O(i).word             <= word_from_gbt_enc(i); 
      ------------------
      GTX_O(i).rx_data              <= word_from_gtx(i);
      GTX_O(i).phasealigndone       <= aligned_from_gtx(i);                  
      
   end generate;	   
   --=====================================================================--	
	--============================ User Logic =============================--	
	-- RX slide select:	
   rx_slide_sel_gen: for i in 1 to NUM_LINKS generate   
   
      rx_slide_to_gtx(i)      <= rx_slide_from_gtx(i)             when rx_slide_enable_from_int(i)='1'
                                 else '0'; 
                                 
      rx_slide_run_to_gtx(i)	<= rx_slide_run_from_int(i)         when
                                 (rx_slide_enable_from_int(i)='1' and rx_slide_ctrl_from_int(i)='1')
                                 else aligned_from_gbt_dec(i)	   when
                                 (rx_slide_enable_from_int(i)='1' and rx_slide_ctrl_from_int(i)='0')
                                 else '0';
      
      rx_slide_nbr_to_gtx(i)	<= rx_slide_nbr_from_int(i)         when
                                 (rx_slide_enable_from_int(i)='1' and rx_slide_ctrl_from_int(i)='1')
                                 else bit_slip_nbr_from_gbt_dec(i)when
                                 (rx_slide_enable_from_int(i)='1' and rx_slide_ctrl_from_int(i)='0')
                                 else "00000";			
   
   end generate;	
	--=====================================================================--	
	--===================== Component Instantiations ======================--   
   
   --==============--
   -- Clock scheme --
   --==============--
   
   tx_wordclk_bufg : bufg
		port map (
			o 								   => tx_wordclk, 
			i 								   => gtx_txoutclk(1)  
		);		
   
   
   --==========---
   -- GBT cores --
   --==========---
   
   core_gen: for i in 1 to NUM_LINKS generate
   
      -- GBT encoder:
      gbt_enc: entity work.gbt_tx
         port map( 
            TX_RESET_I 			      => GBT_ENC_I(i).reset,
            TX_WORD_CLK_I 		      => tx_wordclk,
            TX_FRAME_CLK_I 	      => CLKS_I.tx_frame_clk,
            TX_DATA_I 			      => GBT_ENC_I(i).data,
            ------------------------	                            
            TX_FRAME_O 			      => GBT_ENC_O(i).frame,
            TX_WORD_O 			      => word_from_gbt_enc(i), 
            TX_HEADER_O 		      => GBT_ENC_O(i).header
         );	                                 
         
      -- GTX transceiver:
		gtx: entity work.gtxWrapper
         port map(
            GTX_LOOPBACK_I			   => GTX_I(i).loopback,
            GTX_TX_POWERDOWN_I	   => GTX_I(i).tx_powerdown,
            GTX_RX_POWERDOWN_I	   => GTX_I(i).rx_powerdown,
            GTX_RESETDONE_O 		   => GTX_O(i).resetdone,
            GTX_PHASEALIGNDONE_O	   => aligned_from_gtx(i),
            ------------------------                              
            GTX_RXP_I 				   => GTX_I(i).rxp,
            GTX_RXN_I 				   => GTX_I(i).rxn,
            GTX_TX_REFCLK_I		   => CLKS_I.gtx_tx_refclk, 		
            GTX_RX_REFCLK_I		   => CLKS_I.gtx_rx_refclk,		
            GTX_TX_RESET_I 		   => GTX_I(i).tx_reset,
            GTX_RX_RESET_I 		   => GTX_I(i).rx_reset,
            GTX_TX_SYNC_RESET_I 	   => GTX_I(i).tx_sync_reset,
            GTX_RX_SYNC_RESET_I	   => GTX_I(i).rx_sync_reset,
            GTX_TX_DATA_I 			   => word_from_gbt_enc(i),
            ------------------------                              
            GTX_RX_SLIDE_I			   => rx_slide_to_gtx(i),		
            GTX_RX_SLIDE_RUN_I	   => rx_slide_run_to_gtx(i),
            GTX_RX_SLIDE_NBR_I	   => rx_slide_nbr_to_gtx(i),
            GTX_RX_SLIDE_O			   => rx_slide_from_gtx(i),		
            ------------------------                              
            GTX_TXP_O 				   => GTX_O(i).txp,
            GTX_TXN_O 				   => GTX_O(i).txn,
            GTX_TXOUTCLK_O			   => gtx_txoutclk(i),
            GTX_TXUSRCLK2_I		   => tx_wordclk,    
            GTX_RXUSRCLK2_O		   => rx_wordclk(i),    
            GTX_RX_DATA_O 			   => word_from_gtx(i),	
            ------------------------    
            GTX_TXDIFFCTRL_I		   => GTX_I(i).conf_diff,
            GTX_TXPOSTEMPHASIS_I	   => GTX_I(i).conf_pstemph,
            GTX_TXPREEMPHASIS_I	   => GTX_I(i).conf_preemph,	
            GTX_RXEQMIX_I			   => GTX_I(i).conf_eqmix,
            GTX_RXPOLARITY_I		   => GTX_I(i).conf_rxpol,
            GTX_TXPOLARITY_I		   =>	GTX_I(i).conf_txpol,
            ------------------------          	   
            GTX_DADDR_I             => GTX_I(i).drp_daddr, 
            GTX_DCLK_I              => CLKS_I.drp_dclk,
            GTX_DEN_I               => GTX_I(i).drp_den,
            GTX_DI_I                => GTX_I(i).drp_di,
            GTX_DRDY_O              => GTX_O(i).drp_drdy,
            GTX_DRPDO_O             => GTX_O(i).drp_drpdo,
            GTX_DWE_I               => GTX_I(i).drp_dwe,
            ------------------------    
            GTX_TXENPRBSTST_I       => GTX_I(i).prbs_txen, 
            GTX_RXENPRBSTST_I       => GTX_I(i).prbs_rxen,
            GTX_TXPRBSFORCEERR_I    => GTX_I(i).prbs_forcerr,
            GTX_RXPRBSERR_O         => GTX_O(i).prbs_rxerr,
            GTX_PRBSCNTRESET_I      => GTX_I(i).prbs_errcntrst          
         );              	
      
      -- GBT decoder:
      gbt_dec: entity work.gbt_rx
         generic map(
            RX_GEARBOX 				   => RX_GEARBOX)		
         port map(   
            RX_RESET_I 				   => GBT_DEC_I(i).reset,
            RX_WORD_CLK_I 			   => rx_wordclk(i),
            RX_FRAME_CLK_I 		   => CLKS_I.rx_frame_clk,                  
            RX_WORD_I 				   => word_from_gtx(i),                  
            RX_GTX_ALIGNED_I 		   => aligned_from_gtx(i),           
            ------------------------	                                                         
            RX_DATA_O 				   => GBT_DEC_O(i).data,                  
            RX_DATA_DV_O 			   => GBT_DEC_O(i).data_dv,               
            RX_BIT_SLIP_CMD_O 	   => GBT_DEC_O(i).bit_slip_cmd,          
            RX_BIT_SLIP_NBR_O 	   => bit_slip_nbr_from_gbt_dec(i),            
            RX_ALIGNED_O 			   => aligned_from_gbt_dec(i),                 
            RX_WRITE_ADDRESS_O 	   => GBT_DEC_O(i).write_address,         
            RX_FRAME_O 				   => GBT_DEC_O(i).frame,                 
            RX_FRAME_DV_O 			   => GBT_DEC_O(i).frame_dv,
            RX_HEADER_FLAG_O 		   => GBT_DEC_O(i).header_flag,
            RX_SHIFTEDWORD_O 		   => GBT_DEC_O(i).shiftedword 	
         );	   
         
      -- Control and status CDC:
      control_cdc: entity work.clk_domain_bridge
         generic map(
            N                       => 8)
         port map(
            WRCLK_I						=> CLKS_I.interface_clk,
            WDATA_I(7)					=> GTX_I(i).rx_slide_enable,		         
            WDATA_I(6)					=> GTX_I(i).rx_slide_ctrl,			
            WDATA_I(5)					=> GTX_I(i).rx_slide_run,
            WDATA_I(4 downto 0)		=> GTX_I(i).rx_slide_nbr,                    
            ------------------------
            RDCLK_I						=> rx_wordclk(i),
            RDATA_O(7)					=> rx_slide_enable_from_int(i),
            RDATA_O(6)					=> rx_slide_ctrl_from_int(i),	
            RDATA_O(5)					=> rx_slide_run_from_int(i),
            RDATA_O(4 downto 0)		=> rx_slide_nbr_from_int(i)	
         );   
      status_cdc: entity work.clk_domain_bridge
         generic map(
            N                       => 6)
         port map(
            WRCLK_I						=> rx_wordclk(i),
            WDATA_I(5)					=> aligned_from_gbt_dec(i),
            WDATA_I(4 downto 0)		=> bit_slip_nbr_from_gbt_dec(i),
            ------------------------
            RDCLK_I						=> CLKS_I.interface_clk,
            RDATA_O(5)					=> GBT_DEC_O(i).aligned,
            RDATA_O(4 downto 0)		=> GBT_DEC_O(i).bit_slip_nbr
         );
         
   end generate;   
	--=====================================================================--	
end structural;
--=================================================================================================--
--=================================================================================================--