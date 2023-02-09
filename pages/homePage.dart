import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jv_cycles/pages/sideBar.dart';
import 'package:jv_cycles/widgets/carouselContainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      drawer: const sideBar(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'JV Cycles',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: const [
              CaroselContainer('assets/1.jpg'),
              CaroselContainer('assets/2.jpeg'),
              CaroselContainer('assets/3.jpeg'),
              CaroselContainer('assets/4.jpg'),
            ],
            options: CarouselOptions(
              height: 180,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(seconds: 4),
              viewportFraction: 0.8,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade400,
                  ),
                  width: MediaQuery.of(context).size.width - 30,
                  height: 60,
                  child: Row(children: [
                    Container(
                        height: 50,
                        width: 80,
                        child:
                            const Image(image: AssetImage('assets/LOGO.png'))),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'View All',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.arrow_right,
                        size: 35,
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width - 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade400,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5, bottom: 10),
                  child: Row(
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: Colors.white)),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'More',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const <Widget>[
                        FeaturedContainer('assets/11.png', 'KIDS'),
                        FeaturedContainer('assets/12.png', 'LADY BIRD'),
                        FeaturedContainer('assets/13.png', 'BOYS'),
                        FeaturedContainer('assets/14.png', 'ROADSTER')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
