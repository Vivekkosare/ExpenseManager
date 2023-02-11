import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
// const NewTransaction({ Key? key }) : super(key: key);
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(titleController.text, double.parse(amountController.text));
  }

  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            // onChanged: (value) {
            //   titleInput = value;
            // },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData,
            // onChanged: (value) {
            //   amountInput = value;
            // },
          ),
          TextButton(
            onPressed: submitData,
            child: const Text('Add Transaction'),
            style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                padding: EdgeInsets.all(10),
                textStyle: TextStyle(fontSize: 16)),
          )
        ]),
      ),
    );
  }
}
