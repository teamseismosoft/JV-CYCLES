import 'package:flutter/material.dart';

class ProductSpecBox extends StatelessWidget {
  final String? title, Value;
  const ProductSpecBox(this.title, this.Value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
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
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    )),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Value!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
