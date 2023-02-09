import 'package:flutter/material.dart';

class CaroselContainer extends StatelessWidget {
  const CaroselContainer(this.img, {super.key});

  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(img)),
      ),
      width: MediaQuery.of(context).size.width - 30,
      height: 175,
    );
  }
}

class FeaturedContainer extends StatelessWidget {
  const FeaturedContainer(this.img, this.text, {super.key});

  final String img, text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueAccent,
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.fill,
            ),
          ),
          width: 120,
          height: 70,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              color: const Color.fromARGB(218, 158, 158, 158),
              child: Center(
                  child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
