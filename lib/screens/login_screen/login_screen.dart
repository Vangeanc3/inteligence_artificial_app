import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 650,
          width: 375,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Nome",
                    hintStyle: TextStyle(color: Colors.white54),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Nome",
                    hintStyle: TextStyle(color: Colors.white54),
                    filled: true,
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
