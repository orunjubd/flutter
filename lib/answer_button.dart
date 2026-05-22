import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return Colors.grey.shade300;
          }
          if (states.contains(WidgetState.hovered)) {
            return Colors.grey.shade200;
          }
          return Colors.white;
        }),
        foregroundColor: WidgetStateProperty.all(Colors.black),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) return Colors.black12;
          return null;
        }),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
        minimumSize: WidgetStateProperty.all(const Size(200, 48)),
        elevation: WidgetStateProperty.all(0),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
