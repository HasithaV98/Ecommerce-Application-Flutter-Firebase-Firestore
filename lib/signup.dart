import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:suppliment_ordering_application/widget/my_text_field.dart';

class SignupPage extends StatefulWidget {
  static Pattern pattern =
      (r"/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/");
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool loading = false;
  late UserCredential userCredential;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future senData() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);
      await FirebaseFirestore.instance.collection('userData').doc().set({
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim(),
        'email': email.text.trim(),
        'password': password.text.trim(),
        'confirmPassword': confirmPassword.text.trim(),
        'userId': userCredential.user?.uid,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        globalKey.currentState
            ?.showBottomSheet((context) => const Text('The password is weak!'));
      } else if (e.code == 'email-already-in-use') {
        globalKey.currentState
            ?.showBottomSheet((context) => const Text('Account alredy use!'));
      }
    } catch (e) {
      globalKey.currentState?.showBottomSheet((content) => Text(e));
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

  void validation() {
    final emailRegex = RegExp(
        r"/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/");
    if (firstName.text.trim().isEmpty) {
      globalKey.currentState!
          .showBottomSheet((context) => const Text('Enter First name'));
    }
    if (lastName.text.trim().isEmpty) {
      globalKey.currentState!
          .showBottomSheet((context) => const Text('Enter Last name'));
    }
    if (email.text.trim().isEmpty) {
      globalKey.currentState!
          .showBottomSheet((context) => const Text('Enter Email'));
    } else if (!emailRegex.hasMatch(email.text)) {
      globalKey.currentState!
          .showBottomSheet((context) => const Text('Enter Valid Email'));
    }
    if (password.text.trim().isEmpty) {
      globalKey.currentState!
          .showBottomSheet((context) => const Text('Enter Password'));
    } else {
      senData();
    }
    if (confirmPassword.text.trim().isEmpty) {
      globalKey.currentState!
          .showBottomSheet((context) => const Text('Confirm Password'));
    } else {
      setState(() {
        loading = true;
      });
      senData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  MyTextField(
                    controller: firstName,
                    hintText: 'First Name',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                    controller: lastName,
                    hintText: 'Last Name',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                    controller: email,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                    controller: password,
                    hintText: 'Password',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                    controller: confirmPassword,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
              loading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            width: 150,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.lightGreen),
                            ),
                            child: RawMaterialButton(
                              onPressed: () {},
                              child: const Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 150,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.redAccent),
                            ),
                            child: RawMaterialButton(
                              onPressed: () {
                                validation();
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
