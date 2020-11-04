// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2020 The OduwaUSD Coin developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef ODUWAUSD_COIN_QT_ODUWAUSD_COINADDRESSVALIDATOR_H
#define ODUWAUSD_COIN_QT_ODUWAUSD_COINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class OduwaUSD_CoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit OduwaUSD_CoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** OduwaUSD_Coin address widget validator, checks for a valid oduwausd_coin address.
 */
class OduwaUSD_CoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit OduwaUSD_CoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // ODUWAUSD_COIN_QT_ODUWAUSD_COINADDRESSVALIDATOR_H
