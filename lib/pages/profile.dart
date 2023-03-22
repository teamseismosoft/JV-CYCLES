import 'package:flutter/material.dart';
import 'package:jv_cycles/widgets/profileButtons.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'J V CYCLES',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: CircleAvatar(
              radius: 70,
            ),
          ),
          const Text(
            'NAME',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const Text('EMAIL'),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: Row(
              children: [
                RoundedButton('Cart'),
                const Spacer(),
                RoundedButton('Your Orders'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
