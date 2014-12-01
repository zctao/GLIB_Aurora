------------------------------------------------------------------------------
-- (c) Copyright 2008 Xilinx, Inc. All rights reserved.
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
--
--  ERR_DETECT_4BYTE
--
--
--  Description : The ERR_DETECT module monitors the GTX to detect hard errors.
--                It accumulates the Soft errors according to the leaky bucket
--                algorithm described in the Aurora Specification to detect Hard
--                errors.  All errors are reported to the Global Logic Interface.
--
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_MISC.all;
use WORK.AURORA_PKG.all;

entity aurora8b10b_1_ERR_DETECT_4BYTE is

port (
    -- Lane Init SM Interface

        ENABLE_ERR_DETECT : in  std_logic;
        HARD_ERR_RESET    : out std_logic;

    -- Global Logic Interface

        SOFT_ERR          : out std_logic_vector(0 to 1);
        HARD_ERR          : out std_logic;

    -- GTX Interface

        RX_BUF_ERR          : in std_logic;
        RX_DISP_ERR         : in std_logic_vector(3 downto 0);
        RX_NOT_IN_TABLE     : in std_logic_vector(3 downto 0);
        TX_BUF_ERR          : in std_logic;
        RX_REALIGN          : in std_logic;

    -- System Interface

        USER_CLK            : in std_logic
     );

end aurora8b10b_1_ERR_DETECT_4BYTE;

architecture RTL of aurora8b10b_1_ERR_DETECT_4BYTE is

--Constant Declarations --

    constant DLY               : time := 1 ns;

-- VHDL out buffer logic --

    signal  SOFT_ERR_Buffer       : std_logic_vector(0 to 1);
    signal  HARD_ERR_Buffer       : std_logic;


-- Internal Register Declarations --

    signal  hard_err_gt                 : std_logic;
    signal  hard_err_frm_soft_err       : std_logic;
    signal  err_cnt_r                   : std_logic_vector(2 downto 0);
    signal  good_cnt_r                  : std_logic_vector(3 downto 0);
    signal  soft_err_r                  : std_logic_vector(0 to 3);

    -- FSM registers
    signal start_r                      : std_logic;
    signal cnt_soft_err_r               : std_logic;
    signal cnt_good_code_r              : std_logic;   

    signal next_start_c                 : std_logic; 
    signal next_soft_err_c              : std_logic;
    signal next_good_code_c             : std_logic;

begin

    -- VHDL Output Buffers --

    SOFT_ERR <= SOFT_ERR_Buffer;
    HARD_ERR <= HARD_ERR_Buffer;
   
-- Main Body of Code --

    -- Error Processing --

    -- Detect Soft Errors.  The lane is divided into 2 2-byte sublanes for this purpose.

    process(USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            -- Sublane 0
            soft_err_r(0) <= ENABLE_ERR_DETECT and (RX_DISP_ERR(3) or RX_NOT_IN_TABLE(3)) after DLY;
            soft_err_r(1) <= ENABLE_ERR_DETECT and (RX_DISP_ERR(2) or RX_NOT_IN_TABLE(2)) after DLY;

            -- Sublane 1
            soft_err_r(2) <= ENABLE_ERR_DETECT and (RX_DISP_ERR(1) or RX_NOT_IN_TABLE(1)) after DLY;
            soft_err_r(3) <= ENABLE_ERR_DETECT and (RX_DISP_ERR(0) or RX_NOT_IN_TABLE(0)) after DLY;

        end if;

    end process;


    process(USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            -- Sublane 0
            SOFT_ERR_Buffer(0) <= soft_err_r(0) or soft_err_r(1) after DLY;

            -- Sublane 1
            SOFT_ERR_Buffer(1) <= soft_err_r(2) or soft_err_r(3) after DLY;

        end if;

    end process;


    -- Detect Hard Errors

    process(USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            if(ENABLE_ERR_DETECT = '1') then

                hard_err_gt <= (RX_BUF_ERR or TX_BUF_ERR or RX_REALIGN) after DLY;

            else

                hard_err_gt <= '0' after DLY;

            end if;

        end if;

    end process;


    process(USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            if(ENABLE_ERR_DETECT = '0') then

                hard_err_frm_soft_err <= '0' after DLY;

            else

                hard_err_frm_soft_err <= err_cnt_r(2) after DLY;

            end if;

        end if;

    end process;


   HARD_ERR_Buffer  <= hard_err_gt or (err_cnt_r(2) AND (NOT hard_err_frm_soft_err));

    -- Assert hard error reset when there is a hard error.  This assignment
    -- just renames the two fanout branches of the hard error signal.

    HARD_ERR_RESET <= HARD_ERR_Buffer;

    --State registers for 1-hot state machine
    process(USER_CLK)
    begin
        if(USER_CLK'event and USER_CLK = '1') then
            if(ENABLE_ERR_DETECT = '0') then
                start_r           <=  '1' after DLY;
                cnt_soft_err_r    <=  '0' after DLY;
                cnt_good_code_r   <=  '0' after DLY;
	    else
                start_r           <=  next_start_c after DLY;
                cnt_soft_err_r    <=  next_soft_err_c after DLY;
                cnt_good_code_r   <=  next_good_code_c after DLY;
            end if;
        end if;
    end process;


  next_start_c      <=  (start_r AND not(OR_REDUCE(soft_err_r))) OR
			(cnt_good_code_r AND not(OR_REDUCE(soft_err_r)) AND (AND_REDUCE(good_cnt_r)));	

  next_soft_err_c   <=  (start_r AND (OR_REDUCE(soft_err_r))) OR
			(cnt_soft_err_r AND (OR_REDUCE(soft_err_r))) OR
			(cnt_good_code_r AND (OR_REDUCE(soft_err_r)));

  next_good_code_c  <=  (cnt_good_code_r AND NOT(OR_REDUCE(soft_err_r)) AND (NOT(AND_REDUCE(good_cnt_r)))) OR
	                (cnt_soft_err_r AND NOT(OR_REDUCE(soft_err_r)));


  process(USER_CLK)
  begin
    if(USER_CLK'event and USER_CLK = '1') then
      if(ENABLE_ERR_DETECT = '0') then
        err_cnt_r  <=  (others => '0') after DLY;
      elsif((err_cnt_r(2) OR ((std_bool(good_cnt_r=X"4") OR std_bool(good_cnt_r=X"8") OR std_bool(good_cnt_r=X"C")) AND std_bool(cnt_soft_err_r='1'))) = '1') then
        err_cnt_r  <=  err_cnt_r after DLY;
      elsif(((OR_REDUCE(err_cnt_r)) AND (std_bool(good_cnt_r=X"4") OR std_bool(good_cnt_r=X"8") OR std_bool(good_cnt_r=X"C"))) = '1') then
        err_cnt_r  <=  err_cnt_r - 1 after DLY;
      elsif(cnt_soft_err_r = '1') then
        err_cnt_r  <=  err_cnt_r + 1 after DLY;
      end if;
    end if;
  end process;


  process(USER_CLK)
  begin
    if(USER_CLK'event and USER_CLK = '1') then
      if(((NOT ENABLE_ERR_DETECT) OR cnt_soft_err_r OR start_r) = '1') then
        good_cnt_r  <=  (others => '0') after DLY;
      elsif(cnt_good_code_r = '1') then
        good_cnt_r  <=  good_cnt_r + 1 after DLY;
      else	
        good_cnt_r  <=  (others => '0') after DLY;
      end if;
    end if;
  end process;

end RTL;
