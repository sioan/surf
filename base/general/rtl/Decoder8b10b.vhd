-------------------------------------------------------------------------------
-- File       : Decoder8b10b.vhd
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: 8B10B Decoder Module
-------------------------------------------------------------------------------
-- This file is part of 'SLAC Firmware Standard Library'.
-- It is subject to the license terms in the LICENSE.txt file found in the 
-- top-level directory of this distribution and at: 
--    https://confluence.slac.stanford.edu/display/ppareg/LICENSE.html. 
-- No part of 'SLAC Firmware Standard Library', including this file, 
-- may be copied, modified, propagated, or distributed except according to 
-- the terms contained in the LICENSE.txt file.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library surf;
use surf.StdRtlPkg.all;
use surf.Code8b10bPkg.all;

--! Entity declaration for Decoder8b10b
entity Decoder8b10b is

   generic (
      TPD_G          : time     := 1 ns;
      NUM_BYTES_G    : positive := 2;
      RST_POLARITY_G : sl       := '1';
      RST_ASYNC_G    : boolean  := false);
   port (
      clk      : in  sl;
      clkEn    : in  sl := '1';                 -- Optional Clock Enable
      rst      : in  sl := not RST_POLARITY_G;  -- Optional Reset
      validIn  : in  sl := '1';
      dataIn   : in  slv(NUM_BYTES_G*10-1 downto 0);
      dataOut  : out slv(NUM_BYTES_G*8-1 downto 0);
      dataKOut : out slv(NUM_BYTES_G-1 downto 0);
      validOut : out sl;
      codeErr  : out slv(NUM_BYTES_G-1 downto 0);
      dispErr  : out slv(NUM_BYTES_G-1 downto 0));

end entity Decoder8b10b;

--! architecture declaration
architecture rtl of Decoder8b10b is

   type RegType is record
      runDisp  : sl;
      dataOut  : slv(NUM_BYTES_G*8-1 downto 0);
      dataKOut : slv(NUM_BYTES_G-1 downto 0);
      validOut : sl;
      codeErr  : slv(NUM_BYTES_G-1 downto 0);
      dispErr  : slv(NUM_BYTES_G-1 downto 0);
   end record RegType;

   constant REG_INIT_C : RegType := (
      runDisp  => '0',
      dataOut  => (others => '0'),
      dataKOut => (others => '0'),
      validOut => '0',
      codeErr  => (others => '0'),
      dispErr  => (others => '0'));

   signal r   : RegType := REG_INIT_C;
   signal rin : RegType;

begin

   comb : process (dataIn, r, rst, validIn) is
      variable v            : RegType;
      variable dispChainVar : sl;
   begin
      v := r;

      v.validOut := validIn;

      if (validIn = '1') then
         dispChainVar := r.runDisp;
         for i in 0 to NUM_BYTES_G-1 loop
            decode8b10b(dataIn   => dataIn(i*10+9 downto i*10),
                        dispIn   => dispChainVar,
                        dataOut  => v.dataOut(i*8+7 downto i*8),
                        dataKOut => v.dataKOut(i),
                        dispOut  => dispChainVar,
                        codeErr  => v.codeErr(i),
                        dispErr  => v.dispErr(i));
         end loop;
         v.runDisp := dispChainVar;
      end if;

      if (RST_ASYNC_G = false and rst = RST_POLARITY_G) then
         v := REG_INIT_C;
      end if;

      rin      <= v;
      dataOut  <= r.dataOut;
      dataKOut <= r.dataKOut;
      validOut <= r.validOut;
      codeErr  <= r.codeErr;
      dispErr  <= r.dispErr;
   end process comb;

   seq : process (clk, rst) is
   begin
      if (RST_ASYNC_G and rst = RST_POLARITY_G) then
         r <= REG_INIT_C after TPD_G;
      elsif (rising_edge(clk)) then
         if (clkEn = '1') then
            r <= rin after TPD_G;
         end if;
      end if;
   end process seq;

end architecture rtl;
