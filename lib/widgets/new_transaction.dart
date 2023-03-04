// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 ){
      return;
    } 

    //widget s'ajoute lorsqu'on a transformer en Statefull widget pour acceder a la propriété de la classe widget
    widget.addTx(enteredTitle,enteredAmount);

  // Fermer automatiquement le formulaire après avoir ajouter
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Champs Titre 
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Add the Title',
                      labelText: 'Title',
                    ),
                    //onChanged: (value) => titleInput = value,
                    controller: titleController,
                    onSubmitted: (_) => submitData(),
                  ),

                  // Champs Amount
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Add the Amount',
                      labelText: 'Amount',
                    ),
                    //onChanged: (value) => amountInput = value,
                    controller: amountController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => submitData(),
                  ),

                  // Champs Date 
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Add the Date',
                      labelText: 'Date',
                      
                    ),
                    keyboardType: TextInputType.datetime,
                    onSubmitted: (_) => submitData(),
                  ),

                  // Boutton d'Ajout 
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        OutlinedButton(
                          child: Text(
                            'Add Transaction',
                            style: TextStyle(color: Colors.green),
                          ),
                          onPressed: () => {
                            print(titleController.text),
                            print(amountController.text),
                            submitData,
                            
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}