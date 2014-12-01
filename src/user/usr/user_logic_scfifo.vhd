library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity user_logic_scfifo is
  GENERIC
    (
      ADDRESS_WIDTH : integer:=8;---8 bit
      DATA_WIDTH : integer:=32 ---32 bit
      );

  port ( clk     : in std_logic;
         reset   : in std_logic;
         enr     : in std_logic; --enable read,should be '0' when not in use.
         enw     : in std_logic; --enable write,should be '0' when not in use.
         dataout : out std_logic_vector(DATA_WIDTH-1 downto 0); --output data
         datain  : in std_logic_vector (DATA_WIDTH-1 downto 0); --input data
         empty   : out std_logic; --set as '1' when the queue is empty
         err     : out std_logic;
         full    : out std_logic --set as '1' when the queue is full
         );
end user_logic_scfifo;

architecture Behavioral of user_logic_scfifo is

  type memory_type is array (0 to ((2**ADDRESS_WIDTH)-1)) of std_logic_vector(DATA_WIDTH-1 downto 0);


-----distributed-------
  signal memory : memory_type ;-- :=(others => (others => '0')); --memory for queue.----- 
  signal readptr,writeptr : std_logic_vector(ADDRESS_WIDTH-1 downto 0); --read and write pointers.
  signal full0 : std_logic;
  signal empty0 : std_logic;

begin
  full <= full0;
  empty <= empty0; 

  fifo0: process(clk,reset)
  begin
    if reset='1' then

      readptr <= (others => '0');
      writeptr <= (others => '0');
      empty0 <='1';
      full0<='0';
      err<='0';


    elsif rising_edge(clk) then 

      if (writeptr + '1' = readptr) then 
        full0<='1';
      else
        full0<='0';
      end if ;

      if (readptr = writeptr ) then 
        empty0<='1';
      else
        empty0<='0';
      end if ; 

      if (empty0='0' and enr='1') or (full0='0' and enw='1') then 
        err<='1';
      end if ; 

      if enw='1' and full0='0' then 
        memory (conv_integer(writeptr)) <= datain ;
        writeptr <= writeptr + '1' ;
      end if ; 

      if enr='1' and empty0='0' then 
        dataout <= memory (conv_integer(readptr));
        readptr <= readptr + '1' ;
      end if ; 

    end if; 

  end process;
end Behavioral;
