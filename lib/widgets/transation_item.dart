import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Transaction.dart';

class TransationItem extends StatefulWidget {
  const TransationItem({
    Key key,
    @required this.transation,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transation;
  final Function deleteTx;

  @override
  _TransationItemState createState() => _TransationItemState();
}

class _TransationItemState extends State<TransationItem> {
  Color _bgColor;
  
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.black,
      Colors.purple,
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 8,
      ),
      child: ListTile(
        leading: CircleAvatar(
          //backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text(
                '\$${widget.transation.amount.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        title: Text(
          '${widget.transation.title}',
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(widget.transation.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => widget.deleteTx(widget.transation.id),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.transation.id),
              ),
      ),
    );
  }
}
