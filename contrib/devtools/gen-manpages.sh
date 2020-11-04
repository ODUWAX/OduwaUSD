#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

ODUWAUSD_COIND=${ODUWAUSD_COIND:-$BINDIR/oduwausd_coind}
ODUWAUSD_COINCLI=${ODUWAUSD_COINCLI:-$BINDIR/oduwausd_coin-cli}
ODUWAUSD_COINTX=${ODUWAUSD_COINTX:-$BINDIR/oduwausd_coin-tx}
ODUWAUSD_COINQT=${ODUWAUSD_COINQT:-$BINDIR/qt/oduwausd_coin-qt}

[ ! -x $ODUWAUSD_COIND ] && echo "$ODUWAUSD_COIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
OWDTVER=($($ODUWAUSD_COINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for oduwausd_coind if --version-string is not set,
# but has different outcomes for oduwausd_coin-qt and oduwausd_coin-cli.
echo "[COPYRIGHT]" > footer.h2m
$ODUWAUSD_COIND --version | sed -n '1!p' >> footer.h2m

for cmd in $ODUWAUSD_COIND $ODUWAUSD_COINCLI $ODUWAUSD_COINTX $ODUWAUSD_COINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${OWDTVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${OWDTVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
