------------------------------------------------------------------------------
-- (c) Copyright 2010 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
--
------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

-- Circular FIFO for clock domain crossing

entity aurora8b10b_2_cir_fifo is

port
(
   RESET    : in  std_logic;
   WR_CLK   : in  std_logic;
   DIN      : in  std_logic;
   RD_CLK   : in  std_logic;
   DOUT     : out std_logic
);

end aurora8b10b_2_cir_fifo;

architecture BEHAVIORAL of aurora8b10b_2_cir_fifo is

  constant DLY             : time      := 1 ns;

  signal  mem    : std_logic_vector(7 downto 0);
  signal  wr_ptr : std_logic_vector(2 downto 0);
  signal  rd_ptr : std_logic_vector(2 downto 0);
 
begin

    process(WR_CLK, RESET)
    begin
        if(RESET = '1') then
            mem          <=   (others => '0') after DLY;
            wr_ptr       <=   (others => '0') after DLY; 
        elsif(WR_CLK'event and WR_CLK = '1') then
            mem(conv_integer(wr_ptr))  <=   din after DLY;
            wr_ptr       <=   wr_ptr + 1 after DLY; 
        end if;
    end process;

    process(RD_CLK, RESET)
    begin
        if(RESET = '1') then
            rd_ptr  <=   "100" after DLY; 
            dout    <=   '0'   after DLY;
        elsif(RD_CLK'event and RD_CLK = '1') then
            dout    <=   mem(conv_integer(rd_ptr)) after DLY;
            rd_ptr  <=   rd_ptr + 1 after DLY; 
        end if;
    end process;


end BEHAVIORAL;

-- Hot-plug logic
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_MISC.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity aurora8b10b_2_HOTPLUG is
generic
(
  ENABLE_HOTPLUG          : integer :=   1
);
port
(

  ---------------------- Sym Dec Interface -------------------------------
  RX_CC               : in    std_logic;
  RX_SP               : in    std_logic;
  RX_SPA              : in    std_logic;

  ----------------------  GT Wrapper Interface ----------------------------
  LINK_RESET_OUT      : out   std_logic_vector (1 downto 0);

  ----------------------  System Interface ----------------------------
  INIT_CLK            : in    std_logic;
  USER_CLK            : in    std_logic;
  RESET               : in    std_logic

);

end aurora8b10b_2_HOTPLUG;

architecture BEHAVIORAL of aurora8b10b_2_HOTPLUG is
  attribute core_generation_info               : string;
  attribute core_generation_info of BEHAVIORAL : architecture is "aurora8b10b_2,aurora_8b10b_v8_3,{user_interface=AXI_4_Streaming,backchannel_mode=Sidebands,c_aurora_lanes=1,c_column_used=left,c_gt_clock_1=GTXQ0,c_gt_clock_2=None,c_gt_loc_1=X,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=X,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=1,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=50000,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=125000,c_simplex=false,c_simplex_mode=TX,c_stream=false,c_ufc=false,flow_mode=None,interface_mode=Framing,dataflow_config=Duplex}";

--***********************************Parameter Declarations***************************

    constant DLY             : time      := 1 ns;

    signal   link_reset_0                   : std_logic;
    signal   link_reset_1                   : std_logic;
    signal   link_reset_r                   : std_logic_vector(1 downto 0);
    signal   count_for_reset_r              : std_logic_vector(19 downto 0) := "00000000000000000000";
    signal   rx_cc_comb_i                   : std_logic;
    signal   rx_sp_comb_i                   : std_logic;
    signal   rx_spa_comb_i                  : std_logic;

    -- component declaration
    component  aurora8b10b_2_cir_fifo
    port
    (
      reset     :  in  std_logic;
      wr_clk    :  in  std_logic;
      din       :  in  std_logic;
      rd_clk    :  in  std_logic;
      dout      :  out std_logic
    );	
    end component;   


begin

--*********************************Main Body of Code**********************************


   -- Clock domain crossing from USER_CLK to INIT_CLK
    rx_cc_cir_fifo_i  :  aurora8b10b_2_cir_fifo
    port map
    (
      reset     =>  RESET,
      wr_clk    =>  USER_CLK,
      din       =>  RX_CC,
      rd_clk    =>  INIT_CLK,
      dout      =>  rx_cc_comb_i
    );	   

    rx_sp_cir_fifo_i  :  aurora8b10b_2_cir_fifo
    port map
    (
      reset     =>  RESET,
      wr_clk    =>  USER_CLK,
      din       =>  RX_SP,
      rd_clk    =>  INIT_CLK,
      dout      =>  rx_sp_comb_i
    );	   


    rx_spa_cir_fifo_i  :  aurora8b10b_2_cir_fifo
    port map
    (
      reset     =>  RESET,
      wr_clk    =>  USER_CLK,
      din       =>  RX_SPA,
      rd_clk    =>  INIT_CLK,
      dout      =>  rx_spa_comb_i
    );	   

    -- Reset link if CC is not detected after 3000 clk cycles
    -- Wait for sufficient number of times to allow the link recovery and CC consumption
    -- This circuit for auto-recovery of the link during hot-plug scenario
    -- Incoming control characters are decoded to detmine CC reception
    -- RX_CC, RX_SP, RX_SPA are used as the reset for the count_for_reset_r, which would reset
    -- the link after the defined time.
    -- link_reset_0 is used to reset the GT & link_reset_1 is used
    -- to reset the Aurora lanes in order to reinitialize the lanes
    process(INIT_CLK)
    begin
        if(INIT_CLK'event and INIT_CLK = '1') then
            if((rx_cc_comb_i or rx_sp_comb_i or rx_spa_comb_i)= '1') then
                count_for_reset_r  <=  (others => '0') after DLY;
            else
                count_for_reset_r  <=  count_for_reset_r + 1 after DLY;
            end if;
        end if;
    end process;

      -- Wait for sufficient time : 2^20 = 1048576
      link_reset_0 <= '1' when ((count_for_reset_r > X"FF447") AND (count_for_reset_r < X"FFFFA")) else
                      '0'; -- 1045575 to 1048570
      link_reset_1 <= '1' when ((count_for_reset_r > X"FEC77") AND (count_for_reset_r < X"FFFFA")) else
                      '0'; -- 1043575 to 1048570

    process(INIT_CLK)
    begin
      if(INIT_CLK'event and INIT_CLK = '1') then
        link_reset_r <= (link_reset_1 & link_reset_0) after DLY;
      end if;
    end process;

hotplug_enable : if ENABLE_HOTPLUG = 1 generate

    process(INIT_CLK)
    begin
      if(INIT_CLK'event and INIT_CLK = '1') then
        LINK_RESET_OUT <= link_reset_r after DLY;
      end if;
    end process;

end generate hotplug_enable;


hotplug_disable : if ENABLE_HOTPLUG = 0 generate

      LINK_RESET_OUT <= "00";

end generate hotplug_disable;

end BEHAVIORAL;



