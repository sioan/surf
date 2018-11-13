-------------------------------------------------------------------------------
-- File       : TenGigEthGth7Clk.vhd
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: 10GBASE-R Ethernet's Clock Module
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

library unisim;
use unisim.vcomponents.all;

--! Entity declaration for TenGigEthGth7Clk
entity TenGigEthGth7Clk is
   generic (
      TPD_G             : time       := 1 ns;
      USE_GTREFCLK_G    : boolean    := false;  --  FALSE: gtClkP/N,  TRUE: gtRefClk
      REFCLK_DIV2_G     : boolean    := false;  --  FALSE: gtClkP/N = 156.25 MHz,  TRUE: gtClkP/N = 312.5 MHz
      QPLL_REFCLK_SEL_G : bit_vector := "001");
   port (
      -- Clocks and Resets
      extRst        : in  sl;           -- async reset
      phyClk        : out sl;
      phyRst        : out sl;
      -- MGT Clock Port (156.25 MHz or 312.5 MHz)
      gtRefClk      : in  sl := '0';    -- 156.25 MHz only
      gtClkP        : in  sl := '1';
      gtClkN        : in  sl := '0';
      -- Quad PLL Ports
      qplllock      : out sl;
      qplloutclk    : out sl;
      qplloutrefclk : out sl;
      qpllRst       : in  sl);      
end TenGigEthGth7Clk;

--! architecture declaration
architecture mapping of TenGigEthGth7Clk is

   constant QPLL_REFCLK_SEL_C : bit_vector := ite(USE_GTREFCLK_G, "111", QPLL_REFCLK_SEL_G);

   signal refClockDiv2 : sl := '0';
   signal refClock     : sl := '0';
   signal refClk       : sl := '0';
   signal phyClock     : sl := '0';
   signal phyReset     : sl := '1';
   signal pwrUpRst     : sl := '1';
   signal qpllReset    : sl := '1';
   
begin

   phyClk <= phyClock;
   phyRst <= phyReset;

   qpllReset <= qpllRst or pwrUpRst;

   PwrUpRst_Inst : entity surf.PwrUpRst
      generic map (
         TPD_G      => TPD_G,
         DURATION_G => 15625000)        -- 100 ms
      port map (
         arst   => extRst,
         clk    => phyClock,
         rstOut => pwrUpRst);  

   Synchronizer_0 : entity surf.Synchronizer
      generic map(
         TPD_G          => TPD_G,
         RST_ASYNC_G    => true,
         RST_POLARITY_G => '1',
         STAGES_G       => 4,
         INIT_G         => "1111")
      port map (
         clk     => phyClock,
         rst     => extRst,
         dataIn  => '0',
         dataOut => phyReset);    

   GEN_IBUFDS_GTE2 : if (USE_GTREFCLK_G = false) generate
      IBUFDS_GTE2_Inst : IBUFDS_GTE2
         port map (
            I     => gtClkP,
            IB    => gtClkN,
            CEB   => '0',
            ODIV2 => refClockDiv2,
            O     => refClock);
   end generate;

   refClk <= gtRefClk when (USE_GTREFCLK_G) else refClockDiv2 when(REFCLK_DIV2_G) else refClock;

   CLK156_BUFG : BUFG
      port map (
         I => refClk,
         O => phyClock);        

   Gth7QuadPll_Inst : entity surf.Gth7QuadPll
      generic map (
         TPD_G               => TPD_G,
         SIM_RESET_SPEEDUP_G => "FALSE",       --Does not affect hardware
         SIM_VERSION_G       => "2.0",
         QPLL_CFG_G          => x"04801C7",
         QPLL_REFCLK_SEL_G   => QPLL_REFCLK_SEL_C,
         QPLL_FBDIV_G        => "0101000000",  -- 64B/66B Encoding
         QPLL_FBDIV_RATIO_G  => '0',           -- 64B/66B Encoding
         QPLL_REFCLK_DIV_G   => 1)    
      port map (
         qPllRefClk     => refClk,             -- 156.25 MHz
         qPllOutClk     => qPllOutClk,
         qPllOutRefClk  => qPllOutRefClk,
         qPllLock       => qPllLock,
         qPllLockDetClk => '0',                -- IP Core ties this to GND (see note below) 
         qPllRefClkLost => open,
         qPllPowerDown  => '0',
         qPllReset      => qpllReset);          
   ---------------------------------------------------------------------------------------------
   -- Note: GTXE2_COMMON pin gtxe2_common_0_i.QPLLLOCKDETCLK cannot be driven by a clock derived 
   --       from the same clock used as the reference clock for the QPLL, including TXOUTCLK*, 
   --       RXOUTCLK*, the output from the IBUFDS_GTE2 providing the reference clock, and any 
   --       buffered or multiplied/divided versions of these clock outputs. Please see UG476 for 
   --       more information. Source, through a clock buffer, is the same as the GT cell 
   --       reference clock.
   ---------------------------------------------------------------------------------------------
   
end mapping;
