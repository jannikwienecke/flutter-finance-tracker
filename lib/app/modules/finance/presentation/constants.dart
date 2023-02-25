class CBConfig {
  /// the height of the scroll movement
  static int height = 150;

  /// if below this threshold, the commandbar will be hidden again
  static int scrollThreshold = 100;

  /// the duration of the animation
  static Duration animationDuration = const Duration(milliseconds: 300);

  /// if this threshold is reached, the commandbar will be shown
  static int showCommandbarThreshold = 50;
}
