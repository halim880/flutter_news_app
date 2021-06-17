import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String error;
  const Error(this.error, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(error, style: const TextStyle(color: Colors.red),)
      ),
    );
  }
}