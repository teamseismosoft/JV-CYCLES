import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jv_cycles/pages/homePage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
    required this.pageKey,
  });
  int pageKey;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  User? user = Auth().currentUser;

  String _errorMessage = '';

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "* Email can not be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "* Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = '';
      });
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
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
        email: emailController.text,
        password: passwordController.text,
      );

      Map<String, dynamic> userData = {
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'verified': false,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .set(userData);

      Fluttertoast.showToast(
        msg: 'Verification link sent',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black,
        fontSize: 16.0,
      );
    } on FirebaseAuthException catch (error) {
      setState(() {
        _errorMessage = error.message!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: const SizedBox(
                        height: 23,
                        width: 23,
                        child: Icon(
                          Icons.close,
                          color: Colors.orange,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => setState(() {
                              widget.pageKey = 1;
                            }),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: widget.pageKey == 1
                                    ? Colors.orange
                                    : Colors.white,
                                fontSize: 21,
                                fontWeight: widget.pageKey == 1
                                    ? FontWeight.w800
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          '|',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => setState(() {
                              widget.pageKey = 2;
                            }),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: widget.pageKey == 2
                                    ? Colors.orange
                                    : Colors.white,
                                fontSize: 21,
                                fontWeight: widget.pageKey == 2
                                    ? FontWeight.w800
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              if (widget.pageKey == 1)
                Column(
                  children: [
                    const SizedBox(
                      height: 200,
                      width: 200,
                      child: Image(
                        image: AssetImage('assets/LOGO.png'),
                      ),
                    ),
                    const Text(
                      'Welcome to JV Cycles',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          onChanged: (value) {
                            validateEmail(value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 44, 49, 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            hintText: 'example@gmail.com',
                            hintStyle: const TextStyle(color: Colors.grey),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          obscureText: true,
                          controller: passwordController,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                _errorMessage = "* Password can not be empty";
                              });
                            } else {
                              setState(() {
                                _errorMessage = "";
                              });
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 44, 49, 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            hintText: 'password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _errorMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    InkWell(
                      onTap: signInWithEmailAndPassword,
                      child: Container(
                        width: 180,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else if (widget.pageKey == 2)
                Column(
                  children: [
                    const SizedBox(
                      height: 180,
                      width: 180,
                      child: Image(
                        image: AssetImage('assets/LOGO.png'),
                      ),
                    ),
                    const Text(
                      'Welcome to JV Cycles',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 44, 49, 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            hintText: 'Full Name',
                            labelText: 'Full Name',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          onChanged: (value) {
                            validateEmail(value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 44, 49, 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            hintText: 'example@gmail.com',
                            hintStyle: const TextStyle(color: Colors.grey),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 44, 49, 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            hintText: 'Phone Number',
                            labelText: 'Phone Number',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 44, 49, 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            hintText: 'Password',
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                        onTap: createUserWithEmailAndPassword,
                        child: Container(
                          width: 180,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
