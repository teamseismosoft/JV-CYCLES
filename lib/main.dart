import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jv_cycles/pages/cartPage.dart';
import 'package:jv_cycles/pages/homePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:jv_cycles/pages/loginCheck.dart';
import 'package:jv_cycles/pages/loginPage.dart';
import 'package:jv_cycles/pages/paymentPage.dart';
import 'package:jv_cycles/pages/profile.dart';
import 'package:jv_cycles/pages/sideBar.dart';
import 'package:flutter/material.dart' hide Stack;
import 'package:jv_cycles/pages/test.dart';
import 'package:jv_cycles/pages/viewAll.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:jv_cycles/pages/search.dart';

final rootNavKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
      );
}

final GoRouter _router = GoRouter(
  initialLocation: "/",
  navigatorKey: rootNavKey,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return root(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const HomePage(),
          routes: [
            GoRoute(
              path: 'login',
              builder: (BuildContext context, GoRouterState state) =>
                  LoginPage(pageKey: 1),
            ),
            GoRoute(
                path: 'home',
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage()),
            GoRoute(
                path: 'profile',
                builder: (BuildContext context, GoRouterState state) =>
                    const profilePage()),
            GoRoute(
                path: 'viewall',
                builder: (BuildContext context, GoRouterState state) =>
                    ViewAll()),
            GoRoute(
                path: 'search',
                builder: (BuildContext context, GoRouterState state) =>
                    const SearchProduct()),
            GoRoute(
              path: 'cart',
              builder: (BuildContext context, GoRouterState state) =>
                  LoginCheckPage(
                page: const CartPage(),
              ),
              // const TestPage(),
              // const PaymentPage(
              //   deliveryCharges: 50,
              //   quantity: 2,
              //   totalCost: 1000,
              // ))
            )
          ],
        ),
      ],
    ),
  ],
);

class root extends StatefulWidget {
  final Widget child;

  const root({super.key, required this.child});

  @override
  State<root> createState() => _rootState();
}

class _rootState extends State<root> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    // const TextStyle optionStyle =
    // TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
    // const List<Widget> _widgetOptions = <Widget>[
    //   Text(
    //     'Home',
    //     style: optionStyle,
    //   ),
    //   Text(
    //     'cart',
    //     style: optionStyle,
    //   ),
    //   Text(
    //     'view all',
    //     style: optionStyle,
    //   ),
    //   Text(
    //     'Profile',
    //     style: optionStyle,
    //   ),
    // ];
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        drawer: const sideBar(),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white12,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  Padding(
              //   padding: EdgeInsets.only(left: 4),
              //   child:  Text(
              //     'jv',
              //       style:  GoogleFonts.abyssinicaSil (fontSize: 35,color: Colors.black,fontWeight: FontWeight.bold)
              //   ),
              // ),

              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 250, 183, 139),
                      border: Border.all(color: Colors.white24)),
                  child: IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 250, 183, 139),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: IconButton(
                    onPressed: () => context.go('/profile'),
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                  )),
              const Spacer(),
              Container(
                height: 50,
                child: const Image(
                  image: AssetImage('assets/LOGO.png'),
                ),
              ),
            ],
          ),
        ),
        body: widget.child,
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 8),
                    child: GNav(
                      rippleColor: Colors.grey[300]!,
                      hoverColor: Colors.grey[100]!,
                      gap: 8,
                      activeColor: Colors.white,
                      iconSize: 24,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      duration: const Duration(milliseconds: 400),
                      tabBackgroundColor: Colors.orange,
                      tabBorderRadius: 15,
                      color: Colors.black,
                      tabs: [
                        GButton(
                          icon: LineAwesomeIcons.home,
                          text: 'shop',
                          onPressed: () => context.go('/home'),
                        ),
                        GButton(
                          icon: LineAwesomeIcons.shopping_bag,
                          text: 'cart',
                          onPressed: () => context.go('/cart'),
                        ),
                      ],
                      selectedIndex: _selectedIndex,
                      onTabChange: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    )),
              ],
            ))));
  }
}
