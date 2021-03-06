-------------------------------------------------------------------------------
-- File       : RogueSideBand.vhd
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: Wrapper for Rogue Sideband Simulation Module
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.StdRtlPkg.all;
use work.AxiStreamPkg.all;

entity RogueSideBandWrap is
   generic (
      TPD_G      : time                     := 1 ns;
      PORT_NUM_G : natural range 0 to 65535 := 1
   );
   port (
      sysClk      : in sl;
      sysRst      : in sl;
      opCode      : out slv(7 downto 0);
      opCodeEn    : out sl;
      remData     : out slv(7 downto 0)
      );
end RogueSideBandWrap;

-- Define architecture
architecture RogueSideBandWrap of RogueSideBandWrap is

begin

   -- Sim Core
   U_RogueSideBand : entity work.RogueSideBand
      port map(
         clock      => sysClk,
         reset      => sysRst,
         portNum    => toSlv(PORT_NUM_G, 16),
         opCode     => opCode,
         opCodeEn   => opCodeEn,
         remData    => remData);

end RogueSideBandWrap;

