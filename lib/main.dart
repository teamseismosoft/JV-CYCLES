
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jv_cycles/pages/homePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:jv_cycles/pages/loginPage.dart';
import 'package:jv_cycles/pages/profile.dart';
import 'package:jv_cycles/pages/sideBar.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart' hide Stack;
import 'package:flutter_animate/flutter_animate.dart';
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

  routes:[
    GoRoute(path: '/',builder:(BuildContext context, GoRouterState state) =>const HomePage(),routes: [
  GoRoute( path:'login',builder:(BuildContext context, GoRouterState state) =>const Login()
  ),
  GoRoute( path:'home',builder:(BuildContext context, GoRouterState state) =>const HomePage()
  ),
  GoRoute( path:'/profile',builder:(BuildContext context, GoRouterState state) =>const profilePage()
  ),
      GoRoute( path:'/viewall',builder:(BuildContext context, GoRouterState state) => ViewAll()
      )

   ],), ],),],);


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
    return Scaffold(
        appBar:  AppBar(
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
                      builder: (context) => SearchProduct(),
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
        body:widget.child,
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                    child: GNav(
                      rippleColor: Colors.grey[300]!,
                      hoverColor: Colors.grey[100]!,
                      gap: 8,
                      activeColor: Colors.black,
                      iconSize: 24,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      duration: Duration(milliseconds: 400),
                      tabBackgroundColor: Colors.grey[100]!,
                      color: Colors.black,
                      tabs: [
                        GButton(
                          icon: LineAwesomeIcons.home,
                          text: 'Home',
                          onPressed:()=> context.go('/home')
                          ,
                        ),
                        GButton(
                          icon: LineAwesomeIcons.shopping_cart,
                          text: 'Likes',
                        ),
                        GButton(
                          icon: LineAwesomeIcons.list,
                          text: 'view all',
                          onPressed: ()=>context.go('/viewall'),
                        ),
                        GButton(
                          icon: LineAwesomeIcons.user,
                          text: 'Profile',
                          onPressed: ()=>context.go('/profile'),

                        ),
                      ],
                      selectedIndex: _selectedIndex,
                      onTabChange: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ))))
    );;
  }
}
