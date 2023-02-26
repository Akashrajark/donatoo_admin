import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      style: Theme.of(context).textTheme.bodyLarge,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Username',
                        hintStyle: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Material(
                    color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Login'),
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
