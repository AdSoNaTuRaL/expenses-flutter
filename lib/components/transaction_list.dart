import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      child: transactions.isEmpty ? Column(
        children: [
          Text(
            'Nenhuma transação cadastrada!',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 40),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,  
            ),
          ),
        ],
      ) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final transaction = transactions[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('R\$${transaction.value}')
                  ),
                ),
              ),
              title: Text(
                transaction.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(transaction.time),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete), 
                color: Theme.of(context).errorColor,
                onPressed: () => onRemove(transaction.id)
              ),
            ),
          );
        },
      ),
    );
  }
}
