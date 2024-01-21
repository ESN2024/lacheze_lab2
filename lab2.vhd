library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity lab2 is Port(
	clk, reset : in std_logic;
	pio_7seg0 : out std_logic_vector (6 downto 0);
	pio_7seg1 : out std_logic_vector (6 downto 0);
	pio_7seg2 : out std_logic_vector (6 downto 0)
	);
end entity;

architecture arch of lab2 is
	signal bcd0 , bcd1 , bcd2 : std_logic_vector (3 downto 0);

    component lacheze_lab2_qsys is
        port (
            clk_clk                             : in  std_logic                    := 'X'; -- clk
            pio7seg0_external_connection_export : out std_logic_vector(3 downto 0);        -- export
            pio7seg1_external_connection_export : out std_logic_vector(3 downto 0);        -- export
            pio7seg2_external_connection_export : out std_logic_vector(3 downto 0);        -- export
            reset_reset_n                       : in  std_logic                    := 'X'  -- reset_n
        );
    end component lacheze_lab2_qsys;
	 
	 component bcd_7segment is Port (
			bcd: in STD_LOGIC_VECTOR (3 downto 0);
			out7seg : out STD_LOGIC_VECTOR (6 downto 0));
	end component bcd_7segment;


begin
    u0 : component lacheze_lab2_qsys
        port map (
            clk_clk                             => clk,       -- clk.clk
            pio7seg0_external_connection_export => bcd0, -- pio7seg0_external_connection.export
            pio7seg1_external_connection_export => bcd1, -- pio7seg1_external_connection.export
            pio7seg2_external_connection_export => bcd2, -- pio7seg2_external_connection.export
            reset_reset_n                       => reset      -- reset.reset_n
        );
		u1 : component bcd_7segment
			port map (
				bcd 		=>		bcd0,
				out7seg 	=>		pio_7seg0
				);
				
		u2 : component bcd_7segment
			port map (
				bcd 		=>		bcd1,
				out7seg 	=>		pio_7seg1
				);		
		u3 : component bcd_7segment
			port map (
				bcd 		=>		bcd2,
				out7seg 	=>		pio_7seg2
				);  
		  
end architecture;