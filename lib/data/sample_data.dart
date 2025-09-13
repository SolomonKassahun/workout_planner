import 'models/exercise.dart';
import 'models/workout.dart';

WorkoutModel getSampleWorkout() {
  return WorkoutModel(workoutName: "Chris' Fullbody 1", exercises: [
    ExerciseModel(
      name: "Squat",
      assetUrl:
          "https://jyfpzydnxyelsxofxcnz.supabase.co/storage/v1/object/public/exercise_gifs/1080/143513.png",
      gifUrl:
          "https://jyfpzydnxyelsxofxcnz.supabase.co/storage/v1/object/public/exercise_gifs/1080/143513.gif",
      equipment: "barbell",
    ),
    ExerciseModel(
      name: "Inclined Bench Press",
      assetUrl:
          "https://jyfpzydnxyelsxofxcnz.supabase.co/storage/v1/object/public/exercise_gifs/1080/031413.png",
      gifUrl:
          "https://jyfpzydnxyelsxofxcnz.supabase.co/storage/v1/object/public/exercise_gifs/1080/031413.gif",
      equipment: "barbell",
    ),
    ExerciseModel(
      name: "Pull Ups",
      assetUrl:
          "https://jyfpzydnxyelsxofxcnz.supabase.co/storage/v1/object/public/exercise_gifs/1080/142913.png",
      gifUrl:
          "https://jyfpzydnxyelsxofxcnz.supabase.co/storage/v1/object/public/exercise_gifs/1080/142913.gif",
      equipment: "bodyweight",
    ),
    ExerciseModel(
      name: "Shoulder Press",
      assetUrl:
          "https://jyfpzydnxyelsxofxcnz.supabase.co/storage/v1/object/public/exercise_gifs/1080/040513.png",
      gifUrl:
          "https://jyfpzydnxyelsxofxcnz.supabase.co/storage/v1/object/public/exercise_gifs/1080/040513.gif",
      equipment: "dumbbell",
    ),
    ExerciseModel(
      name: "Curl Biceps",
      assetUrl:
          "https://jyfpzydnxyelsxofxcnz.supabase.co/storage/v1/object/public/exercise_gifs/1080/016513.png",
      gifUrl:
          "https://jyfpzydnxyelsxofxcnz.supabase.co/storage/v1/object/public/exercise_gifs/1080/016513.gif",
      equipment: "cable",
    ),
    ExerciseModel(
      name: "Extension Triceps",
      assetUrl:
          "https://jyfpzydnxyelsxofxcnz.supabase.co/storage/v1/object/public/exercise_gifs/1080/020013.png",
      gifUrl:
          "https://jyfpzydnxyelsxofxcnz.supabase.co/storage/v1/object/public/exercise_gifs/1080/020013.gif",
      equipment: "cable",
    ),
  ]);
}
