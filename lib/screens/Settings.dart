import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Align(
        alignment: Alignment.center,
        child: Text('Settings Screen',
          style: Theme.of(context).textTheme.headlineMedium,),
      ),
    );  }
}
