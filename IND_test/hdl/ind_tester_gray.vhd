LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;

ENTITY ind_tester IS
    PORT(
        accept             : IN     std_uLogic;
        cahier_comm_rempli : OUT    std_uLogic;
        delai_livr_bas     : OUT    std_uLogic;
        prix_bas           : OUT    std_uLogic;
        stock_bas          : OUT    std_uLogic
    );

-- Declarations

END ind_tester ;

--
ARCHITECTURE gray OF ind_tester IS

BEGIN

  -- truth table, LSB toggles at 10 ns

  stock_bas          <= '0',
                        '0' after  10 ns,
                        '0' after  20 ns,
                        '0' after  30 ns,
                        '0' after  40 ns,
                        '0' after  50 ns,
                        '0' after  60 ns,
                        '0' after  70 ns,
                        '1' after  80 ns,
                        '1' after  90 ns,
                        '1' after 100 ns,
                        '1' after 110 ns,
                        '1' after 120 ns,
                        '1' after 130 ns,
                        '1' after 140 ns,
                        '1' after 150 ns;

  prix_bas           <= '0',
                        '0' after  10 ns,
                        '0' after  20 ns,
                        '0' after  30 ns,
                        '1' after  40 ns,
                        '1' after  50 ns,
                        '1' after  60 ns,
                        '1' after  70 ns,
                        '1' after  80 ns,
                        '1' after  90 ns,
                        '1' after 100 ns,
                        '1' after 110 ns,
                        '0' after 120 ns,
                        '0' after 130 ns,
                        '0' after 140 ns,
                        '0' after 150 ns;

  cahier_comm_rempli <= '0',
                        '0' after  10 ns,
                        '1' after  20 ns,
                        '1' after  30 ns,
                        '1' after  40 ns,
                        '1' after  50 ns,
                        '0' after  60 ns,
                        '0' after  70 ns,
                        '0' after  80 ns,
                        '0' after  90 ns,
                        '1' after 100 ns,
                        '1' after 110 ns,
                        '1' after 120 ns,
                        '1' after 130 ns,
                        '0' after 140 ns,
                        '0' after 150 ns;

  delai_livr_bas     <= '0',
                        '1' after  10 ns,
                        '1' after  20 ns,
                        '0' after  30 ns,
                        '0' after  40 ns,
                        '1' after  50 ns,
                        '1' after  60 ns,
                        '0' after  70 ns,
                        '0' after  80 ns,
                        '1' after  90 ns,
                        '1' after 100 ns,
                        '0' after 110 ns,
                        '0' after 120 ns,
                        '1' after 130 ns,
                        '1' after 140 ns,
                        '0' after 150 ns;

END ARCHITECTURE gray;
