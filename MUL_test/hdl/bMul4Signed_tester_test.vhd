ARCHITECTURE test OF mul4Signed_tester IS

  constant clockFrequency: real := 10.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;

BEGIN
                                                            -- testing all cases
  test: PROCESS
  BEGIN
                                                                    -- loop on a
    for a_int in -2**(a'length-1) to 2**(a'length-1)-1 loop
      a   <=to_signed(a_int, a'length);
                                                                    -- loop on b
      for b_int in -2**(a'length-1) to 2**(a'length-1)-1 loop
        b   <= to_signed(b_int, b'length);
                                                                  -- test result
        WAIT FOR clockPeriod;
        assert p = a * b
          report
            "test for " &
            "a = " & integer'image(a_int) & " " &
            "b = " & integer'image(b_int) & " " &
            "wrong"
          severity error;
       end loop;
     end loop;

    WAIT;
  END PROCESS test;

END ARCHITECTURE test;
