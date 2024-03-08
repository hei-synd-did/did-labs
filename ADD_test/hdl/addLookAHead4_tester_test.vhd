ARCHITECTURE test OF addLookAHead4_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;
  constant dataBitNb: positive := 4;
  constant dataMaxValue: positive := 2 ** dataBitNb - 1;

BEGIN

  -----------------------------------------------------------------------------
  -- Test the whole additioner by iterating over all cases -> 2^9 tests
  --
  test: PROCESS
  BEGIN
  -- Loop over the two possible values of cIn
  -- Be aware that the carry is a signal and the loop is an integer
  for cIn_int in 0 to 1 loop
        if cIn_int = 0 then
          cIn <= '0';
        else
          cIn <= '1';
        end if;

    -- Then loop on each a value for signal a and b
    for a_int in 0 to dataMaxValue loop -- Loop for signal a
      a <= to_unsigned(a_int, a'length);
	  
      for b_int in 0 to dataMaxValue loop -- Loop for signal b
        b <= to_unsigned(b_int, b'length);
		
		WAIT FOR clockPeriod;
		
		-- Evaluating output of the look-ahead adder 
		assert (s = resize(to_unsigned(a_int, s'length+1) + to_unsigned(b_int, s'length+1)
      + to_unsigned(cIn_int,s'length+1), s'length))
          report
          "test for " &
          "a = " & integer'image(a_int) & " " &
          "b = " & integer'image(b_int) & " " &
          "cIn = '" & integer'image(cIn_int) & "' " &
		  "sum = " & integer'image(to_integer(s)) & " " &
          "wrong"
          severity error;

        end loop;
      end loop;
    end loop;

    WAIT;
  END PROCESS test;

END ARCHITECTURE test;

