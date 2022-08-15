import 'package:flutter/material.dart';

copyright() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            height: 11,
            width: 11,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Center(
                child: Text(
              '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
            )),
          ),
          const Text(
            '',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        '',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    ],
  );
}
