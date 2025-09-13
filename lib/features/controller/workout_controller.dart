import '../../../data/models/exercise.dart';
import '../../../data/models/workout.dart';
import '../../../data/sample_data.dart';

class WorkoutController {
  late WorkoutModel workout;
  List<ExerciseModel> currentExcercise = [];
  List<ExerciseModel> backupExcercise = [];
  int selectedIndex = 0;
  bool isEditing = false;
  bool changesMade = false;

  WorkoutController() {
    workout = getSampleWorkout();
    currentExcercise = workout.exercises.map((e) => e.copy()).toList();
    backupExcercise = workout.exercises.map((e) => e.copy()).toList();
  }

  void enterEditMode() {
    isEditing = true;
    backupExcercise = currentExcercise.map((e) => e.copy()).toList();
    changesMade = false;
  }

  void exitEditMode({bool save = false}) {
    if (!save) {
      currentExcercise = backupExcercise.map((e) => e.copy()).toList();
    }
    isEditing = false;
    changesMade = false;
    if (selectedIndex >= currentExcercise.length) {
      selectedIndex = currentExcercise.length - 1;
    }
  }

  void reorder(int oldIndex, int newIndex) {
    final item = currentExcercise.removeAt(oldIndex);
    currentExcercise.insert(newIndex, item);
    changesMade = true;
  }

  void deleteAt(int index) {
    currentExcercise.removeAt(index);
    changesMade = true;
    if (selectedIndex >= currentExcercise.length) {
      selectedIndex = currentExcercise.length - 1;
    }
  }

  void toggleCompleted(int idx) {
    currentExcercise[idx].completed = !currentExcercise[idx].completed;
  }
  void addExercise(ExerciseModel exercise) {
  currentExcercise.add(exercise);
  changesMade = true;
}

}
