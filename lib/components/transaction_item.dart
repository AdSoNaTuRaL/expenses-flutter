import 'package:expenses/models/transaction.dart';
import 'package:expenses/utils/formatValue.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final void Function(String p1) onRemove;

  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Text(formatValue(transaction.value)),
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
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () => onRemove(transaction.id),
                label: Text('Excluir'),
                icon: Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => onRemove(transaction.id),
              ),
      ),
    );
  }
}
