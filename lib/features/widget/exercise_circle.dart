import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:workout_planner/features/controller/workout_controller.dart';
import '../../../../data/models/exercise.dart';
import '../../core/constant/colors.dart';
import 'dart:math' as math;

class ExerciseCircle extends StatelessWidget {
  final ExerciseModel exercise;
  final bool isSelected;
  final bool isEditing;
  final VoidCallback onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onLongPress;

  const ExerciseCircle({
    super.key,
    required this.exercise,
    required this.isSelected,
    required this.isEditing,
    required this.onTap,
    this.onDelete,
    this.onLongPress,
  });

  
  @override
  Widget build(BuildContext context) {
    const double circleSize = 72;
    const double iconSize = 19.5;
    const double deleteButtonRadius = 14;

    final double radius = circleSize / 2;
    final double iconOffset = radius * math.sqrt1_2 - iconSize / 2;

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: SizedBox(
        width: circleSize + deleteButtonRadius,
        height: circleSize + deleteButtonRadius,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: deleteButtonRadius / 2,
              top: deleteButtonRadius / 2,
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isEditing
                        ? Colors.transparent
                        : (isSelected
                            ? AppColors.yellow 
                            : Colors.grey), 
                    width: isSelected ? 3 : .1,
                  ),
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: isSelected && !isEditing
                        ? exercise.gifUrl
                        : exercise.assetUrl,
                    placeholder: (context, url) => Center(
                      child: SpinKitCircle(color: AppColors.yellow, size: 50.0),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            if (isSelected && !isEditing && !exercise.completed)
              Positioned(
                left: deleteButtonRadius / 2 + radius + iconOffset,
                top: deleteButtonRadius / 2 + radius + iconOffset,
                child: SizedBox(
                  width: iconSize,
                  height: iconSize,
                  child: CircleAvatar(
                    radius: iconSize / 2,
                    backgroundColor: AppColors.yellow,
                    child: const Icon(Icons.play_arrow,
                        color: Colors.black, size: 14),
                  ),
                ),
              ),

            if (exercise.completed)
              Positioned(
                left: deleteButtonRadius / 2 + radius + iconOffset,
                top: deleteButtonRadius / 2 + radius + iconOffset,
                child: SizedBox(
                  width: iconSize,
                  height: iconSize,
                  child: CircleAvatar(
                    radius: iconSize / 2,
                    backgroundColor: AppColors.yellow,
                    child:
                        const Icon(Icons.check, color: Colors.black, size: 14),
                  ),
                ),
              ),

            if (isEditing)
              Positioned(
                right: 0,
                top: 0,
                child: GestureDetector(
                  onTap: onDelete,
                  child: CircleAvatar(
                    radius: deleteButtonRadius,
                    backgroundColor: AppColors.red,
                    child: const Icon(Icons.remove,
                        color: Colors.white, size: 18),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
