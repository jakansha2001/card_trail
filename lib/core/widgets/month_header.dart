import 'package:flutter/material.dart';

class MonthHeader extends StatelessWidget {
  const MonthHeader({super.key, required this.monthHeaders});

  final List<String> monthHeaders;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: monthHeaders.expand((month) {
        return [
          Text(
            month,
            style: const TextStyle(color: Colors.white),
          ),
          const Spacer(),
        ];
      }).toList(),
    );
  }
}
