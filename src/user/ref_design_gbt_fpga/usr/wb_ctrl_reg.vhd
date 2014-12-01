library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.system_package.all;
--! user packages
use work.user_package.all;
use work.user_addr_decode.all;
use work.wb_package.all;


entity wb_ctrl_reg is
port
(
	wb_mosi			: in  	wb_mosi_bus;
	wb_miso			: out	wb_miso_bus;
	---------------
	ctrl_reg_o		: out	std_logic_vector(31 downto 0)
);
end wb_ctrl_reg;

architecture rtl of wb_ctrl_reg is

	signal ctrl_reg: std_logic_vector(31 downto 0);		
	signal sel: integer range 0 to 31;
	signal ack: std_logic;

begin

	--=============================--
	ctrl_reg_o 		<= ctrl_reg;
	--=============================--
	
	
	--=============================--
	process(wb_mosi.wb_rst, wb_mosi.wb_clk)
	--=============================--
	begin
	if wb_mosi.wb_rst='1' then
		ctrl_reg <= x"00000000";
		ack 		<= '0';
	elsif rising_edge(wb_mosi.wb_clk) then
		if wb_mosi.wb_stb='1' and wb_mosi.wb_we='1' then
			ctrl_reg <= wb_mosi.wb_dat;
		end if;
		wb_miso.wb_dat <= ctrl_reg;
		ack <= wb_mosi.wb_stb and (not ack);
	end if;
	end process;
	--=============================--
	wb_miso.wb_ack  <= ack;
	wb_miso.wb_err  <= '0';
	--=============================--

end rtl;