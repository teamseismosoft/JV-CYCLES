import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../services/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';
  User? user = Auth().currentUser;

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (error) {
      setState(() {
        _errorMessage = error.message!;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      Map<String, dynamic> userData = {
        'email': user?.email,
        'cart': [],
      };

      if (user != null) {
        FirebaseFirestore.instance.collection('users').doc(user?.uid);
      }
    } on FirebaseAuthException catch (error) {
      setState(() {
        _errorMessage = error.message!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                repeat: ImageRepeat.noRepeat,
                image: Svg('assets/background.svg'),
                fit: BoxFit.fill),
          ),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/LOGO.png'),
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
                    padding:
                        const EdgeInsets.only(top: 35, left: 45, right: 45),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: const Color.fromARGB(127, 238, 238, 238),
                        filled: true,
                        hintText: "Email",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 73, 73, 73)),
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
                      onSaved: (String? value) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 45, right: 45),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: const Color.fromARGB(127, 238, 238, 238),
                        filled: true,
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 73, 73, 73)),
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
                    onTap: signInWithEmailAndPassword,
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
                          "Don't have any account ? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            print('Sign Up..');
                          },
                          child: const Text(
                            "Sign Up!",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
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
                            color: const Color.fromARGB(121, 255, 255, 255),
                          ),
                        ),
                        const Spacer(),
                        const Text('OR',
                            style: TextStyle(
                                color: Color.fromARGB(121, 255, 255, 255))),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 60,
                            height: 2,
                            color: const Color.fromARGB(121, 255, 255, 255),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/G logo.png'),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                          const SizedBox(width: 14),
                          const Text(
                            'Sign In with Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
