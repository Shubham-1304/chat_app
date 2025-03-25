import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RetryMessage extends StatelessWidget {
  const RetryMessage(
      {required this.message, required this.retryFunction, super.key});

  final String message;
  final VoidCallback retryFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
            softWrap: true,
          ),
          SizedBox(height: 0.02.sh,),
          ElevatedButton(
            onPressed: retryFunction,
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green.shade400)),
            child: const Text(
              "Retry",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
