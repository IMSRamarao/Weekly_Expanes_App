import 'package:flutter/material.dart';
import './transation_item.dart';
import '../models/Transaction.dart';

class TransationList extends StatelessWidget {
  final List<Transaction> transations;
  final Function deleteTx;
  TransationList(this.transations, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 550,
        child: transations.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No transations Added yet! ',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.7,
                      child: Image.asset(
                        'assets/images/custom_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              })
            : ListView(
                children: transations
                    .map((tx) => TransationItem(
                        key: ValueKey(tx.id),
                          transation: tx,
                          deleteTx: deleteTx,
                        ))
                    .toList(),
              )
        // : ListView.builder(
        //     itemBuilder: (ctx, index) {
        //       return TransationItem(transation: transations[index], deleteTx: deleteTx);
        //     },
        //     itemCount: transations.length,
        //   ),
        );
  }
}
