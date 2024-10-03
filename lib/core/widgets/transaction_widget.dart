import 'package:card_trail/core/widgets/month_header.dart';
import 'package:card_trail/core/widgets/transaction_grid.dart';
import 'package:card_trail/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  final List<DailyTransactions> transactions;

  const TransactionWidget({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final reversedTransactions = transactions.reversed.toList();
    int rows = 7;
    int columns = (reversedTransactions.length / rows).ceil();

    List<String> monthHeaders = _generateMonthHeaders(reversedTransactions, rows, columns);

    double maxSpending = transactions.isNotEmpty
        ? transactions.map((t) => t.totalAmountSpent).reduce((a, b) => a > b ? a : b)
        : 0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 14, 17, 23),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 1000,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10),
                        Text("Mon", style: TextStyle(color: Colors.white)),
                        Text("Wed", style: TextStyle(color: Colors.white)),
                        Text("Fri", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MonthHeader(monthHeaders: monthHeaders),
                        const SizedBox(height: 5),
                        Expanded(
                          child: TransactionGrid(
                            rows: rows,
                            columns: columns,
                            reversedTransactions: reversedTransactions,
                            maxSpending: maxSpending,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> _generateMonthHeaders(List<DailyTransactions> transactions, int rows, int columns) {
    List<String> monthHeaders = [];
    for (int i = 0; i < columns; i++) {
      int actualIndex = i * rows;
      if (actualIndex < transactions.length) {
        String month = DateFormat.MMM().format(transactions[actualIndex].date);
        if (monthHeaders.isEmpty || monthHeaders.last != month) {
          monthHeaders.add(month);
        }
      }
    }
    return monthHeaders;
  }
}
