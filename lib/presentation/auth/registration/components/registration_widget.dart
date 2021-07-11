import 'package:flutter/material.dart';
import 'package:unicef/presentation/auth/login/login_screen.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController fullNameTextEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        onPressed: () async {},
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: "Brand-Bold"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 1.0),
                      const Text(
                        'or Login with',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 1.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.email, color: Colors.blue),
                            onPressed: () {},
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.facebook,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      )
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
}
