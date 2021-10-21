import 'package:flutter/material.dart';

class NotificationIT extends StatelessWidget {
  const NotificationIT({Key? key}) : super(key: key);

     @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
      child: Center(
        child: Text('Notification'),
      ),
      ),
    );
  }
}