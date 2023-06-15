import 'balance/balance.dart';
import 'transactions/transactions.dart';

class EvmApi {
  late final Balance balance;
  late final Transactions transaction;

  EvmApi({Balance? balance, Transactions? transaction})
      : balance = balance ?? Balance(),
        transaction = transaction ?? Transactions();
}
