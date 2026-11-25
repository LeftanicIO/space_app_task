abstract final class AppLayout {
  static const double tabletBreakpoint = 600;
  static const double maxContentWidth = 720;
  static const double maxMediaSize = 520;

  static bool isTablet(double width) => width >= tabletBreakpoint;

  static double pagePadding(double width) => isTablet(width) ? 32 : 18;

  static double mediaPadding(double width) => isTablet(width) ? 32 : 16;
}
