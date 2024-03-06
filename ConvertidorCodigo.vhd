library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ConvertidorCodigo is
    Port ( entrada_dias : in  STD_LOGIC_VECTOR (6 downto 0);  -- Entradas de los días de la semana
           salida_bcd : out  STD_LOGIC_VECTOR (3 downto 0);  -- Salida en código BCD
           salida_laborable : out  STD_LOGIC;  -- Salida indicando si es laborable o festivo
           segmentos_display : out  STD_LOGIC_VECTOR (6 downto 0);  -- Salida para el display de 7 segmentos
           selector_display : out  STD_LOGIC);  -- Selector para el display de 7 segmentos
end ConvertidorCodigo;

architecture Behavioral of ConvertidorCodigo is

    -- Declaración de señales internas
    signal dia_actual : integer range 1 to 7;
    signal bcd_temp : STD_LOGIC_VECTOR(3 downto 0);
    signal es_laborable : STD_LOGIC;
    signal segmentos_temp : STD_LOGIC_VECTOR(6 downto 0);
	 
begin
    -- Decodificador BCD a 7 segmentos
    with bcd_temp select
        segmentos_display <= "0000001" when "0000",
                              "1001111" when "0001",
                              "0010010" when "0010",
                              "0000110" when "0011",
                              "1001100" when "0100",
                              "0100100" when "0101",
                              "0100000" when "0110",
                              "0001111" when "0111",
                              "0000000" when others;

    -- Multiplexor de 4 a 1 para seleccionar los días de la semana
    with dia_actual select
        selector_display <= '1' when 1,  -- Activa el selector si es el día de la semana actual
                             '0' when others;  -- Desactiva el selector para otros días

    -- Proceso para determinar si es laborable o festivo
    process (entrada_dias)
    begin
        case entrada_dias is
            when "0000001" | "0000010" | "0000011" | "0000100" | "0000101" =>
                es_laborable <= '1';  -- Lunes a viernes, es laborable
            when "0000110" | "0000111" =>
                es_laborable <= '0';  -- Sábado y domingo, no es laborable
            when others =>
                es_laborable <= '0';  -- Otros casos, no es laborable (por defecto)
        end case;
    end process;

    -- Proceso para convertir los días de la semana en BCD
    process (dia_actual)
    begin
        case dia_actual is
            when 1 =>
                bcd_temp <= "0001";
            when 2 =>
                bcd_temp <= "0010";
            when 3 =>
                bcd_temp <= "0011";
            when 4 =>
                bcd_temp <= "0100";
            when 5 =>
                bcd_temp <= "0101";
            when 6 =>
                bcd_temp <= "0110";
            when 7 =>
                bcd_temp <= "0111";
            when others =>
                bcd_temp <= "0000";  -- Por defecto, muestra 0 en el display
        end case;
    end process;

    -- Proceso para determinar el día actual
    process (entrada_dias)
    begin
        dia_actual <= 1;  -- Por defecto, se asume que es lunes
        if entrada_dias = "0000001" then  -- Lunes
            dia_actual <= 1;
        elsif entrada_dias = "0000010" then  -- Martes
            dia_actual <= 2;
        elsif entrada_dias = "0000011" then  -- Miércoles
            dia_actual <= 3;
        elsif entrada_dias = "0000100" then  -- Jueves
            dia_actual <= 4;
        elsif entrada_dias = "0000101" then  -- Viernes
            dia_actual <= 5;
        elsif entrada_dias = "0000110" then  -- Sábado
            dia_actual <= 6;
        elsif entrada_dias = "0000111" then  -- Domingo
            dia_actual <= 7;
        end if;
    end process;
end Behavioral;
