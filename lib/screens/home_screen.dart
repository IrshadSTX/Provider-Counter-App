import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_learning/counter_provider.dart';
import 'package:provider_learning/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('buildcontext rebuild');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      floatingActionButton:
          Consumer<CounterProvider>(builder: (context, value, child) {
        return FloatingActionButton(
          onPressed: () {
            value.addNum();
          },
          child: const Icon(Icons.add),
        );
      }),
      body: SizedBox(
        child: Consumer<CounterProvider>(builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.num.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenSecond()));
                  },
                  child: const Text('Click Me')),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(
                      '${index + 1}',
                      style: const TextStyle(fontSize: 20),
                    );
                  },
                  itemCount: value.num,
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
