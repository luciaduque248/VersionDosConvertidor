-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "03/06/2024 13:44:16"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ConvertidorCodigo IS
    PORT (
	entrada_dias : IN std_logic_vector(6 DOWNTO 0);
	salida_bcd : OUT std_logic_vector(3 DOWNTO 0);
	salida_laborable : OUT std_logic;
	segmentos_display : OUT std_logic_vector(6 DOWNTO 0);
	selector_display : OUT std_logic
	);
END ConvertidorCodigo;

-- Design Ports Information
-- salida_bcd[0]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- salida_bcd[1]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- salida_bcd[2]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- salida_bcd[3]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- salida_laborable	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segmentos_display[0]	=>  Location: PIN_M3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segmentos_display[1]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segmentos_display[2]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segmentos_display[3]	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segmentos_display[4]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segmentos_display[5]	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segmentos_display[6]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- selector_display	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrada_dias[0]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrada_dias[2]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrada_dias[1]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrada_dias[3]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrada_dias[4]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrada_dias[5]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrada_dias[6]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ConvertidorCodigo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_entrada_dias : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_salida_bcd : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_salida_laborable : std_logic;
SIGNAL ww_segmentos_display : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_selector_display : std_logic;
SIGNAL \salida_bcd[0]~output_o\ : std_logic;
SIGNAL \salida_bcd[1]~output_o\ : std_logic;
SIGNAL \salida_bcd[2]~output_o\ : std_logic;
SIGNAL \salida_bcd[3]~output_o\ : std_logic;
SIGNAL \salida_laborable~output_o\ : std_logic;
SIGNAL \segmentos_display[0]~output_o\ : std_logic;
SIGNAL \segmentos_display[1]~output_o\ : std_logic;
SIGNAL \segmentos_display[2]~output_o\ : std_logic;
SIGNAL \segmentos_display[3]~output_o\ : std_logic;
SIGNAL \segmentos_display[4]~output_o\ : std_logic;
SIGNAL \segmentos_display[5]~output_o\ : std_logic;
SIGNAL \segmentos_display[6]~output_o\ : std_logic;
SIGNAL \selector_display~output_o\ : std_logic;
SIGNAL \entrada_dias[1]~input_o\ : std_logic;
SIGNAL \entrada_dias[0]~input_o\ : std_logic;
SIGNAL \entrada_dias[2]~input_o\ : std_logic;
SIGNAL \entrada_dias[5]~input_o\ : std_logic;
SIGNAL \entrada_dias[3]~input_o\ : std_logic;
SIGNAL \entrada_dias[6]~input_o\ : std_logic;
SIGNAL \entrada_dias[4]~input_o\ : std_logic;
SIGNAL \dia_actual[2]~0_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux1~0_combout\ : std_logic;

BEGIN

ww_entrada_dias <= entrada_dias;
salida_bcd <= ww_salida_bcd;
salida_laborable <= ww_salida_laborable;
segmentos_display <= ww_segmentos_display;
selector_display <= ww_selector_display;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Mux1~0_combout\ <= NOT \Mux1~0_combout\;

-- Location: IOOBUF_X32_Y29_N16
\salida_bcd[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \salida_bcd[0]~output_o\);

-- Location: IOOBUF_X37_Y0_N23
\salida_bcd[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \salida_bcd[1]~output_o\);

-- Location: IOOBUF_X30_Y0_N2
\salida_bcd[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \salida_bcd[2]~output_o\);

-- Location: IOOBUF_X41_Y3_N9
\salida_bcd[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \salida_bcd[3]~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\salida_laborable~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \salida_laborable~output_o\);

-- Location: IOOBUF_X0_Y12_N9
\segmentos_display[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~0_combout\,
	devoe => ww_devoe,
	o => \segmentos_display[0]~output_o\);

-- Location: IOOBUF_X0_Y10_N2
\segmentos_display[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~0_combout\,
	devoe => ww_devoe,
	o => \segmentos_display[1]~output_o\);

-- Location: IOOBUF_X0_Y11_N16
\segmentos_display[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~0_combout\,
	devoe => ww_devoe,
	o => \segmentos_display[2]~output_o\);

-- Location: IOOBUF_X0_Y13_N16
\segmentos_display[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~0_combout\,
	devoe => ww_devoe,
	o => \segmentos_display[3]~output_o\);

-- Location: IOOBUF_X0_Y11_N9
\segmentos_display[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux2~0_combout\,
	devoe => ww_devoe,
	o => \segmentos_display[4]~output_o\);

-- Location: IOOBUF_X0_Y13_N23
\segmentos_display[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \segmentos_display[5]~output_o\);

-- Location: IOOBUF_X0_Y4_N16
\segmentos_display[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~0_combout\,
	devoe => ww_devoe,
	o => \segmentos_display[6]~output_o\);

-- Location: IOOBUF_X0_Y10_N9
\selector_display~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~0_combout\,
	devoe => ww_devoe,
	o => \selector_display~output_o\);

-- Location: IOIBUF_X0_Y11_N1
\entrada_dias[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrada_dias(1),
	o => \entrada_dias[1]~input_o\);

-- Location: IOIBUF_X0_Y20_N1
\entrada_dias[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrada_dias(0),
	o => \entrada_dias[0]~input_o\);

-- Location: IOIBUF_X0_Y12_N1
\entrada_dias[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrada_dias(2),
	o => \entrada_dias[2]~input_o\);

-- Location: IOIBUF_X0_Y11_N22
\entrada_dias[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrada_dias(5),
	o => \entrada_dias[5]~input_o\);

-- Location: IOIBUF_X0_Y8_N15
\entrada_dias[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrada_dias(3),
	o => \entrada_dias[3]~input_o\);

-- Location: IOIBUF_X0_Y12_N15
\entrada_dias[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrada_dias(6),
	o => \entrada_dias[6]~input_o\);

-- Location: IOIBUF_X0_Y13_N1
\entrada_dias[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrada_dias(4),
	o => \entrada_dias[4]~input_o\);

-- Location: LCCOMB_X1_Y11_N16
\dia_actual[2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \dia_actual[2]~0_combout\ = (!\entrada_dias[5]~input_o\ & (!\entrada_dias[3]~input_o\ & (!\entrada_dias[6]~input_o\ & !\entrada_dias[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrada_dias[5]~input_o\,
	datab => \entrada_dias[3]~input_o\,
	datac => \entrada_dias[6]~input_o\,
	datad => \entrada_dias[4]~input_o\,
	combout => \dia_actual[2]~0_combout\);

-- Location: LCCOMB_X1_Y11_N2
\Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ((\entrada_dias[1]~input_o\ & (\entrada_dias[0]~input_o\ & \entrada_dias[2]~input_o\)) # (!\entrada_dias[1]~input_o\ & ((!\entrada_dias[2]~input_o\)))) # (!\dia_actual[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrada_dias[1]~input_o\,
	datab => \entrada_dias[0]~input_o\,
	datac => \entrada_dias[2]~input_o\,
	datad => \dia_actual[2]~0_combout\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X1_Y11_N4
\Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (((\entrada_dias[1]~input_o\ & \entrada_dias[0]~input_o\)) # (!\dia_actual[2]~0_combout\)) # (!\entrada_dias[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrada_dias[1]~input_o\,
	datab => \entrada_dias[0]~input_o\,
	datac => \entrada_dias[2]~input_o\,
	datad => \dia_actual[2]~0_combout\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X1_Y11_N14
\Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ((\entrada_dias[0]~input_o\) # (!\dia_actual[2]~0_combout\)) # (!\entrada_dias[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrada_dias[1]~input_o\,
	datac => \entrada_dias[0]~input_o\,
	datad => \dia_actual[2]~0_combout\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X1_Y11_N0
\Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\entrada_dias[1]~input_o\ $ (((!\entrada_dias[2]~input_o\) # (!\entrada_dias[0]~input_o\)))) # (!\dia_actual[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrada_dias[1]~input_o\,
	datab => \entrada_dias[0]~input_o\,
	datac => \entrada_dias[2]~input_o\,
	datad => \dia_actual[2]~0_combout\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X1_Y11_N10
\Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\entrada_dias[1]~input_o\ & (!\entrada_dias[0]~input_o\ & (!\entrada_dias[2]~input_o\ & \dia_actual[2]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrada_dias[1]~input_o\,
	datab => \entrada_dias[0]~input_o\,
	datac => \entrada_dias[2]~input_o\,
	datad => \dia_actual[2]~0_combout\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X1_Y11_N12
\Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ((\entrada_dias[1]~input_o\ $ (!\entrada_dias[0]~input_o\)) # (!\dia_actual[2]~0_combout\)) # (!\entrada_dias[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrada_dias[1]~input_o\,
	datab => \entrada_dias[0]~input_o\,
	datac => \entrada_dias[2]~input_o\,
	datad => \dia_actual[2]~0_combout\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X1_Y11_N6
\Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ((!\entrada_dias[1]~input_o\ & ((!\entrada_dias[2]~input_o\) # (!\entrada_dias[0]~input_o\)))) # (!\dia_actual[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrada_dias[1]~input_o\,
	datab => \entrada_dias[0]~input_o\,
	datac => \entrada_dias[2]~input_o\,
	datad => \dia_actual[2]~0_combout\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X1_Y11_N24
\Mux7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = ((!\entrada_dias[1]~input_o\ & !\entrada_dias[2]~input_o\)) # (!\dia_actual[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrada_dias[1]~input_o\,
	datac => \entrada_dias[2]~input_o\,
	datad => \dia_actual[2]~0_combout\,
	combout => \Mux7~0_combout\);

ww_salida_bcd(0) <= \salida_bcd[0]~output_o\;

ww_salida_bcd(1) <= \salida_bcd[1]~output_o\;

ww_salida_bcd(2) <= \salida_bcd[2]~output_o\;

ww_salida_bcd(3) <= \salida_bcd[3]~output_o\;

ww_salida_laborable <= \salida_laborable~output_o\;

ww_segmentos_display(0) <= \segmentos_display[0]~output_o\;

ww_segmentos_display(1) <= \segmentos_display[1]~output_o\;

ww_segmentos_display(2) <= \segmentos_display[2]~output_o\;

ww_segmentos_display(3) <= \segmentos_display[3]~output_o\;

ww_segmentos_display(4) <= \segmentos_display[4]~output_o\;

ww_segmentos_display(5) <= \segmentos_display[5]~output_o\;

ww_segmentos_display(6) <= \segmentos_display[6]~output_o\;

ww_selector_display <= \selector_display~output_o\;
END structure;


