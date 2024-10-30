import 'package:flutter/material.dart';

import '../model/TransactionModel.dart';

class TransactionView extends StatefulWidget {
  final TransactionModel transaction;

  TransactionView({Key? key, required this.transaction}) : super();

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              widget.transaction.type == '-'
                  ? Icon(
                      Icons.arrow_downward,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                    ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.transaction.name,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.transaction.type + widget.transaction.price.toString(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.transaction.currency,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
