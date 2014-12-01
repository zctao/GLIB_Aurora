
-- VHDL Instantiation Created from source file Data_FSM.vhd -- 16:57:58 11/17/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Data_FSM
	PORT(
		en : IN std_logic;
		reset : IN std_logic;
		clk : IN std_logic;
		data_1 : IN std_logic_vector(31 downto 0);
		data_2 : IN std_logic_vector(31 downto 0);
		data_3 : IN std_logic_vector(31 downto 0);          
		data : OUT std_logic_vector(31 downto 0);
		last : OUT std_logic;
		valid : OUT std_logic;
		keep : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_Data_FSM: Data_FSM PORT MAP(
		data => ,
		last => ,
		valid => ,
		keep => ,
		en => ,
		reset => ,
		clk => ,
		data_1 => ,
		data_2 => ,
		data_3 => 
	);


