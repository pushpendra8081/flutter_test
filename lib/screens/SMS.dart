import 'package:flutter/material.dart';

class SmsScreen extends StatelessWidget {
  const SmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Align(
        alignment: Alignment.center,
        child: Text('SMS Screen',
          style: Theme.of(context).textTheme.headlineMedium,),
      ),
    );  }
}
