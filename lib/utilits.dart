import 'package:flutter/material.dart';

class Lists extends StatelessWidget {
  const Lists({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Tasks", style: TextStyle(fontSize: 20)),
        subtitle: Text("Start Time"),
        leading: Text("Duration"),
      ),
    );
  }
}
