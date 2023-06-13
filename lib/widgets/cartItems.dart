import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class CartItemsRow extends StatelessWidget {
  CartItemsRow({
    super.key,
    required this.title,
    required this.price,
    required this.id,
  });

  final String title;
  final int price;
  final String id;

  User? user = Auth().currentUser;
  List cartList = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            Text(
              price as String,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(user?.uid)
                    .get()
                    .then((value) {
                  cartList = value.data()!['cart'];
                });
                cartList.remove(id);
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(user?.uid)
                    .update({'cart': cartList});
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          ],
        )
      ],
    );
  }
}
