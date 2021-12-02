import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:unicef/main.dart';
import 'package:unicef/presentation/auth/login/login_screen.dart';
import 'package:unicef/unicef/screens/information_screen.dart';
import 'package:unicef/unicef/screens/introduction_screen.dart';
import 'package:unicef/unicef/services/infomation_service.dart';
import 'package:unicef/unicef/widgets/Progress.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController genderTextEditingController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  InfomationService _informationService = InfomationService();
  getTerms() async {
    var data = await _informationService.getTerms();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InfomationScreen(
          title: "Terms And Conditions",
          information: data,
        ),
      ),
    );
  }

  getPolicy() async {
    var data = await _informationService.getPolicy();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InfomationScreen(
          title: "Policies",
          information: data,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 35.0),
              const Image(
                image: AssetImage('assets/images/mic_logo.png'),
                width: 200.0,
                height: 250.0,
                // ignore: avoid_redundant_argument_values
                alignment: Alignment.center,
              ),
              const SizedBox(height: 1.0),
              const Text(
                "Register",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 24.0),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 1.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Full Name Cannot be empty!';
                          }
                          return null;
                        },
                        controller: nameTextEditingController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: "Full Name",
                          labelStyle: TextStyle(fontSize: 14.0, fontFamily: ""),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10.0),
                        ),
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(height: 1.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email Cannot be empty!';
                          }
                          if (!value.contains('@')) {
                            return 'Enter Valid Email Address!';
                          }

                          return null;
                        },
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(fontSize: 14.0, fontFamily: ""),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10.0),
                        ),
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      TextFormField(
                        validator: (value) {
                          String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          RegExp regExp = new RegExp(patttern);
                          if (value!.isEmpty == 0) {
                            return 'Please enter mobile number';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Please enter valid mobile number';
                          }
                          return null;
                        },
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Phone",
                          labelStyle: TextStyle(fontSize: 14.0, fontFamily: ""),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10.0),
                        ),
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(height: 1.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password Cannot be empty!';
                          }
                          if (value.length <= 6) {
                            return 'Password must be atleast 6 characters long!';
                          }

                          return null;
                        },
                        controller: passwordTextEditingController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10.0),
                        ),
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(
                        height: 1.0,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                                registerUser(context);
                              }
                            },
                            child: const Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 18.0, fontFamily: "Brand-Bold"),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text.rich(
                                TextSpan(
                                  text: 'By continuing, you agree to our ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Terms of Service',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            getTerms();
                                          }),
                                    TextSpan(
                                      text: ' and ',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Privacy Policy.',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                                decoration:
                                                    TextDecoration.underline),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                getPolicy();
                                              })
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 1.0),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text("Already have an account? Login in"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  void registerUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Progress(
            message: "Signing up!..",
          );
        });
    try {
      final User? firebaseUser = (await auth.createUserWithEmailAndPassword(
              email: emailTextEditingController.text,
              password: passwordTextEditingController.text))
          .user;
      if (firebaseUser != null) {
        userRefs.child(firebaseUser.uid);
        Map userMap = {
          "name": nameTextEditingController.text.trim(),
          "email": emailTextEditingController.text.trim(),
          "phone": phoneTextEditingController.text.trim(),
        };
        userRefs.child(firebaseUser.uid).set(userMap);
        // Navigator.pushNamedAndRemoveUntil(
        //     context, HomeScreen.screenId, (route) => false);
        InfomationService _informationService = InfomationService();

        var data = await _informationService.getDescriptions();

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => IntroductionScreen(),
          ),
        );

        displayMessage("Your account has been created!", context);
      } else {
        Navigator.pop(context);
        displayMessage("New user cannot be created!", context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  displayMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
