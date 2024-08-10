import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Align(
        alignment: Alignment.center,
        child: Text('Dashboard Screen',
        style: Theme.of(context).textTheme.headlineMedium,),
      ),
    );
  }
}
