import 'balance/balance.dart';

class EvmApi {
  late final Balance balance;

  EvmApi({Balance? balance})
      : balance = balance ?? Balance();
}