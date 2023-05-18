import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController _titleController;
  final TextEditingController _amountController;
  final VoidCallback showCalendar;
  final String _selectedDate;

  const TransactionForm({
    super.key, 
    required TextEditingController titleController,
    required this.showCalendar,
    required TextEditingController amountController,
    required String selectedDate,
  })  : _selectedDate = selectedDate,
        _amountController = amountController,
        _titleController = titleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: 'add title here',
              labelText: 'Title',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    hintText: 'add amount here',
                    labelText: 'Amount',
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: showCalendar,
                    icon: Icon(Icons.calendar_month),
                  ),
                  Text(_selectedDate),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
