import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const income = 7500.00;
    const expense = 5000.00;
    const balance = income - expense;

    const monthYear = 'JANUARY 2023';

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(.15),
        borderRadius: BorderRadius.circular(18),
      ),
      height: 200,
      width: MediaQuery.of(context).size.width - 24,
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        child: SummaryCardContent(
          monthYear: monthYear,
          balance: balance,
          income: income,
          expense: expense,
        ),
      ),
    );
  }
}

class SummaryCardContent extends StatelessWidget {
  const SummaryCardContent({
    super.key,
    required this.monthYear,
    required this.balance,
    required this.income,
    required this.expense,
  });

  final String monthYear;
  final double balance;
  final double income;
  final double expense;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        HeaderCard(monthYear: monthYear),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: CurrentBalanceDisplay(balance: balance),
        ),
        const SizedBox(height: 20),
        IncomeExpensesRow(income: income, expense: expense)
      ],
    );
  }
}

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
    required this.monthYear,
  });

  final String monthYear;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          monthYear,
          style: TextStyle(
            color: Colors.white.withOpacity(.7),
          ),
        ),
        // credit card icon
        Icon(
          Icons.credit_card,
          color: Colors.white.withOpacity(.7),
          size: 24,
        ),
      ],
    );
  }
}

class CurrentBalanceDisplay extends StatelessWidget {
  const CurrentBalanceDisplay({
    super.key,
    required this.balance,
  });

  final double balance;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$balance' '€',
          style: GoogleFonts.robotoMono(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 20),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.greenAccent.shade400.withOpacity(.2),
            borderRadius: BorderRadius.circular(0),
          ),
          child: Icon(
            Icons.arrow_upward,
            color: Colors.greenAccent.shade400,
            size: 32,
          ),
        ),

        // income & expense
      ],
    );
  }
}

class IncomeExpensesRow extends StatelessWidget {
  const IncomeExpensesRow({
    super.key,
    required this.income,
    required this.expense,
  });

  final double income;
  final double expense;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // income
        IncomeExpensesDisplay(
          value: income,
          isExpenses: false,
        ),

        // expense
        const SizedBox(width: 20),
        IncomeExpensesDisplay(
          value: income,
          isExpenses: true,
        ),

        const SizedBox(width: 15),
      ],
    );
  }
}

class IncomeExpensesDisplay extends StatelessWidget {
  const IncomeExpensesDisplay({
    super.key,
    required this.value,
    required this.isExpenses,
  });

  final double value;
  final bool isExpenses;

  @override
  Widget build(BuildContext context) {
    final label = isExpenses ? 'EXPENSES' : 'MY INCOME';

    final color =
        isExpenses ? Colors.redAccent.shade400 : Colors.greenAccent.shade400;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            color: Colors.white.withOpacity(.7),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          r'$' '$value',
          style: TextStyle(
            color: color,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
