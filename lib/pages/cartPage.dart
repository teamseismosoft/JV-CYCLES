import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jv_cycles/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jv_cycles/widgets/cartItems.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late int TotalCost = 0;
  List cartItems = [];

  User? user;

  @override
  @override
  void initState() {
    super.initState();
    user = Auth().currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.amberAccent,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    LineAwesomeIcons.shopping_bag,
                  ),
                ),
                Text(
                  'Cart Items',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )),
          ),
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text('No data available'),
              );
            }
            DocumentSnapshot<Map<String, dynamic>>? parentSnapshot =
                snapshot.data;
            if (parentSnapshot!.exists) {
              List cartItems = parentSnapshot['cart'];
              TotalCost = 0;
              for (int i = 0; i < cartItems.length; i++) {
                TotalCost += int.parse(cartItems[i]['Price']);
              }
            }
            if (cartItems.isNotEmpty) {
              return Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('products')
                          .doc(cartItems[index])
                          .get(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Text('No Data');
                        } else {
                          return CartItemsRow(
                            title: snapshot.data!['name'],
                            price: snapshot.data!['currentPrice'],
                            id: snapshot.data!.id,
                          );
                        }
                      },
                    );
                  },
                ),
              );
            } else {
              return const Text('Cart is Empty !');
            }
          },
        ),
      ]),
    );
  }
}
