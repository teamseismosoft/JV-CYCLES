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
          const Text('MOBILE NO : 1234567890'),
          const Text('EMAIL : nitpy@gmail.com'),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: const Text(
                  'Address Line 1\nAddress Line 2\nAddress Line 3\nPin Code',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: const [
                RoundedButton('Cart'),
                Spacer(),
                RoundedButton('Your Orders'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: const [
                RoundedButton('Your Account'),
                Spacer(),
                RoundedButton('Your Address'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
