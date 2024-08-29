import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/app-bg.png'),
            fit: BoxFit.cover, // This makes sure the image covers the entire background
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, right: 25, left: 35),
                child: Image.asset('assets/images/notifier-logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.3), // Set color inside decoration
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: 
                  Column(
                    children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Welcome To Notifier App',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Enter Registration Number',
                      style: TextStyle(
                        color: Color(0xFFF3B413),
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 10),
                              prefixIcon: const Icon(Icons.phone_android),
                              hintText: 'Mobile Number',
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.white)
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Visibility(
                      visible: true,
                        child: Text(
                          'Enter OTP code in 60 seconds',
                          style: TextStyle(
                            color: Color(0xFFF3B413),
                          ),
                    )
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/homepage');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 33,
                        width: 101,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Get OTP',
                              style: TextStyle(
                                color: Color(0xFF4C3776),
                              ),
                            )
                          ],
                        )
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
    );
  }



}