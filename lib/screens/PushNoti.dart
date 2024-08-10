import 'package:flutter/material.dart';

class PushNotifications extends StatelessWidget {
  const PushNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Align(
        alignment: Alignment.center,
        child: Text('Notification Screen',
          style: Theme.of(context).textTheme.headlineMedium,),
      ),
    );  }
}
