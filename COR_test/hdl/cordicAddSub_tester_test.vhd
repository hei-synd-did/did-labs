ARCHITECTURE test OF cordicAddSub_tester IS

  constant operatorDelay: time := 10 ns;

  constant phaseMin: integer := -2**(phaseBitNb-1);
  constant phaseMax: integer := 2**(phaseBitNb-1)-1;
  constant phaseNb: integer := 100;
  constant phaseStep: integer := (phaseMax-phaseMin) / phaseNb;
  constant amplitudeMin: integer := 0;
  constant amplitudeMax: integer := 2**(sineBitNb-1)-1;
  constant amplitudeNb: integer := 100;
  constant amplitudeStep: integer := (amplitudeMax-amplitudeMin) / amplitudeNb;
  signal add_sub: std_ulogic;
  signal phaseIn_int, stepAngle_int: signed(phaseIn'range);
  signal xIn_int, xInShifted_int, yIn_int, yInShifted_int: unsigned(xIn'range) := (others => '0');

BEGIN

  testAll: process
    variable amplitudeIndex, shiftedIndex, phaseIndex, atanIndex : integer;
  begin
  ------------------------------------------------------------------------------
                                                                   -- test X add
    assert false
      report "Testing X-coordinate add/sub with negative angle"
      severity note;
    phaseIndex := phaseMin;
    phaseIn_int <= to_signed(phaseIndex, phaseIn'length);
    yIn_int <= (others => '0');
    xInShifted_int <= (others => '0');
    stepAngle_int <= (others => '0');
    amplitudeIndex := amplitudeMin;
    while amplitudeIndex < amplitudeMax loop
      xIn_int <= to_unsigned(amplitudeIndex, xIn_int'length);
      shiftedIndex := amplitudeMin;
      while shiftedIndex < amplitudeMax loop
        yInShifted_int <= to_unsigned(shiftedIndex, yInShifted_int'length);
        wait for operatorDelay*9/10;
          assert xOut = xIn_int + yInShifted_int
            report "real part update wrong"
            severity error;
        wait for operatorDelay/10;
        shiftedIndex := shiftedIndex + amplitudeStep;
      end loop;
      amplitudeIndex := amplitudeIndex + amplitudeStep;
    end loop;

  ------------------------------------------------------------------------------
                                                                   -- test X sub
    assert false
      report "Testing X-coordinate add/sub with positive angle"
      severity note;
    phaseIndex := phaseMax;
    phaseIn_int <= to_signed(phaseIndex, phaseIn'length);
    yIn_int <= (others => '0');
    xInShifted_int <= (others => '0');
    stepAngle_int <= (others => '0');
    amplitudeIndex := amplitudeMin;
    while amplitudeIndex < amplitudeMax loop
      xIn_int <= to_unsigned(amplitudeIndex, xIn_int'length);
      shiftedIndex := amplitudeMin;
      while shiftedIndex < amplitudeMax loop
        yInShifted_int <= to_unsigned(shiftedIndex, yInShifted_int'length);
        wait for operatorDelay*9/10;
          assert xOut = xIn_int - yInShifted_int
            report "real part update wrong"
            severity error;
        wait for operatorDelay/10;
        shiftedIndex := shiftedIndex + amplitudeStep;
      end loop;
      amplitudeIndex := amplitudeIndex + amplitudeStep;
    end loop;

  ------------------------------------------------------------------------------
                                                                   -- test Y sub
    assert false
      report "Testing Y-coordinate add/sub with negative angle"
      severity note;
    phaseIndex := phaseMin;
    phaseIn_int <= to_signed(phaseIndex, phaseIn'length);
    xIn_int <= (others => '0');
    yInShifted_int <= (others => '0');
    stepAngle_int <= (others => '0');
    amplitudeIndex := amplitudeMin;
    while amplitudeIndex < amplitudeMax loop
      yIn_int <= to_unsigned(amplitudeIndex, xIn_int'length);
      shiftedIndex := amplitudeMin;
      while shiftedIndex < amplitudeMax loop
        xInShifted_int <= to_unsigned(shiftedIndex, yInShifted_int'length);
        wait for operatorDelay*9/10;
          assert yOut = yIn_int - xInShifted_int
            report "imaginary part update wrong"
            severity error;
        wait for operatorDelay/10;
        shiftedIndex := shiftedIndex + amplitudeStep;
      end loop;
      amplitudeIndex := amplitudeIndex + amplitudeStep;
    end loop;

  ------------------------------------------------------------------------------
                                                                   -- test Y add
    assert false
      report "Testing Y-coordinate add/sub with positive angle"
      severity note;
    phaseIndex := phaseMax;
    phaseIn_int <= to_signed(phaseIndex, phaseIn'length);
    xIn_int <= (others => '0');
    yInShifted_int <= (others => '0');
    stepAngle_int <= (others => '0');
    amplitudeIndex := amplitudeMin;
    while amplitudeIndex < amplitudeMax loop
      yIn_int <= to_unsigned(amplitudeIndex, xIn_int'length);
      shiftedIndex := amplitudeMin;
      while shiftedIndex < amplitudeMax loop
        xInShifted_int <= to_unsigned(shiftedIndex, yInShifted_int'length);
--yIn_int <= yIn_int + 1; wait for 0 ns;
        wait for operatorDelay*9/10;
          assert yOut = yIn_int + xInShifted_int
            report "imaginary part update wrong"
            severity error;
        wait for operatorDelay/10;
        shiftedIndex := shiftedIndex + amplitudeStep;
      end loop;
      amplitudeIndex := amplitudeIndex + amplitudeStep;
    end loop;

    ----------------------------------------------------------------------------
                                                           -- test angle add/sub
    assert false
      report "Testing phase add/sub"
      severity note;
    xIn_int <= (others => '0');
    xInShifted_int <= (others => '0');
    yIn_int <= (others => '0');
    yInShifted_int <= (others => '0');
    phaseIndex := phaseMin;
    while phaseIndex < phaseMax loop
      phaseIn_int <= to_signed(phaseIndex, phaseIn'length);
      if phaseIndex >= 0 then
        add_sub <= '1';
      else
        add_sub <= '0';
      end if;
      atanIndex := phaseMin;
      while atanIndex < phaseMax loop
        stepAngle_int <= to_signed(atanIndex, stepAngle'length);
        wait for operatorDelay*9/10;
        if add_sub = '1' then
          assert phaseOut = phaseIn_int - stepAngle_int
            report "phase update wrong"
            severity error;
        else
          assert phaseOut = phaseIn_int + stepAngle_int
            report "phase update wrong"
            severity error;
        end if;
        wait for operatorDelay/10;
        atanIndex := atanIndex + phaseStep;
      end loop;
      phaseIndex := phaseIndex + phaseStep;
    end loop;

    ----------------------------------------------------------------------------
                                                              -- stop simulation
    wait for 550 us - now;
    assert false
      report cr &
             "----------------------------------------" &
             "----------------------------------------" &
             "----------------------------------------" &
             cr &
             "End of tests." &
             cr & cr
      severity failure;
    wait;
  end process;

  phaseIn <= phaseIn_int;
  stepAngle <= stepAngle_int;
  xIn <= xIn_int;
  xInShifted <= xInShifted_int;
  yIn <= yIn_int;
  yInShifted <= yInShifted_int;

END ARCHITECTURE test;
