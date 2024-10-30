import 'package:expense_manager/components/TransactionView.dart';
import 'package:expense_manager/model/Cardmodel.dart';
import 'package:expense_manager/model/TransactionModel.dart';
import 'package:flutter/material.dart';

import 'components/CardView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        elevation: 0,
        leading: null,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.black45,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Card View
              Container(
                height: 210,
                child: CardView(
                  CardModel(
                    id: 1,
                    available: 1000,
                    bankName: 'ICICI Bank',
                    currency: 'INR',
                    name: 'MasterCard',
                    number: '1234 **** **** 4321',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              //Last Transactions
              Text(
                'Last Transactions',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TransactionView(
                transaction: TransactionModel(
                    id: 1,
                    name: 'Shopping',
                    price: 1000,
                    type: '+',
                    currency: 'INR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
