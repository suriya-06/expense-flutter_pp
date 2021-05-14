import 'package:expense/Widgets/UserInput.dart';
import 'models/transaction.dart';
import 'Widgets/TransactionList.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> _transaction = [];
  void _addTransaction(String title, double amount) {
    final newtx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      _transaction.add(newtx);
    });
  }

  void _addNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (bctx) {
        return GestureDetector(
          onTap: () {},
          child: UserInput(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 5,
                color: Colors.blue,
                child: Text('Chart'),
              ),
            ),
            TransactionList(_transaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addNewTransaction(context),
      ),
    );
  }
}
