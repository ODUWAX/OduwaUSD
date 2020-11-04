OduwaUSD_Coin version 0.6.3 is now available for download at:
  http://sourceforge.net/projects/oduwausd_coin/files/OduwaUSD_Coin/oduwausd_coin-0.6.3/

This is a bug-fix release, with no new features.

Please report bugs using the issue tracker at github:
  https://github.com/oduwausd_coin/oduwausd_coin/issues

CHANGE SUMMARY

Fixed a serious denial-of-service attack that could cause the
oduwausd_coin process to become unresponsive. Thanks to Sergio Lerner
for finding and responsibly reporting the problem. (CVE-2012-3789)

Optimized the process of checking transaction signatures, to
speed up processing of new block messages and make propagating
blocks across the network faster.

Fixed an obscure bug that could cause the oduwausd_coin process to get
stuck on an invalid block-chain, if the invalid chain was
hundreds of blocks long.

OduwaUSD_Coin-Qt no longer automatically selects the first address
in the address book (Issue #1384).

Fixed minimize-to-dock behavior of OduwaUSD_Coin-Qt on the Mac.

Added a block checkpoint at block 185,333 to speed up initial
blockchain download.
