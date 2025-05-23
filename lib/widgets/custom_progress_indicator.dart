import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(
          value: progress,
          color: Colors.white,
          backgroundColor: Colors.lightBlue,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
