import 'package:flutter/material.dart';

class CustomBottomModalSheet extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final bool showIcon;
  final double? height;
  final Widget content;

  const CustomBottomModalSheet({
    Key? key,
    required this.title,
    required this.onBack,
    this.showIcon = true,
    required this.content,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: height ?? 500.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              if (showIcon)
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: onBack,
                ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          content, // Sử dụng tham số mới để hiển thị nội dung
        ],
      ),
    );
  }
}
