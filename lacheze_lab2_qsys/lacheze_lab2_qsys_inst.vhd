	component lacheze_lab2_qsys is
		port (
			clk_clk                             : in  std_logic                    := 'X'; -- clk
			pio7seg0_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			pio7seg1_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			pio7seg2_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			reset_reset_n                       : in  std_logic                    := 'X'  -- reset_n
		);
	end component lacheze_lab2_qsys;

	u0 : component lacheze_lab2_qsys
		port map (
			clk_clk                             => CONNECTED_TO_clk_clk,                             --                          clk.clk
			pio7seg0_external_connection_export => CONNECTED_TO_pio7seg0_external_connection_export, -- pio7seg0_external_connection.export
			pio7seg1_external_connection_export => CONNECTED_TO_pio7seg1_external_connection_export, -- pio7seg1_external_connection.export
			pio7seg2_external_connection_export => CONNECTED_TO_pio7seg2_external_connection_export, -- pio7seg2_external_connection.export
			reset_reset_n                       => CONNECTED_TO_reset_reset_n                        --                        reset.reset_n
		);

