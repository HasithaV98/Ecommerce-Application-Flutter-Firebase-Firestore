import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Expanded(
                child: Container(
              child: Center(
                child: Image.asset('assets/logo.jpg'),
              ),
            )),
          ),
          Expanded(
              child: Column(
            children: [
              const Text(
                'Welcome to Supplement Lab',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              const Column(
                children: [
                  Text(
                    'Build Your Body With Supplement Lab',
                    style: TextStyle(fontSize: 10.0, color: Colors.black),
                  ),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.lightGreen),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.lightGreen),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {},
                      child: const Text(
                        'Signup',
                        style: TextStyle(color: Colors.lightGreen),
                      ),
                    ),
                  ),
                )
              ])
            ],
          ))
        ],
      ),
    );
  }
}
