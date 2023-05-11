import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TesteScreen extends StatelessWidget {
  const TesteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _modelScaffoldKey =
        GlobalKey<ScaffoldState>();
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                
                showModalBottomSheet(
                  
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 100,
                      child: Scaffold(
                        extendBody: false,
                        key: _modelScaffoldKey,
                        resizeToAvoidBottomInset: true,
                        body: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("data")));
                              },
                              child: Text("Abrir SnackBar")),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text("Abrir Modal"))),
    );
  }
}
