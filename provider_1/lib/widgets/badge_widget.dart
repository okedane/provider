import 'package:flutter/material.dart';

class Badge_Widget extends StatelessWidget {
  const Badge_Widget({
    super.key,
    required this.child,
    required this.value,
    required this.color,
  });

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Badge diklik");
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          child, // IconButton seharusnya tetap bisa diklik
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
