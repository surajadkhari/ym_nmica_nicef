import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicef/application/auth/signin_form/signin_form_bloc.dart';
import 'package:unicef/presentation/auth/registration/registration_screen.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninFormBloc, SigninFormState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue, fontSize: 24.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      // ignore: deprecated_member_use
                      autovalidate: state.showErrorMessagec,
                      child: Column(
                        children: [
                          const SizedBox(height: 1.0),
                          TextFormField(
                            controller: emailTextEditingController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle:
                                  TextStyle(fontSize: 14.0, fontFamily: ""),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 10.0),
                            ),
                            style: const TextStyle(fontSize: 14.0),
                            autocorrect: false,
                            onChanged: (value) => context
                                .read<SigninFormBloc>()
                                .add(SigninFormEvent.emailChanged(value)),
                            validator: (_) => context
                                .read<SigninFormBloc>()
                                .state
                                .emailAddress
                                .value
                                .fold(
                                  (f) => f.maybeMap(
                                    invalidEmail: (_) => 'Invalid Email',
                                    orElse: () => null,
                                  ),
                                  (_) => null,
                                ),
                          ),
                          const SizedBox(height: 1.0),
                          TextFormField(
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
                            autocorrect: false,
                            onChanged: (value) => context
                                .read<SigninFormBloc>()
                                .add(SigninFormEvent.passwordChanged(value)),
                            validator: (_) => context
                                .read<SigninFormBloc>()
                                .state
                                .password
                                .value
                                .fold(
                                  (f) => f.maybeMap(
                                    shortPassword: (_) =>
                                        'Password must at least 6 characters long!',
                                    orElse: () => null,
                                  ),
                                  (_) => null,
                                ),
                          ),
                          const SizedBox(
                            height: 1.0,
                          ),
                          ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.blue),
                            onPressed: () {
                              context.read<SigninFormBloc>().add(
                                    const SigninFormEvent
                                        .signInWithEmailAndPasswordPressed(),
                                  );
                            },
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
                                icon:
                                    const Icon(Icons.email, color: Colors.blue),
                                onPressed: () {
                                  context.read<SigninFormBloc>().add(
                                        const SigninFormEvent
                                            .signInWithGooglePressed(),
                                      );
                                },
                              ),
                              // IconButton(
                              //   onPressed: () {
                              //     context.read<SigninFormBloc>().add(
                              //           const SigninFormEvent
                              //               .signInWithFacebookPressed(),
                              //         );
                              //   },
                              //   icon: const Icon(
                              //     Icons.facebook,
                              //     color: Colors.blue,
                              //   ),
                              // )
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
                          builder: (context) => const RegistrationScreen(),
                        ),
                      );
                    },
                    child: const Text("Do not have account? Sign up"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
