import 'package:Flutter_Riverpod/provider_demo/provider_demo.dart';
import 'package:Flutter_Riverpod/state_provider_demo/state_provider_demo.dart';
import 'package:Flutter_Riverpod/stream_provider/StreamProviderDemo.dart';
import 'package:flutter/material.dart';

import 'consumer_stateful_tutorial/StatefulConsumerTutorial.dart';
import 'future_provider/FutureProviderDemo.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardList = [
      'Provider\nBasics',
      'State\nProvider',
      'Stateful\nConsumer\nTutorial',
      'Future\nProvider',
      'Stream\nProvider',
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Riverpod App")),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          children: List.generate(dashboardList.length, (index) {
            return Padding(
              padding: EdgeInsets.all(2.5),
              child: InkWell(
                onTap: () {
                  late var destination;
                  switch (index) {
                    case 0:
                      destination = ProviderDemo();
                    case 1:
                      destination = StateProviderDemo();
                    case 2:
                      destination = StatefulConsumerTutorial();
                    case 3:
                      destination = FutureProviderDemo();
                    case 4:
                      destination = StreamProviderDemo();
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => destination),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.deepPurple,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        dashboardList[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}