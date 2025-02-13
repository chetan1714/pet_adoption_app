import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ConfettiPopup extends StatelessWidget {
  final String petName;

  const ConfettiPopup({super.key, required this.petName});

  @override
  Widget build(BuildContext context) {
    final confettiController = ConfettiController(duration: const Duration(seconds: 2));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      confettiController.play();
    });

    return AlertDialog(
      title: const Text('Congratulations!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('You’ve now adopted $petName! 🎉'),
          const SizedBox(height: 10),
          ConfettiWidget(
            confettiController: confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            colors: const [Colors.blue, Colors.green, Colors.pink, Colors.orange],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            confettiController.stop();
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
