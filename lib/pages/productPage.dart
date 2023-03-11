import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jv_cycles/widgets/carouselContainer.dart';
import 'package:jv_cycles/widgets/productSpec.dart';

class ProductPage extends StatefulWidget {
  String? id;
  ProductPage({super.key, this.id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final productRef = FirebaseFirestore.instance.collection('products');

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
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('products')
              .doc(widget.id)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 230,
                          width: MediaQuery.of(context).size.width - 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amberAccent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data!['name'],
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Text(
                        'PRICING',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 85,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 3,
                          child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 210, 210, 210),
                                // border: Border.all(color: Colors.grey),
                                // boxShadow: [
                                //   BoxShadow(color: Colors.grey, blurRadius: 3),
                                // ],
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'MRP',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '₹ ${snapshot.data!['currentPrice']}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '₹ ${snapshot.data!['actualPrice']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  Text(
                                    "(${snapshot.data!['discount']}%)",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'SPECIFICATION',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 145,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 5),
                      ProductSpecBox('TYPE', '${snapshot.data!['type']}'),
                      ProductSpecBox(
                          'GENDER', '${snapshot.data!['bottleholder']}'),
                      ProductSpecBox('WEIGHT', '${snapshot.data!['weight']}'),
                      ProductSpecBox('EXPERTISE LEVEL',
                          '${snapshot.data!['expertise level']}'),
                      ProductSpecBox('FRAME MATERIAL',
                          '${snapshot.data!['frame material']}'),
                      ProductSpecBox(
                          'FRAME SIZE', '${snapshot.data!['frame size']}'),
                      ProductSpecBox(
                          'TYRE SIZE', '${snapshot.data!['tyre size']}'),
                      ProductSpecBox('BRAKES', '${snapshot.data!['brakes']}'),
                      ProductSpecBox(
                          'SUSPENSION', '${snapshot.data!['suspension']}'),
                      ProductSpecBox('GEARS', '${snapshot.data!['gears']}'),
                      ProductSpecBox('COLOR', '${snapshot.data!['color']}'),
                      ProductSpecBox(
                          'TYRE SIZE', '${snapshot.data!['tyre size']}'),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
