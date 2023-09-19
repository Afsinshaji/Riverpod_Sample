import 'package:flutter/material.dart';
import 'package:riverpod_sample/presentation/screen_counter_page.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: SafeArea(child: Center(
       child: TextButton(child: const Text('Go to the counter'),onPressed: () => Navigator.push(context, 
        MaterialPageRoute(builder: (context) => const CounterPageScreen(),)

        
        ,),)
      )),
    );
  }
}