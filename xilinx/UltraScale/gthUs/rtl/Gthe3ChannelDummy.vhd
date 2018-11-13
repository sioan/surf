-------------------------------------------------------------------------------
-- File       : Gthe3ChannelDummy.vhd
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- This file is part of 'SLAC MGT Library'.
-- It is subject to the license terms in the LICENSE.txt file found in the 
-- top-level directory of this distribution and at: 
--    https://confluence.slac.stanford.edu/display/ppareg/LICENSE.html. 
-- No part of 'SLAC MGT Library', including this file, 
-- may be copied, modified, propagated, or distributed except according to 
-- the terms contained in the LICENSE.txt file.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library surf;
use surf.StdRtlPkg.all;

library unisim;
use unisim.vcomponents.all;

--! Entity declaration for Gthe3ChannelDummy
entity Gthe3ChannelDummy is
   generic (
      TPD_G   : time     := 1 ns;
      WIDTH_G : positive := 1);
   port (
      refClk : in  sl;                  -- Required by DRC REQP #2
      gtRxP  : in  slv(WIDTH_G-1 downto 0);
      gtRxN  : in  slv(WIDTH_G-1 downto 0);
      gtTxP  : out slv(WIDTH_G-1 downto 0);
      gtTxN  : out slv(WIDTH_G-1 downto 0));
end entity Gthe3ChannelDummy;

--! architecture declaration
architecture mapping of Gthe3ChannelDummy is

begin

   GEN_VEC :
   for i in WIDTH_G-1 downto 0 generate
      U_GTH : GTHE3_CHANNEL
         port map (
            BUFGTCE              => open,
            BUFGTCEMASK          => open,
            BUFGTDIV             => open,
            BUFGTRESET           => open,
            BUFGTRSTMASK         => open,
            CPLLFBCLKLOST        => open,
            CPLLLOCK             => open,
            CPLLREFCLKLOST       => open,
            DMONITOROUT          => open,
            DRPDO                => open,
            DRPRDY               => open,
            EYESCANDATAERROR     => open,
            GTHTXN               => gtTxN(i),
            GTHTXP               => gtTxP(i),
            GTPOWERGOOD          => open,
            GTREFCLKMONITOR      => open,
            PCIERATEGEN3         => open,
            PCIERATEIDLE         => open,
            PCIERATEQPLLPD       => open,
            PCIERATEQPLLRESET    => open,
            PCIESYNCTXSYNCDONE   => open,
            PCIEUSERGEN3RDY      => open,
            PCIEUSERPHYSTATUSRST => open,
            PCIEUSERRATESTART    => open,
            PCSRSVDOUT           => open,
            PHYSTATUS            => open,
            PINRSRVDAS           => open,
            RESETEXCEPTION       => open,
            RXBUFSTATUS          => open,
            RXBYTEISALIGNED      => open,
            RXBYTEREALIGN        => open,
            RXCDRLOCK            => open,
            RXCDRPHDONE          => open,
            RXCHANBONDSEQ        => open,
            RXCHANISALIGNED      => open,
            RXCHANREALIGN        => open,
            RXCHBONDO            => open,
            RXCLKCORCNT          => open,
            RXCOMINITDET         => open,
            RXCOMMADET           => open,
            RXCOMSASDET          => open,
            RXCOMWAKEDET         => open,
            RXCTRL0              => open,
            RXCTRL1              => open,
            RXCTRL2              => open,
            RXCTRL3              => open,
            RXDATA               => open,
            RXDATAEXTENDRSVD     => open,
            RXDATAVALID          => open,
            RXDLYSRESETDONE      => open,
            RXELECIDLE           => open,
            RXHEADER             => open,
            RXHEADERVALID        => open,
            RXMONITOROUT         => open,
            RXOSINTDONE          => open,
            RXOSINTSTARTED       => open,
            RXOSINTSTROBEDONE    => open,
            RXOSINTSTROBESTARTED => open,
            RXOUTCLK             => open,
            RXOUTCLKFABRIC       => open,
            RXOUTCLKPCS          => open,
            RXPHALIGNDONE        => open,
            RXPHALIGNERR         => open,
            RXPMARESETDONE       => open,
            RXPRBSERR            => open,
            RXPRBSLOCKED         => open,
            RXPRGDIVRESETDONE    => open,
            RXQPISENN            => open,
            RXQPISENP            => open,
            RXRATEDONE           => open,
            RXRECCLKOUT          => open,
            RXRESETDONE          => open,
            RXSLIDERDY           => open,
            RXSLIPDONE           => open,
            RXSLIPOUTCLKRDY      => open,
            RXSLIPPMARDY         => open,
            RXSTARTOFSEQ         => open,
            RXSTATUS             => open,
            RXSYNCDONE           => open,
            RXSYNCOUT            => open,
            RXVALID              => open,
            TXBUFSTATUS          => open,
            TXCOMFINISH          => open,
            TXDLYSRESETDONE      => open,
            TXOUTCLK             => open,
            TXOUTCLKFABRIC       => open,
            TXOUTCLKPCS          => open,
            TXPHALIGNDONE        => open,
            TXPHINITDONE         => open,
            TXPMARESETDONE       => open,
            TXPRGDIVRESETDONE    => open,
            TXQPISENN            => open,
            TXQPISENP            => open,
            TXRATEDONE           => open,
            TXRESETDONE          => open,
            TXSYNCDONE           => open,
            TXSYNCOUT            => open,
            CFGRESET             => '0',
            CLKRSVD0             => '0',
            CLKRSVD1             => '0',
            CPLLLOCKDETCLK       => '0',
            CPLLLOCKEN           => '0',
            CPLLPD               => '0',
            CPLLREFCLKSEL        => (others => '0'),
            CPLLRESET            => '0',
            DMONFIFORESET        => '0',
            DMONITORCLK          => '0',
            DRPADDR              => (others => '0'),
            DRPCLK               => '0',
            DRPDI                => (others => '0'),
            DRPEN                => '0',
            DRPWE                => '0',
            EVODDPHICALDONE      => '0',
            EVODDPHICALSTART     => '0',
            EVODDPHIDRDEN        => '0',
            EVODDPHIDWREN        => '0',
            EVODDPHIXRDEN        => '0',
            EVODDPHIXWREN        => '0',
            EYESCANMODE          => '0',
            EYESCANRESET         => '0',
            EYESCANTRIGGER       => '0',
            GTGREFCLK            => refClk,
            GTHRXN               => gtRxN(i),
            GTHRXP               => gtRxP(i),
            GTNORTHREFCLK0       => '0',
            GTNORTHREFCLK1       => '0',
            GTREFCLK0            => '0',
            GTREFCLK1            => '0',
            GTRESETSEL           => '0',
            GTRSVD               => (others => '0'),
            GTRXRESET            => '0',
            GTSOUTHREFCLK0       => '0',
            GTSOUTHREFCLK1       => '0',
            GTTXRESET            => '0',
            LOOPBACK             => (others => '0'),
            LPBKRXTXSEREN        => '0',
            LPBKTXRXSEREN        => '0',
            PCIEEQRXEQADAPTDONE  => '0',
            PCIERSTIDLE          => '0',
            PCIERSTTXSYNCSTART   => '0',
            PCIEUSERRATEDONE     => '0',
            PCSRSVDIN            => (others => '0'),
            PCSRSVDIN2           => (others => '0'),
            PMARSVDIN            => (others => '0'),
            QPLL0CLK             => '0',
            QPLL0REFCLK          => '0',
            QPLL1CLK             => '0',
            QPLL1REFCLK          => '0',
            RESETOVRD            => '0',
            RSTCLKENTX           => '0',
            RX8B10BEN            => '0',
            RXBUFRESET           => '0',
            RXCDRFREQRESET       => '0',
            RXCDRHOLD            => '0',
            RXCDROVRDEN          => '0',
            RXCDRRESET           => '0',
            RXCDRRESETRSV        => '0',
            RXCHBONDEN           => '0',
            RXCHBONDI            => (others => '0'),
            RXCHBONDLEVEL        => (others => '0'),
            RXCHBONDMASTER       => '0',
            RXCHBONDSLAVE        => '0',
            RXCOMMADETEN         => '0',
            RXDFEAGCCTRL         => (others => '0'),
            RXDFEAGCHOLD         => '0',
            RXDFEAGCOVRDEN       => '0',
            RXDFELFHOLD          => '0',
            RXDFELFOVRDEN        => '0',
            RXDFELPMRESET        => '0',
            RXDFETAP10HOLD       => '0',
            RXDFETAP10OVRDEN     => '0',
            RXDFETAP11HOLD       => '0',
            RXDFETAP11OVRDEN     => '0',
            RXDFETAP12HOLD       => '0',
            RXDFETAP12OVRDEN     => '0',
            RXDFETAP13HOLD       => '0',
            RXDFETAP13OVRDEN     => '0',
            RXDFETAP14HOLD       => '0',
            RXDFETAP14OVRDEN     => '0',
            RXDFETAP15HOLD       => '0',
            RXDFETAP15OVRDEN     => '0',
            RXDFETAP2HOLD        => '0',
            RXDFETAP2OVRDEN      => '0',
            RXDFETAP3HOLD        => '0',
            RXDFETAP3OVRDEN      => '0',
            RXDFETAP4HOLD        => '0',
            RXDFETAP4OVRDEN      => '0',
            RXDFETAP5HOLD        => '0',
            RXDFETAP5OVRDEN      => '0',
            RXDFETAP6HOLD        => '0',
            RXDFETAP6OVRDEN      => '0',
            RXDFETAP7HOLD        => '0',
            RXDFETAP7OVRDEN      => '0',
            RXDFETAP8HOLD        => '0',
            RXDFETAP8OVRDEN      => '0',
            RXDFETAP9HOLD        => '0',
            RXDFETAP9OVRDEN      => '0',
            RXDFEUTHOLD          => '0',
            RXDFEUTOVRDEN        => '0',
            RXDFEVPHOLD          => '0',
            RXDFEVPOVRDEN        => '0',
            RXDFEVSEN            => '0',
            RXDFEXYDEN           => '0',
            RXDLYBYPASS          => '0',
            RXDLYEN              => '0',
            RXDLYOVRDEN          => '0',
            RXDLYSRESET          => '0',
            RXELECIDLEMODE       => (others => '0'),
            RXGEARBOXSLIP        => '0',
            RXLATCLK             => '0',
            RXLPMEN              => '0',
            RXLPMGCHOLD          => '0',
            RXLPMGCOVRDEN        => '0',
            RXLPMHFHOLD          => '0',
            RXLPMHFOVRDEN        => '0',
            RXLPMLFHOLD          => '0',
            RXLPMLFKLOVRDEN      => '0',
            RXLPMOSHOLD          => '0',
            RXLPMOSOVRDEN        => '0',
            RXMCOMMAALIGNEN      => '0',
            RXMONITORSEL         => (others => '0'),
            RXOOBRESET           => '0',
            RXOSCALRESET         => '0',
            RXOSHOLD             => '0',
            RXOSINTCFG           => (others => '0'),
            RXOSINTEN            => '0',
            RXOSINTHOLD          => '0',
            RXOSINTOVRDEN        => '0',
            RXOSINTSTROBE        => '0',
            RXOSINTTESTOVRDEN    => '0',
            RXOSOVRDEN           => '0',
            RXOUTCLKSEL          => (others => '0'),
            RXPCOMMAALIGNEN      => '0',
            RXPCSRESET           => '0',
            RXPD                 => (others => '1'),  -- power down GTH
            RXPHALIGN            => '0',
            RXPHALIGNEN          => '0',
            RXPHDLYPD            => '0',
            RXPHDLYRESET         => '0',
            RXPHOVRDEN           => '0',
            RXPLLCLKSEL          => (others => '0'),
            RXPMARESET           => '0',
            RXPOLARITY           => '0',
            RXPRBSCNTRESET       => '0',
            RXPRBSSEL            => (others => '0'),
            RXPROGDIVRESET       => '0',
            RXQPIEN              => '0',
            RXRATE               => (others => '0'),
            RXRATEMODE           => '0',
            RXSLIDE              => '0',
            RXSLIPOUTCLK         => '0',
            RXSLIPPMA            => '0',
            RXSYNCALLIN          => '0',
            RXSYNCIN             => '0',
            RXSYNCMODE           => '0',
            RXSYSCLKSEL          => (others => '0'),
            RXUSERRDY            => '0',
            RXUSRCLK             => '0',
            RXUSRCLK2            => '0',
            SIGVALIDCLK          => '0',
            TSTIN                => (others => '0'),
            TX8B10BBYPASS        => (others => '0'),
            TX8B10BEN            => '0',
            TXBUFDIFFCTRL        => (others => '0'),
            TXCOMINIT            => '0',
            TXCOMSAS             => '0',
            TXCOMWAKE            => '0',
            TXCTRL0              => (others => '0'),
            TXCTRL1              => (others => '0'),
            TXCTRL2              => (others => '0'),
            TXDATA               => (others => '0'),
            TXDATAEXTENDRSVD     => (others => '0'),
            TXDEEMPH             => '0',
            TXDETECTRX           => '0',
            TXDIFFCTRL           => (others => '0'),
            TXDIFFPD             => '0',
            TXDLYBYPASS          => '0',
            TXDLYEN              => '0',
            TXDLYHOLD            => '0',
            TXDLYOVRDEN          => '0',
            TXDLYSRESET          => '0',
            TXDLYUPDOWN          => '0',
            TXELECIDLE           => '0',
            TXHEADER             => (others => '0'),
            TXINHIBIT            => '0',
            TXLATCLK             => '0',
            TXMAINCURSOR         => (others => '0'),
            TXMARGIN             => (others => '0'),
            TXOUTCLKSEL          => (others => '0'),
            TXPCSRESET           => '0',
            TXPD                 => (others => '1'),  -- power down GTH
            TXPDELECIDLEMODE     => '0',
            TXPHALIGN            => '0',
            TXPHALIGNEN          => '0',
            TXPHDLYPD            => '0',
            TXPHDLYRESET         => '0',
            TXPHDLYTSTCLK        => '0',
            TXPHINIT             => '0',
            TXPHOVRDEN           => '0',
            TXPIPPMEN            => '0',
            TXPIPPMOVRDEN        => '0',
            TXPIPPMPD            => '0',
            TXPIPPMSEL           => '0',
            TXPIPPMSTEPSIZE      => (others => '0'),
            TXPISOPD             => '0',
            TXPLLCLKSEL          => (others => '0'),
            TXPMARESET           => '0',
            TXPOLARITY           => '0',
            TXPOSTCURSOR         => (others => '0'),
            TXPOSTCURSORINV      => '0',
            TXPRBSFORCEERR       => '0',
            TXPRBSSEL            => (others => '0'),
            TXPRECURSOR          => (others => '0'),
            TXPRECURSORINV       => '0',
            TXPROGDIVRESET       => '0',
            TXQPIBIASEN          => '0',
            TXQPISTRONGPDOWN     => '0',
            TXQPIWEAKPUP         => '0',
            TXRATE               => (others => '0'),
            TXRATEMODE           => '0',
            TXSEQUENCE           => (others => '0'),
            TXSWING              => '0',
            TXSYNCALLIN          => '0',
            TXSYNCIN             => '0',
            TXSYNCMODE           => '0',
            TXSYSCLKSEL          => (others => '0'),
            TXUSERRDY            => '0',
            TXUSRCLK             => '0',
            TXUSRCLK2            => '0');
   end generate GEN_VEC;

end architecture mapping;
