class Transaction {
  final String category;
  final double amount;
  final bool isCredit;
  final DateTime date;

  Transaction({
    required this.category,
    required this.amount,
    required this.isCredit,
    required this.date,
  });
}

class DailyTransactions {
  final DateTime date;
  final List<Transaction> transactions;

  double get totalAmountSpent => transactions
      .where((t) => !t.isCredit)
      .fold(0.0, (sum, t) => sum + t.amount);

  DailyTransactions({required this.date, required this.transactions});
}
