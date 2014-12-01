library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.user_package.all;

package user_addr_decode is

	function user_wb_addr_sel (signal addr : in std_logic_vector(31 downto 0)) return integer;
	function user_ipb_addr_sel(signal addr : in std_logic_vector(31 downto 0)) return integer;

end user_addr_decode;

package body user_addr_decode is

	function user_ipb_addr_sel(signal addr : in std_logic_vector(31 downto 0)) return integer is
		variable sel : integer;
	begin
		--              addr, "00------------------------------" is reserved (system ipbus fabric)
		if    std_match(addr, "01------------------------------") then  	sel := user_ipb_space;
		--              addr, "1-------------------------------" is reserved (wishbone fabric)
		else	
			sel := 99;
		end if;
		return sel;
	end user_ipb_addr_sel;

   function user_wb_addr_sel(signal addr : in std_logic_vector(31 downto 0)) return integer is
		variable sel : integer;
   begin
		--              addr, "00------------------------------" is reserved (system ipbus fabric)
		--              addr, "01------------------------------" is reserved (user ipbus fabric)
		if    std_match(addr, "10------------------------------") then  	sel := user_wb_space;
		else	
			sel := 99;
		end if;
		return sel;
	end user_wb_addr_sel; 

end user_addr_decode;