// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transaction/models/transaction.dart';
import 'package:transaction/widgets/constants/transaction_form.dart';

final formatter = DateFormat.yMMMd();

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory = Category.leisure;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _afficheCalendrier() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 1, now.month, now.day);
    final last = now;

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: first,
      lastDate: last,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  

// Enregistrer la Transaction
  void _submitData() {
    final enteredTitle = _titleController.text.trim();
    final enteredAmount = double.parse(_amountController.text);
    final enteredDate = _selectedDate;
    final enteredCategory = _selectedCategory;
    if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredDate == null || enteredCategory == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    //widget s'ajoute lorsqu'on a transformer en Statefull widget pour acceder a la propriété de la classe widget
    widget.addTx(enteredTitle, enteredAmount, enteredDate, enteredCategory);

    // Fermer automatiquement le formulaire après avoir ajouter
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          TransactionForm(
            titleController: _titleController,
            showCalendar: _afficheCalendrier,
            amountController: _amountController,
            selectedDate: _selectedDate == null
                ? 'Selecte Date'
                : formatter.format(_selectedDate!),

            // value: _selectedCategory,
            
            
          ),
          Row(
            children: [
              DropdownButton(
                items: Category.values
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.name),
                    ))
                .toList(),
                onChanged: (value){
                  setState(() {
                    if (value == null) {
                      return;
                    }
                    _selectedCategory = value;
                  });
                },
              ),
              TextButton(onPressed: () {}, child: const Text('Cancel'),),
              TextButton(onPressed: _submitData, child: const Text('Confirm')),
            ],
          
          )
        ],
      ),
      
    );
  }
}
