import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../data/models/exercise.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/styles.dart';

class ExerciseDetails extends StatelessWidget {
  final ExerciseModel exercise;
  final VoidCallback onToggleCompleted;

  const ExerciseDetails({
    super.key,
    required this.exercise,
    required this.onToggleCompleted,
  });

  Widget _equipmentTag(String equipment) {
    IconData icon;
    switch (equipment.toLowerCase()) {
      case 'barbell':
        icon = Icons.fitness_center;
        break;
      case 'dumbbell':
        icon = Icons.sports_handball;
        break;
      case 'cable':
        icon = Icons.settings_input_component;
        break;
      case 'bodyweight':
        icon = Icons.self_improvement;
        break;
      default:
        icon = Icons.help_outline;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      // width: 102,
      // height: 32,
      margin: EdgeInsets.only(left: 14),
      decoration: BoxDecoration(
        color: Color(0xffF3F2F7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.black54),
          const SizedBox(width: 4),
          Text(
            equipment,
            style: const TextStyle(fontSize: 13, color: Colors.black87,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.black, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: Colors.black87),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 14, 
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
     
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(exercise.name, style: AppTextStyles.heading,),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.swap_horiz,size: 18, color: Colors.black),
                label: const Text(
                  "Replace",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: exercise.gifUrl,
                  fit: BoxFit.contain,
                  height: 200,
                  width: double.infinity,
                  placeholder: (context, url) =>  Center(
                    child: SpinKitCircle(
                        color: AppColors.yellow,
                        size: 50.0,
                      ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _equipmentTag(exercise.equipment),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(child: _actionButton(Icons.menu_book_outlined, "Instructions")),
              const SizedBox(width: 8),
              Expanded(child: _actionButton(Icons.directions_walk, "Warm Up")),
              const SizedBox(width: 8),
              Expanded(child: _actionButton(Icons.help_outline, "FAQ")),
            ],
          ),
        ],
      ),
    );
  }
}
