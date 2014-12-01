----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Peter W
-- 
-- Create Date:    08:52:34 06/13/2013 
-- Design Name: 
-- Module Name:    user_logic_ram - syn 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: single ported memory; using Xilinx templates; should
-- synthesize to a RAM.
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity user_logic_ram is
    generic (constant ADDR_WIDTH : integer := 5;
             constant DATA_WIDTH : integer := 32 );
    Port ( ADDRESS : in  STD_LOGIC_VECTOR (ADDR_WIDTH-1 downto 0);
           RESET   : in  STD_LOGIC;
           STROBE  : in  STD_LOGIC;
           ACK     : out STD_LOGIC;
           DIN     : in  STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
           DOUT    : out STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
           WE      : in  STD_LOGIC;
           CLOCK   : in STD_LOGIC);
end user_logic_ram;

architecture syn of user_logic_ram is

    type ram_type is array (2**ADDR_WIDTH-1 downto 0)
       of std_logic_vector (DATA_WIDTH-1 downto 0);
    signal RAM: ram_type := (others => (others => '0'));
begin
mem_process: process (CLOCK)
begin
   if (CLOCK'event and CLOCK = '1') then
      if (STROBE = '1') then
         if (WE = '1') then
            RAM(conv_integer(ADDRESS)) <= DIN;
         end if;
         DOUT <= RAM(conv_integer(ADDRESS));
      end if;
   end if;
end process;
ack_process:process(RESET,CLOCK) 
  variable ack_ctrl : std_logic_vector(2 downto 0);
begin 
  if RESET = '1' then 
    ack_ctrl :="000";
  elsif rising_edge(CLOCK) then 
    if STROBE = '1' and WE = '1' then
      ACK <= STROBE;
    else 
      case ack_ctrl is 
        when "000" => ACK <= '0';
                      if STROBE='1' then 
                        ACK <= '0';  ack_ctrl := "001";
                      end if;
        when "001" => ACK <= '0'; 	ack_ctrl := "010";
        when "010" => ACK <= '0';	ack_ctrl := "011";
        when "011" => ACK <= '1';	ack_ctrl := "100";
        when "100" => ACK <= '0';	ack_ctrl := "101";
        when "101" => ACK <= '0';	ack_ctrl := "000";
        when others =>
      end case;
    end if;
  end if;
end process;		
	
	

end syn;

