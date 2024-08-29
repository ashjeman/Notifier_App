import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notifier_app/components/login_button_component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const String correctOtp = "555555";
  int secondsLeft = 60;
  bool otpRequested = false;
  bool otpError = false;

  final TextEditingController userInputController = TextEditingController();
  Timer? countdownTimer;

  @override
  void dispose() {
    // Dispose of the controller and timer when the widget is removed from the widget tree
    userInputController.dispose();
    countdownTimer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft > 0) {
        setState(() {
          secondsLeft--;
        });
      } else {
        timer.cancel();
        setState(() {
          otpError = true;
          otpRequested = false;
        });
      }
    });
  }

  void handleOtpRequest() {
    setState(() {
      otpRequested = true;
      otpError = false;
      secondsLeft = 60;
    });
    startCountdown();
  }

  void handleOtpVerification() {
    if (userInputController.text == correctOtp) {
      countdownTimer?.cancel();
      setState(() {
        otpError = false;
        otpRequested = false;
      });
      Navigator.pushNamed(context, '/homepage');
    } else {
      setState(() {
        otpError = true;
      });
    }
  }

  Widget otpCountdownText() {
    return Visibility(
      visible: otpRequested,
      child: Text(
        'Enter OTP code in $secondsLeft seconds',
        style: const TextStyle(
          color: Color(0xFFF3B413),
        ),
      ),
    );
  }

  Widget otpErrorText() {
    return Visibility(
      visible: otpError,
      child: const Text(
        'Wrong OTP code. Please try again.',
        style: TextStyle(
          color: Color(0xFFF3B413),
        ),
      ),
    );
  }

  Widget otpActionButton() {
    return otpRequested
        ? GestureDetector(
      onTap: handleOtpVerification,
      child: LoginButtonComponent(buttonText: 'Verify'),
    )
        : GestureDetector(
      onTap: handleOtpRequest,
      child: LoginButtonComponent(buttonText: 'Get OTP'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/app-bg.png'),
            fit: BoxFit.cover,
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
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Welcome To Notifier App',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Enter Registration Number',
                        style: TextStyle(
                          color: Color(0xFFF3B413),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: TextField(
                          controller: userInputController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 10),
                            prefixIcon: const Icon(Icons.phone_android),
                            hintText: 'Mobile Number',
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      otpCountdownText(),
                      const SizedBox(height: 10),
                      otpErrorText(),
                      const SizedBox(height: 20),
                      otpActionButton(),
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
