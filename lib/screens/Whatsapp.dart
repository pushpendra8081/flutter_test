import 'package:flutter/material.dart';

class WhatsappScreen extends StatelessWidget {
  const WhatsappScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Align(
        alignment: Alignment.center,
        child: Text('WhatsApp Screen',
          style: Theme.of(context).textTheme.headlineMedium,),
      ),
    );  }
}
