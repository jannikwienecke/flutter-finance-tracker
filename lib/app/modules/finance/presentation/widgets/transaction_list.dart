import 'package:flutter/material.dart';
import 'package:notes/app/modules/finance/presentation/widgets/transactions_card.dart';

class GlasmorphismWrapperTransactionList extends StatelessWidget {
  const GlasmorphismWrapperTransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return const TransactionsCard();
    // return SizedBox(
    //   width: MediaQuery.of(context).size.width,
    //   child: ClipRRect(
    //     child: BackdropFilter(
    //       filter: ImageFilter.blur(
    //         sigmaX: 5,
    //         sigmaY: 5,
    //       ),
    //       child: const Center(
    //         child: TransactionsCard(),
    //       ),
    //     ),
    //   ),
    // );
  }
}
