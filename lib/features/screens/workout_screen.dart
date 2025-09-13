import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';
import '../../data/models/exercise.dart';
import '../controller/workout_controller.dart';
import '../widget/edit_mode_bar.dart';
import '../widget/exercise_circle.dart';
import '../widget/exercise_details.dart';
import '../widget/sets_panel.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final controller = WorkoutController();

  @override
  Widget build(BuildContext context) {
    final excerciseWidget = <Widget>[];
    void _showAddExerciseDialog(BuildContext context) {
    final nameController = TextEditingController();
    final assetUrlController = TextEditingController();
    final gifUrlController = TextEditingController();
    final equipmentController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add Exercise"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Exercise Name"),
              ),
              TextField(
                controller: assetUrlController,
                decoration: const InputDecoration(labelText: "Image URL"),
              ),
              TextField(
                controller: gifUrlController,
                decoration: const InputDecoration(labelText: "GIF URL"),
              ),
              TextField(
                controller: equipmentController,
                decoration: const InputDecoration(labelText: "Equipment"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  assetUrlController.text.isNotEmpty &&
                  gifUrlController.text.isNotEmpty &&
                  equipmentController.text.isNotEmpty) {
                final newExercise = ExerciseModel(
                  name: nameController.text,
                  assetUrl: assetUrlController.text,
                  gifUrl: gifUrlController.text,
                  equipment: equipmentController.text,
                );
                setState(() {
                  WorkoutController().addExercise (newExercise);
                });
                Navigator.pop(ctx);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

    for (int i = 0; i < controller.currentExcercise.length; i++) {
      final ex = controller.currentExcercise[i];
      excerciseWidget.add(
        ExerciseCircle(
          exercise: ex,
          isSelected: controller.selectedIndex == i,
          isEditing: controller.isEditing,
          onTap: () {
            if (!controller.isEditing) {
              setState(() => controller.selectedIndex = i);
            }
          },
          onLongPress:
              controller.isEditing
                  ? null
                  : () => setState(() => controller.enterEditMode()),
          onDelete: () => setState(() => controller.deleteAt(i)),
        ),
      );
    }

    if (!controller.isEditing) {
      excerciseWidget.add(
        GestureDetector(
          onTap: (){
              _showAddExerciseDialog(context);
          },
          // onTap: () => setState(() => controller.enterEditMode()),
          child: const CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white,
            child: Icon(Icons.add, color: Colors.black54),
          ),
        ),
      );
    } else {
      excerciseWidget.add(
        GestureDetector(
          onTap: () {
            _showAddExerciseDialog(context);
            // setState(() {
            //   controller.currentExcercise.add(
            //     controller.currentExcercise[0].copy(),
            //   );
            //   controller.changesMade = true;
            // });
          },
          child: const CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white,
            child: Icon(Icons.add, color: Colors.black54),
          ),
        ),
      );
    }

    final reorderableWidget = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ReorderableWrap(
        needsLongPressDraggable: false,
        onReorder:
            (oldIndex, newIndex) =>
                setState(() => controller.reorder(oldIndex, newIndex)),
        children: excerciseWidget,
      ),
    );

    final selected = controller.currentExcercise[controller.selectedIndex];

    return Scaffold(
      appBar:AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  leading: IconButton(
    icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
    onPressed: () => Navigator.of(context).pop(),
  ),
  title: Text(
    controller.workout.workoutName,
    style: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  ),
  // centerTitle: true,
  iconTheme: const IconThemeData(color: Colors.black),
  actions: [
    Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.only(left: 12, right: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.timer, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          const Text(
            "00:28:30",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ],
),
      body: Column(
        children: [
          SizedBox(height: 16),
          SizedBox(height: 104, child: reorderableWidget),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExerciseDetails(
                    exercise: selected,
                    onToggleCompleted:
                        () => setState(
                          () => controller.toggleCompleted(
                            controller.selectedIndex,
                          ),
                        ),
                  ),
                  const SizedBox(height: 20),
                  SetsPanel(
                    onToggleComplete:
                        () => setState(
                          () => controller.toggleCompleted(
                            controller.selectedIndex,
                          ),
                        ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet:
          controller.isEditing
              ? EditModeBar(
                onDiscard:
                    () => setState(() => controller.exitEditMode(save: false)),
                onSave:
                    () => setState(() => controller.exitEditMode(save: true)),
                changesMade: controller.changesMade,
              )
              : null,
    );
  }
}
