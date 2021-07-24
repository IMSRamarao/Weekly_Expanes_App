
import '../widgets/adapative_flat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransation extends StatefulWidget {
  final Function addnewtransaction;
  NewTransation(this.addnewtransaction){
    print('Constructor NewTransation Widget');
  }

  @override
  _NewTransationState createState() {
    print('CreateState NewTransation Widget');
    return _NewTransationState();
  }
}

class _NewTransationState extends State<NewTransation> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTransationState() {
    print('Constructor NewTransation State');
  }
  @override
  void initState() {
    print('initState()');
    super.initState();
  }
  @override
  void didUpdateWidget(NewTransation oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    print('dospose()');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addnewtransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                // onChanged: (val) {
                //   titleInput = val;
                // },
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                // onChanged: (val) {
                //   amountInput = val;
                // },
                keyboardType: TextInputType.number,
                controller: _amountController,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Choosen!'
                            : 'Picked Date: ${DateFormat.yMMMd().format(_selectedDate)}',
                      ),
                    ),
                    AdapativeFlatButton('Choose Date', _presentDatepicker),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _submitData,
                child: Text('Add Transation'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
