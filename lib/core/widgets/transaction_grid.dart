import 'package:card_trail/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionGrid extends StatelessWidget {
  const TransactionGrid(
      {super.key,
      required this.rows,
      required this.columns,
      required this.maxSpending,
      required this.reversedTransactions});

  final int rows;
  final int columns;
  final double maxSpending;
  final List<DailyTransactions> reversedTransactions;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: reversedTransactions.length,
      itemBuilder: (context, index) {
        int column = index % columns;
        int row = index ~/ columns;
        int actualIndex = row + column * rows;

        if (actualIndex >= reversedTransactions.length) {
          return Container();
        }

        Color color = _getColorForSpending(
            reversedTransactions[actualIndex].totalAmountSpent, maxSpending);

        return GestureDetector(
          onTap: () {
            if (reversedTransactions[actualIndex].transactions.isNotEmpty) {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView.builder(
                    itemCount:
                        reversedTransactions[actualIndex].transactions.length,
                    itemBuilder: (context, innerIndex) {
                      Transaction transaction =
                          reversedTransactions[actualIndex]
                              .transactions[innerIndex];
                      return ListTile(
                        title: Text(transaction.category),
                        subtitle: Row(
                          children: [
                            transaction.isCredit
                                ? Container()
                                : const Text(
                                    "-",
                                    style: TextStyle(color: Colors.red),
                                  ),
                            Text(
                              transaction.amount.toStringAsFixed(2),
                              style: TextStyle(
                                color: transaction.isCredit
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                        trailing: Text(DateFormat.yMMMMd()
                            .format(reversedTransactions[actualIndex].date)),
                      );
                    },
                  );
                },
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("No transaction available at the moment"),
              ));
            }
          },
          child: Container(
            color: color,
            margin: const EdgeInsets.all(2.0),
          ),
        );
      },
    );
  }

  Color _getColorForSpending(double spending, double maxSpending) {
    double normalizedSpending = spending / maxSpending;
    double brightness = normalizedSpending.clamp(0, 1);
    return HSVColor.fromAHSV(1.0, 120, 1.0, brightness).toColor();
  }
}
