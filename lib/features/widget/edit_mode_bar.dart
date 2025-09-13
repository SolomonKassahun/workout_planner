import 'package:flutter/material.dart';

import '../../core/constant/colors.dart';

class EditModeBar extends StatelessWidget {
  final VoidCallback onDiscard;
  final VoidCallback onSave;
  final bool changesMade;

  const EditModeBar({
    super.key,
    required this.onDiscard,
    required this.onSave,
    required this.changesMade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onDiscard,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, foregroundColor: Colors.black),
              child: const Text("Discard"),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton(
              onPressed: changesMade ? onSave : null,
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.yellow, foregroundColor: Colors.black),
              child: const Text("Save Changes"),
            ),
          ),
        ],
      ),
    );
  }
}
