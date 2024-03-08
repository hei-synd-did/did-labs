library ieee;
  use ieee.math_real.all;
library Common;
  use Common.CommonLib.all;

ARCHITECTURE ref OF cordic IS

  subtype registerType is signed(sineBitNb-1 downto 0);
  type    registerArrayType is array (1 to rotationNb) of registerType;

  constant registerXInit: registerType := to_signed(
        integer(0.6071*2.0**(sineBitNb-1)), registerType'length);
  constant registerYInit: registerType := to_signed(0, registerType'length);

  subtype phaseType is signed(phaseBitNb-1 downto 0);
  type phaseArrayType is array (1 to rotationNb) of phaseType;
  type clockwiseArrayType is array(1 to rotationNb) of std_ulogic;
  type phaseSignArrayType is array(1 to rotationNb) of std_ulogic;

  function initPhaseArray return phaseArrayType is
    variable phaseIncrement: phaseArrayType;
  begin
    for index in 1 to phaseIncrement'length loop
      phaseIncrement(index) := to_signed(integer( arctan(1.0/2.0**(index-1)) / math_pi * 2.0**(phaseBitNb-1) ), phaseBitNb);
    end loop;
    return phaseIncrement;
  end initPhaseArray;

  constant phaseIncrement: phaseArrayType := initPhaseArray;
  signal phaseSign     : phaseSignArrayType;

  signal registerX     : registerArrayType;
  signal registerY     : registerArrayType;
  signal angle         : phaseArrayType;
  signal clockwise     : clockwiseArrayType;

  signal cosine_int    : registerType;

BEGIN

  rotate: process(clockwise, registerX, registerY)
  begin
    registerX(1) <= registerXInit;
    registerY(1) <= registerYInit;
    for index in 1 to rotationNb-1 loop
      if clockwise(index) = '1' then
        registerX(index+1) <= registerX(index) - shift_right(registerY(index), index-1);
        registerY(index+1) <= registerY(index) + shift_right(registerX(index), index-1);
      else
        registerX(index+1) <= registerX(index) + shift_right(registerY(index), index-1);
        registerY(index+1) <= registerY(index) - shift_right(registerX(index), index-1);
      end if;
    end loop;
  end process rotate;

  trackAngle: process(phase, phaseSign, clockwise)
  begin
    if ( phase(phase'high) xor phase(phase'high-1) ) = '0' then
      angle(1) <= signed(phase);
    else
      angle(1)(angle(1)'high) <= phase(phase'high);
      angle(1)(angle(1)'high-1 downto 0) <= signed(not phase(phase'high-1 downto 0));
    end if;

    phaseSign(1) <= not(phase(phase'high) xor phase(phase'high-1));

    for index in 1 to rotationNb-1 loop
      phaseSign(index+1) <= phaseSign(index);
      if clockwise(index) = '1' then
        angle(index+1) <= angle(index) - phaseIncrement(index);
      else
        angle(index+1) <= angle(index) + phaseIncrement(index);
      end if;
    end loop;
  end process trackAngle;

  dir: process(angle)
  begin
    for index in 1 to rotationNb loop
      clockwise(index) <= not angle(index)(angle(index)'high);
    end loop;
  end process dir;

  sine <= resize(registerY(rotationNb),sine'length);

  cosine_int <= registerX(rotationNb) when (phaseSign(rotationNb) = '1')
    else -registerX(rotationNb);

  cosine <= resize(cosine_int, cosine'length);

END ARCHITECTURE ref;
