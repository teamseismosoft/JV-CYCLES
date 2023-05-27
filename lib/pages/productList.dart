import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jv_cycles/data/fetch.dart';
import 'package:jv_cycles/pages/productPage.dart';

class gridView extends StatefulWidget {
  const gridView({super.key});

  @override
  State<gridView> createState() => _gridViewState();
}

class _gridViewState extends State<gridView> {
  List<Data> Product = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    var records = await FirebaseFirestore.instance.collection('products').get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<dynamic, dynamic>> records) {
    var lst = records.docs
        .map((product) => Data(
              id: product.id,
              name: product['name'],
              actualPrice: product['actualPrice'],
              currentPrice: product['currentPrice'],
              discount: product['discount'],
              image: product['image'],
            ))
        .toList();

    setState(() {
      Product = lst;
    });
  }

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
      body: ListView.builder(
        itemCount: Product.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => ProductPage(id: Product[index].id),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 90,
                  child: Image.network(
                    Product[index].image,
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 25),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 150,
                  child: Column(
                    children: [
                      Text(
                        Product[index].name,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '₹ ${Product[index].currentPrice}',
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('₹ ${Product[index].actualPrice}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.lineThrough)),
                          ),
                          Text(
                            "(${Product[index].discount}%)",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
