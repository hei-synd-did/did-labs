LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;

ENTITY ind_tester IS
    PORT( 
        accept             : IN     std_uLogic;
        carnet_comm_rempli : OUT    std_uLogic;
        delai_livr_court   : OUT    std_uLogic;
        prix_bas           : OUT    std_uLogic;
        stock_bas          : OUT    std_uLogic
    );

-- Declarations

END ind_tester ;

--
ARCHITECTURE down_counter OF ind_tester IS

BEGIN

  -- truth table, LSB toggles at 10 ns

  prix_bas           <= '1',
                        '0' after  10 ns,
                        '1' after  20 ns,
                        '0' after  30 ns,
                        '1' after  40 ns,
                        '0' after  50 ns,
                        '1' after  60 ns,
                        '0' after  70 ns,
                        '1' after  80 ns,
                        '0' after  90 ns,
                        '1' after 100 ns,
                        '0' after 110 ns,
                        '1' after 120 ns,
                        '0' after 130 ns,
                        '1' after 140 ns,
                        '0' after 150 ns,
                        '1' after 160 ns;
				                 
  stock_bas          <= '1',
                        '0' after  20 ns,
                        '1' after  40 ns,
                        '0' after  60 ns,
                        '1' after  80 ns,
                        '0' after 100 ns,
                        '1' after 120 ns,
                        '0' after 140 ns,
                        '1' after 160 ns;
                         
  delai_livr_court   <= '1',
                        '0' after  40 ns,
                        '1' after  80 ns,
                        '0' after 120 ns,
                        '1' after 160 ns;
                         
  carnet_comm_rempli <= '1',
                        '0' after  80 ns,
                        '1' after 160 ns;

END ARCHITECTURE down_counter;
