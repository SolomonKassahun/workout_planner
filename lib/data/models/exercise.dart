class ExerciseModel {
  String name;
  String assetUrl;
  String gifUrl;
  String equipment;
  bool completed;

  ExerciseModel({
    required this.name,
    required this.assetUrl,
    required this.gifUrl,
    required this.equipment,
    this.completed = false,
  });

  ExerciseModel copy() => ExerciseModel(
        name: name,
        assetUrl: assetUrl,
        gifUrl: gifUrl,
        equipment: equipment,
        completed: completed,
      );
}
