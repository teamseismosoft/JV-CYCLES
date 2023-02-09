import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ViewAll extends StatelessWidget {
  ViewAll({super.key});
  var banner = [
    'assets/1.jpg',
    'assets/2.jpeg',
    'assets/3.jpeg',
    'assets/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: banner.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => {},
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                          height: 75,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(banner[index]),
                                fit: BoxFit.fill),
                          ),
                          child: Image(image: AssetImage(banner[index]))),
                      Column(
                        children: [
                          Text(
                            "ssd",
                            style: TextStyle(fontSize: 20),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "price : ",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black87)),
                              TextSpan(
                                  text: "\$ 2000",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black38)),
                            ]),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
