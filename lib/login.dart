import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:suppliment_ordering_application/widget/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  late UserCredential userCredential;
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future loginAuthenication() async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        globalKey.currentState?.showBottomSheet(
            (context) => const Text('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        globalKey.currentState?.showBottomSheet(
          (context) => const Text('Wrong password provided for that user.'),
        );
        setState(() {
          loading = false;
        });
      }
      setState(() {
        loading = false;
      });
    }
  }

  void validation() {
    final emailRegex = RegExp(
        r"/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/");
    if (email.text.trim().isEmpty && password.text.trim().isEmpty) {
      globalKey.currentState?.showBottomSheet(
          (context) => const Text('Please enter email and password'));
    }
    if (email.text.trim().isEmpty) {
      globalKey.currentState
          ?.showBottomSheet((context) => const Text('Email is empty'));
    } else if (!emailRegex.hasMatch(email.text)) {
      globalKey.currentState!
          .showBottomSheet((context) => const Text('Enter Valid Email'));
    }

    if (password.text.trim().isEmpty) {
      globalKey.currentState
          ?.showBottomSheet((context) => const Text('Password is empty'));
    } else {
      setState(() {
        loading = true;
      });
      loginAuthenication();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  MyTextField(
                    obscureText: false,
                    hintText: 'Email',
                    controller: email,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                    obscureText: true,
                    hintText: 'Password',
                    controller: password,
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: loading
                    ? const CircularProgressIndicator()
                    : Container(
                        width: 200,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.lightGreen),
                        ),
                        child: RawMaterialButton(
                          onPressed: () {
                            validation();
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text('New user?', style: TextStyle(color: Colors.black)),
                  Text(
                    'Register now',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
