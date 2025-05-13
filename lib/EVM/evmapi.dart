import 'balance/balance.dart';
import 'nft/nft.dart';
import 'transactions/transactions.dart';

class EvmApi {
  late final Balance balance;
  late final Transactions transaction;
  late final NFT nft;

  EvmApi({
    Balance? balance,
    Transactions? transaction,
    NFT? nft,
  })  : balance = balance ?? Balance(),
        nft = nft ?? NFT(),
        transaction = transaction ?? Transactions();
}
