// Get Transactions of a wallet address
import 'package:flutter/material.dart';
import 'package:moralis/EVM/chains/chains.dart';
import 'package:moralis/EVM/transactions/models/model.dart';
import 'package:moralis/moralis.dart';

class TransactionList extends StatelessWidget {
  final String walletAddress;
  final EvmChain chain;

  TransactionList({required this.walletAddress, required this.chain});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: Moralis().evmApi.transaction.getTransactionByWallet(
            address: walletAddress,
            chain: chain,
          ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<Transaction> transactions = snapshot.data ?? [];

          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final Transaction transaction = transactions[index];
              // Customize how each transaction is displayed in the list
              return ListTile(
                title: Text('Hash: ${transaction.hash}'),
                subtitle: Text(
                    'From: ${transaction.fromAddress}, To: ${transaction.toAddress}'),
              );
            },
          );
        }
      },
    );
  }
}
