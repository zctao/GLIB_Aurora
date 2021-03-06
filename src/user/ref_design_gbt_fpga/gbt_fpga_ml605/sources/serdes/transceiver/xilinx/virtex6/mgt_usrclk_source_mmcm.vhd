------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 1.4
--  \   \         Application : Virtex-6 FPGA GTX Transceiver Wizard 
--  /   /         Filename : mgt_usrclk_source_mmcm.vhd
-- /___/   /\     Timestamp : 
-- \   \  /  \ 
--  \___\/\___\ 
--
--
-- Module MGT_USRCLK_SOURCE_MMCM (for use with Virtex-6 GTX Transceivers)
-- Generated by Xilinx Virtex-6 FPGA GTX Transceiver Wizard

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

--***********************************Entity Declaration*******************************
entity MGT_USRCLK_SOURCE_MMCM is
generic
(
    MULT                : real              := 2.0;
    DIVIDE              : integer           := 2;    
    CLK_PERIOD          : real              := 6.4;    
    OUT0_DIVIDE         : real              := 2.0;
    OUT1_DIVIDE         : integer           := 2;
    OUT2_DIVIDE         : integer           := 2;
    OUT3_DIVIDE         : integer           := 2
);
port
( 
    CLK0_OUT           : out std_logic;
    CLK1_OUT           : out std_logic;
    CLK2_OUT           : out std_logic;
    CLK3_OUT           : out std_logic;
    CLK_IN             : in  std_logic;
    MMCM_LOCKED_OUT    : out std_logic;
    MMCM_RESET_IN      : in  std_logic
);


end MGT_USRCLK_SOURCE_MMCM;

architecture RTL of MGT_USRCLK_SOURCE_MMCM is
--*********************************Wire Declarations**********************************

    signal   tied_to_ground_vec_i :   std_logic_vector(15 downto 0);
    signal   tied_to_ground_i     :   std_logic;
    signal   tied_to_vcc_i        :   std_logic;
    signal   clkout0_i            :   std_logic;
    signal   clkout1_i            :   std_logic;
    signal   clkout2_i            :   std_logic;
    signal   clkout3_i            :   std_logic;
    signal   clkfbout_i           :   std_logic;

begin

--*********************************** Beginning of Code *******************************

    --  Static signal Assigments    
    tied_to_ground_i         <= '0';
    tied_to_ground_vec_i     <= (others=>'0');
    tied_to_vcc_i            <= '1';

    -- Instantiate a MMCM module to divide the reference clock. Uses internal feedback
    -- for improved jitter performance, and to avoid consuming an additional BUFG
    mmcm_adv_i  : MMCM_ADV
    generic map
    (
         COMPENSATION     =>  "ZHOLD",
         CLKFBOUT_MULT_F  =>  MULT,
         DIVCLK_DIVIDE    =>  DIVIDE,
         CLKFBOUT_PHASE   =>  0.0,
         CLKIN1_PERIOD    =>  CLK_PERIOD,
         CLKIN2_PERIOD    =>  10.0,          -- Not used
         CLKOUT0_DIVIDE_F =>  OUT0_DIVIDE,
         CLKOUT0_PHASE    =>  0.0,
         CLKOUT1_DIVIDE   =>  OUT1_DIVIDE,
         CLKOUT1_PHASE    =>  0.0,
         CLKOUT2_DIVIDE   =>  OUT2_DIVIDE,
         CLKOUT2_PHASE    =>  0.0,
         CLKOUT3_DIVIDE   =>  OUT3_DIVIDE,
         CLKOUT3_PHASE    =>  0.0         
    )
    port map
    (
         CLKIN1          =>  CLK_IN,
         CLKIN2          =>  tied_to_ground_i,
         CLKINSEL        =>  tied_to_vcc_i,
         CLKFBIN         =>  clkfbout_i,
         CLKOUT0         =>  clkout0_i,
         CLKOUT0B        =>  open,
         CLKOUT1         =>  clkout1_i,
         CLKOUT1B        =>  open,
         CLKOUT2         =>  clkout2_i,
         CLKOUT2B        =>  open,
         CLKOUT3         =>  clkout3_i,
         CLKOUT3B        =>  open,
         CLKOUT4         =>  open,
         CLKOUT5         =>  open,
         CLKOUT6         =>  open,
         CLKFBOUT        =>  clkfbout_i,
         CLKFBOUTB       =>  open,
         CLKFBSTOPPED    =>  open,
         CLKINSTOPPED    =>  open,
         DO              =>  open,
         DRDY            =>  open,
         DADDR           =>  tied_to_ground_vec_i(6 downto 0),
         DCLK            =>  tied_to_ground_i,
         DEN             =>  tied_to_ground_i,
         DI              =>  tied_to_ground_vec_i(15 downto 0),
         DWE             =>  tied_to_ground_i,
         LOCKED          =>  MMCM_LOCKED_OUT,
         PSCLK           =>  tied_to_ground_i,
         PSEN            =>  tied_to_ground_i,        
         PSINCDEC        =>  tied_to_ground_i, 
         PSDONE          =>  open,         
         PWRDWN          =>  tied_to_ground_i,
         RST             =>  MMCM_RESET_IN     
    );
    
    
    clkout0_bufg_i  :  BUFG   
    port map
    (
        O      =>    CLK0_OUT, 
        I      =>    clkout0_i
    ); 


    clkout1_bufg_i  :  BUFG   
    port map
    (
        O      =>    CLK1_OUT,
        I      =>    clkout1_i
    );
    
    
    clkout2_bufg_i  :  BUFG   
    port map
    (
        O      =>    CLK2_OUT, 
        I      =>    clkout2_i
    ); 


    clkout3_bufg_i  :  BUFG   
    port map
    (
        O      =>    CLK3_OUT,
        I      =>    clkout3_i
    );    
    
end RTL;
 
