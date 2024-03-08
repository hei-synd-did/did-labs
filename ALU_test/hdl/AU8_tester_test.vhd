ARCHITECTURE test OF AU8_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;

  signal opCode: string(1 to 16);

BEGIN

  TestProcess: process
  begin
    ---------------------------------------------------------------------------
    -- Test 1: ADD sX, kk
    ---------------------------------------------------------------------------
    opCode <= "ADD sX, kk      ";
    code <= "00";
                                                                -- loop on a
    for a_int in 0 to 15 loop
      A   <= to_signed(a_int, a'length);
                                                                -- loop on cIn
      for cIn_int in 0 to 1 loop
        if cIn_int = 0 then
          cIn <= '0';
        else
          cIn <= '1';
        end if;
                                                                -- loop on b
        for b_int in 0 to 15 loop
          B   <= to_signed(b_int, b'length);
                                                                -- test result
          WAIT FOR clockPeriod;
          if cIn_int = 0 then
            assert (to_integer(Y) = a_int+b_int)
              report
                "test for " &
                "a = " & integer'image(a_int) & " " &
                "b = " & integer'image(b_int) & " " &
                "cIn = '" & integer'image(cIn_int) & "' " &
                "wrong" &
				"should be '" & integer'image(a_int+b_int) & "' " &
				"but is '" & integer'image(to_integer(unsigned(Y))) & "' "
              severity error;
          else
            assert (to_integer(Y) = a_int+b_int+1)
              report
                "test for " &
                "a = " & integer'image(a_int) & " " &
                "b = " & integer'image(b_int) & " " &
                "cIn = '" & integer'image(cIn_int) & "' " &
                "wrong" &
				"should be '" & integer'image(a_int+b_int+1) & "' " &
				"but is '" & integer'image(to_integer(unsigned(Y))) & "' "
              severity error;
          end if;
        end loop;
      end loop;
    end loop;

    ---------------------------------------------------------------------------
    -- Test 2: SUB sX, kk
    ---------------------------------------------------------------------------
    opCode <= "SUB sX, kk      ";
    code <= "01";
                                                                -- loop on a
    for a_int in 0 to 15 loop
      A   <= to_signed(a_int, a'length);
                                                                -- loop on cIn
      for cIn_int in 0 to 1 loop
        if cIn_int = 0 then
          cIn <= '0';
        else
          cIn <= '1';
        end if;
                                                                -- loop on b
        for b_int in 0 to 15 loop
          B   <= to_signed(b_int, b'length);
                                                                -- test result
          WAIT FOR clockPeriod;
          if cIn_int = 0 then
            assert (to_integer(Y) = a_int-b_int)
              report
                "addition test for " &
                "a = " & integer'image(a_int) & " " &
                "b = " & integer'image(b_int) & " " &
                "cIn = '" & integer'image(cIn_int) & "' " &
                "wrong" &
				"should be '" & integer'image(a_int-b_int) & "' " &
				"but is '" & integer'image(to_integer(unsigned(Y))) & "' "
              severity error;
          else
            assert (to_integer(Y) = a_int-b_int-1)
              report
                "sustraction test for " &
                "a = " & integer'image(a_int) & " " &
                "b = " & integer'image(b_int) & " " &
                "cIn = '" & integer'image(cIn_int) & "' " &
                "wrong" &
				"should be '" & integer'image(a_int-b_int-1) & "' " &
				"but is '" & integer'image(to_integer(unsigned(Y))) & "' "
              severity error;
          end if;
        end loop;
      end loop;
    end loop;

    ---------------------------------------------------------------------------
    -- Test 3: SL0 sX
    ---------------------------------------------------------------------------
    opCode <= "SL0 sX          ";
    code <= "10";

    cIn <=              '0';
    A <=         "11000110";
    B <=         "01101100";
    wait for clockPeriod;
    assert (Y =  "10001100") and (cOut = '1')
      report "test 3 SL0 wrong"
      severity note;

    WAIT;
  end process TestProcess;

END ARCHITECTURE test;

