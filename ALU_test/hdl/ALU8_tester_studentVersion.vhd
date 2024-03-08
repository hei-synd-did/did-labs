ARCHITECTURE studentVersion OF ALU8_tester IS

  constant clockFrequency: real := 20.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;

  signal opCode: string(1 to 16);

BEGIN

  testSequence: process
  begin

    ---------------------------------------------------------------------------
    -- Test 1: LOAD sX, kk
    ---------------------------------------------------------------------------
    opCode <= "LOAD sX, kk     ";
    code <= "00000";

    cIn <=             '1';
    A <=        "00000000";
    B <=        "11111111";
    wait for clockPeriod;
    assert Y =  "00001010"
      report "test 1 LOAD wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 2: ADD sX, pp
    ---------------------------------------------------------------------------
    opCode <= "ADD sX, pp      ";
    code <= "01100";

    cIn <=             '1';
    A <=        "00111100";
    B <=        "01011010";
    wait for clockPeriod;
    assert Y =  ("10010110") and (cOut = '0')
      report "test 2 ADD wrong"
      severity note;


    wait;

  end process testSequence;

END ARCHITECTURE studentVersion;

