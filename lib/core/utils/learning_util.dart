import '../../features/main/my_learning/domain/entities/enrollment_lesson.dart';

class LearningUtil {
  static String calculateTotalProgress(List<EnrollmentLesson> learningLessons) {
    var progress = 0;
    for (var value in learningLessons) {
      if (value.isCompleted) {
        progress++;
      }
    }
    var result = (progress * 100 / learningLessons.length);
    return result.isNaN ? '-' : result.toStringAsFixed(0);
  }

  static String calculateTotalScores(List<int> scores) {
    var score = 0;
    for (var value in scores) {
      score += value;
    }
    var result = (score * 100 / scores.length);
    return result.isNaN ? '-' : result.toStringAsFixed(0);
  }
}
