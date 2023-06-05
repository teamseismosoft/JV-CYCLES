
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:go_router/go_router.dart';
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

      body: ListView(children: [
      Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),),
        Column(

          children: [

            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(top: 18,left:10),
            //       child: Text("crave for FIT?",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.red),),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(onPressed:()=>context.go('/search'),
                style:ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent,padding: EdgeInsets.all(10)),


                child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('search product',style: TextStyle(color: Colors.black.withOpacity(.3)),),Icon(Icons.search,color: Colors.black,)],
                ),
                      ),

              ),),
            ),
            Container(padding:EdgeInsets.all(10),alignment: Alignment.centerLeft,
    child:Text('Hot Deals 🔥',style: TextStyle(fontSize: 20),)),
            CarouselSlider.builder(
              itemCount: banner.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      CaroselContainer(banner[itemIndex]),
              options: CarouselOptions(
                height: 230,
                enlargeCenterPage: true,
                autoPlay: true,
                // autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                viewportFraction: 0.8,
                scrollDirection: Axis.horizontal,
              ),
            ),
    Container(padding:EdgeInsets.symmetric(horizontal: 10),child:
            Column(
              children: [
                Text("New Arrivals ",style: TextStyle(fontSize: 20)),
                Text("____________",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20),)
              ],
              
            ),),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CarouselSlider.builder(
                itemCount: banner.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                    CaroselContainer(banner[itemIndex]),
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                  viewportFraction: 0.8,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
            Container(
              child: Container(

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
                color: Color.fromARGB(255, 250, 183, 139),
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
