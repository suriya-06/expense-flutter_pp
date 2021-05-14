import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  final Function addtx;

  UserInput(this.addtx);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final titleContoller = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleContoller,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                widget.addtx(
                    titleContoller.text, double.parse(amountController.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
