import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:jv_cycles/pages/loginPage.dart';
import 'package:jv_cycles/pages/productList.dart';
import 'package:jv_cycles/pages/profile.dart';
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
    var banner = [
      'assets/1.jpg',
      'assets/2.jpeg',
      'assets/3.jpeg',
      'assets/4.jpg',
    ];

    return Scaffold(
      //extendBodyBehindAppBar: true,
      drawer: const sideBar(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Column(
      //     children: [
      //       Text('data'),
      //       Icon(Icons.add),
      //     ],
      //   ),
      // ),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => gridView(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                repeat: ImageRepeat.noRepeat,
                image: Svg('assets/background.svg'),
                fit: BoxFit.fill),
          ),
        ),
        Column(
          children: [
            CarouselSlider.builder(
              itemCount: banner.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      CaroselContainer(banner[itemIndex]),
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(seconds: 3),
                viewportFraction: 0.8,
                scrollDirection: Axis.horizontal,
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ViewAll(),
            //       ),
            //     );
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Center(
            //       child: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(5),
            //           color: Colors.grey.shade400,
            //         ),
            //         width: MediaQuery.of(context).size.width - 30,
            //         height: 60,
            //         child: Row(children: const [
            //           SizedBox(
            //               height: 50,
            //               width: 80,
            //               child: Image(image: AssetImage('assets/LOGO.png'))),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Text(
            //             'View All',
            //             style:
            //                 TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            //           ),
            //           Spacer(),
            //           Padding(
            //             padding: EdgeInsets.only(right: 15),
            //             child: Icon(
            //               Icons.arrow_right,
            //               size: 35,
            //             ),
            //           )
            //         ]),
            //       ),
            //     ),
            //   ),
            // ),
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
                    padding:
                        const EdgeInsets.only(left: 15, top: 5, bottom: 10),
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
                                    side:
                                        const BorderSide(color: Colors.white)),
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
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => profilePage(),
                      ),
                    );
                  },
                  child: Text('PROFILE PAGE')),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text('LOG IN PAGE')),
            )
          ],
        ),
      ]),
    );
  }
}
