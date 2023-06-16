import 'package:flutter_test/flutter_test.dart';
import 'package:moralis/EVM/chains/chains.dart';
import 'package:moralis/EVM/transactions/models/model.dart';
import 'package:moralis/moralis.dart';

void main() {
  test('moralis test', () async {
    final moralis = Moralis();
    Moralis.setApiKey(
        apikey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub25jZSI6IjhmMjNjNjdlLThhZGQtNGU1Zi1hOTQwLTYyZDMzZjdkOTc1ZSIsIm9yZ0lkIjoiMzQyNjI2IiwidXNlcklkIjoiMzUyMjI1IiwidHlwZUlkIjoiNDQ3NDBhMGMtMzRmYy00NmQ1LWEyZjktZjAyNzRiNmJjMDdjIiwidHlwZSI6IlBST0pFQ1QiLCJpYXQiOjE2ODYzOTg4NzUsImV4cCI6NDg0MjE1ODg3NX0.pVjXd8kVre1AHr7zvilkEYglCRZeSBrBTC18srmXILM');

    // expect(
    //     await moralis.evmApi.balance
    //         .getNativeBalanceMulti(chain: EvmChain.polygon, addresses: [
    //       '0xA2e92FF56beE6ECe711eCB976a988D216265BAB5',
    //     ]),
    //     [
    //       {
    //         'address': '0xa2e92ff56bee6ece711ecb976a988d216265bab5',
    //         'balance': '539274471165071484',
    //         'balance_formatted': '0.539274471165071484'
    //       }
    //     ]);
    // expect(
    //     await moralis.evmApi.balance.getNativeBalance(
    //         chain: EvmChain.bsc,
    //         address: '0x8405b8721942ea462f8e0Cc3215591DAE5e1f660'),
    //     "0.00078905");

    // final transaction = await moralis.evmApi.transaction.getTransactionByWallet(
    //     chain: EvmChain.bsc,
    //     address: '0x8405b8721942ea462f8e0Cc3215591DAE5e1f660');

    // expect(transaction, isNotNull);
    // expect(transaction, isList);
    // expect(transaction.length, greaterThan(0));
    // expect(transaction[0], isInstanceOf<Transaction>());
  });
}
