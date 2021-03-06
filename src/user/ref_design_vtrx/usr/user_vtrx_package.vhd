library ieee;
use ieee.std_logic_1164.all;
use work.system_gbt_link_package.all;

package user_package is

	--=== system pcie ===========--
   constant sys_pcie_enable       : boolean  := false;   
   constant sys_eth_p1_enable     : boolean  := false;   
   
   -- (Note!! Add user_sys_pcie_constants_package.vhd if system pcie enabled)

   
   --=== wishbone slaves =======--
	constant number_of_wb_slaves	 : positive := 2 ;
	
	constant user_wb_regs			 : integer  := 0 ;
	constant user_wb_timer			 : integer  := 1 ;
	
	
	--=== ipb slaves ============--
	constant number_of_ipb_slaves	 : positive := 1 ;

	constant user_ipb_regs			 : integer  := 0 ;
	--constant user_ipb_timer		 : integer  := 1 ;     
                          
end user_package;
     
package body user_package is
end user_package;