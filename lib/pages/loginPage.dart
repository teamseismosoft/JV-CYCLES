import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _emailAdd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            repeat: ImageRepeat.repeat,
            image: Svg('assets/background (1).svg', size: Size(500, 500)),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Image.asset('assets/LOGO.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
                const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 45, right: 45),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fillColor: const Color.fromARGB(94, 238, 238, 238),
                      filled: true,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return '*Email Address is Required';
                      }

                      if (!RegExp(
                              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(value)) {
                        return 'Please enter a valid email Address';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _emailAdd = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 45, right: 45),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fillColor: const Color.fromARGB(94, 238, 238, 238),
                      filled: true,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Forgot Password :(');
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 20, right: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 154, 150, 150)),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Sign In..');
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 20, right: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Colors.yellow,
                        Colors.red,
                        Colors.pink,
                        Colors.purple,
                      ]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have any account ?  ",
                        style: TextStyle(color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          print('Sign Up..');
                        },
                        child: const Text(
                          "Sign Up!",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          width: (MediaQuery.of(context).size.width / 2) - 60,
                          height: 2,
                          color: Color.fromARGB(121, 255, 255, 255),
                        ),
                      ),
                      const Spacer(),
                      Text('OR',
                          style: TextStyle(
                              color: Color.fromARGB(121, 255, 255, 255))),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          width: (MediaQuery.of(context).size.width / 2) - 60,
                          height: 2,
                          color: Color.fromARGB(121, 255, 255, 255),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
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
