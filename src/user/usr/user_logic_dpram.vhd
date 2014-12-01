----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:50 06/21/2013 
-- Design Name: 
-- Module Name:    user_logic_dpram - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments:  Taken from the ISE 14.4 examples
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity user_logic_dpram is
  generic (
    WIDTHA      : integer := 8;
    SIZEA       : integer := 256;
    ADDRWIDTHA  : integer := 8;
    WIDTHB      : integer := 32;
    SIZEB       : integer := 64;
    ADDRWIDTHB  : integer := 6
    );

  port (
    CLKA   : in  std_logic;
    CLKB   : in  std_logic;
    STROBEA: in  std_logic;
    STROBEB: in  std_logic;
    WEA    : in  std_logic;
    WEB    : in  std_logic;
    ACKA   : out STD_LOGIC;
    ACKB   : out STD_LOGIC;
    RESET  : in  STD_LOGIC;
    ADDA   : in  std_logic_vector(ADDRWIDTHA-1 downto 0);
    ADDB   : in  std_logic_vector(ADDRWIDTHB-1 downto 0);
    DIA    : in  std_logic_vector(WIDTHA-1 downto 0);
    DIB    : in  std_logic_vector(WIDTHB-1 downto 0);
    DOA    : out std_logic_vector(WIDTHA-1 downto 0);
    DOB    : out std_logic_vector(WIDTHB-1 downto 0)
    );

end user_logic_dpram;

architecture behavioral of user_logic_dpram is

  function max(L, R: INTEGER) return INTEGER is
  begin
      if L > R then
          return L;
      else
          return R;
      end if;
  end;

  function min(L, R: INTEGER) return INTEGER is
  begin
      if L < R then
          return L;
      else
          return R;
      end if;
  end;

  function log2 (val: INTEGER) return natural is
    variable res : natural;
  begin
        for i in 0 to 31 loop
            if (val <= (2**i)) then
                res := i;
                exit;
            end if;
        end loop;
        return res;
  end function Log2;

  constant minWIDTH : integer := min(WIDTHA,WIDTHB);
  constant maxWIDTH : integer := max(WIDTHA,WIDTHB);
  constant maxSIZE  : integer := max(SIZEA,SIZEB);
  constant RATIO : integer := maxWIDTH / minWIDTH;

  -- An asymmetric RAM is modeled in a similar way as a symmetric RAM, with an
  -- array of array object. Its aspect ratio corresponds to the port with the
  -- lower data width (larger depth)
  type ramType is array (0 to maxSIZE-1) of std_logic_vector(minWIDTH-1 downto 0);

  -- You need to declare <ram> as a shared variable when :
  --   - the RAM has two write ports,
  --   - the RAM has only one write port whose data width is maxWIDTH
  -- In all other cases, <ram> can be a signal.
  shared variable RAM : ramType := (others => (others => '0'));
  
  signal READA : std_logic_vector(WIDTHA-1 downto 0):= (others => '0');
  signal READB : std_logic_vector(WIDTHB-1 downto 0):= (others => '0');
  signal REGA  : std_logic_vector(WIDTHA-1 downto 0):= (others => '0');
  signal REGB  : std_logic_vector(WIDTHB-1 downto 0):= (others => '0');

begin

  pA: process (CLKA)
  begin
    if rising_edge(CLKA) then
      if STROBEA = '1' then
        if WEA = '1' then
          RAM(conv_integer(ADDA)) := DIA;
        else
		  READA <= RAM(conv_integer(ADDA));
        end if;
      end if;
      REGA <= READA;
    end if;
  end process;

  pB: process (CLKB)
  begin
    if rising_edge(CLKB) then
      if STROBEB = '1' then        
        for i in 0 to RATIO-1 loop
          if WEB = '1' then
            RAM(conv_integer(ADDB & conv_std_logic_vector(i,log2(RATIO))))
	          := DIB((i+1)*minWIDTH-1 downto i*minWIDTH);
		  else
            READB((i+1)*minWIDTH-1 downto i*minWIDTH)
	          <= RAM(conv_integer(ADDB & conv_std_logic_vector(i,log2(RATIO))));
          end if;
        end loop;
      end if;
      REGB <= READB;
    end if;
  end process;

  DOA <= REGA;
  DOB <= REGB;

  -----------------------------------------------------------------------------
  -- below here this is my addition (PW), not from Xilinx
  -- Code for acknowledge back to IPBUS,e.g.
  Gen_ack_a :process(RESET,CLKA) 
    variable ack_ctrl : std_logic_vector(2 downto 0);
  begin 
    if RESET = '1' then 
      ack_ctrl :="000";
    elsif rising_edge(CLKA) then 
      if STROBEA = '1' and WEA = '1' then
        ACKA <= STROBEA;
      else 
        case ack_ctrl is 
          when "000" => ACKA <= '0';
                        if STROBEB='1' then 
                          ACKA <= '0';  ack_ctrl := "001";
                        end if;
          when "001" => ACKA <= '0'; 	ack_ctrl := "010";
          when "010" => ACKA <= '0';	ack_ctrl := "011";
          when "011" => ACKA <= '1';	ack_ctrl := "100";
          when "100" => ACKA <= '0';	ack_ctrl := "101";
          when "101" => ACKA <= '0';	ack_ctrl := "000";
          when others =>
        end case;
      end if;
    end if;
  end process;		
  Gen_ack_b :process(RESET,CLKB) 
    variable ack_ctrl : std_logic_vector(2 downto 0);
  begin 
    if RESET = '1' then 
      ack_ctrl :="000";
    elsif rising_edge(CLKA) then 
      if STROBEB = '1' and WEB = '1' then
        ACKB <= STROBEB;
      else 
        case ack_ctrl is 
          when "000" => ACKB <= '0';
                        if STROBEB='1' then 
                          ACKB <= '0';  ack_ctrl := "001";
                        end if;
          when "001" => ACKB <= '0'; 	ack_ctrl := "010";
          when "010" => ACKB <= '0';	ack_ctrl := "011";
          when "011" => ACKB <= '1';	ack_ctrl := "100";
          when "100" => ACKB <= '0';	ack_ctrl := "101";
          when "101" => ACKB <= '0';	ack_ctrl := "000";
          when others =>
        end case;
      end if;
    end if;
  end process;		
  
end behavioral;

							
