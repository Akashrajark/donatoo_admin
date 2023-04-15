import 'package:demo/ui/screen/home_screen.dart';
import 'package:demo/ui/widgets/custom_action_button.dart';
import 'package:demo/ui/widgets/custom_button.dart';
import 'package:demo/util/value_validators.dart';
import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../blocs/auth/sign_in/sign_in_bloc.dart';
import '../widgets/custom_alert_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (Supabase.instance.client.auth.currentUser != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/img.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              BlocProvider<SignInBloc>(
                create: (context) => SignInBloc(),
                child: BlocConsumer<SignInBloc, SignInState>(
                  listener: (context, state) {
                    if (state is SignInFailureState) {
                      showDialog(
                        context: context,
                        builder: (context) => const CustomAlertDialog(
                          title: 'Failed',
                          message:
                              'Please check your email and password and try again.',
                          primaryButtonLabel: 'Ok',
                        ),
                      );
                    } else if (state is SignInSuccessState) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: SizedBox(
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                textStyle:
                                    Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _emailController,
                              validator: validateEmail,
                              decoration: InputDecoration(
                                fillColor: Colors.white.withOpacity(0.75),
                                hintText: 'Email',
                                prefixIcon: const Icon(
                                  Icons.email_rounded,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _isObscure,
                              validator: (value) {},
                              decoration: InputDecoration(
                                hintText: 'Password',
                                fillColor: Colors.white.withOpacity(0.75),
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _isObscure = !_isObscure;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomButton(
                              text: 'Login',
                              isLoading: state is SignInLoadingState,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<SignInBloc>(context).add(
                                    SignInEvent(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
