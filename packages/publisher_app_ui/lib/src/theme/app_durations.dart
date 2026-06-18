abstract final class AppDurations {
  static const Duration instant = Duration.zero;
  static const fast = Duration(milliseconds: 150);
  static const normal = Duration(milliseconds: 250);
  static const slow = Duration(milliseconds: 350);
  static const slower = Duration(milliseconds: 500);
}
