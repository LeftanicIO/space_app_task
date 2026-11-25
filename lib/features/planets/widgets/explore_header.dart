import 'package:flutter/material.dart';
import 'package:space_app_task/core/constants/app_assets.dart';
import 'package:space_app_task/core/theme/app_colors.dart';
import 'package:space_app_task/core/theme/app_typography.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.halfEarth,
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
            cacheWidth: (width * devicePixelRatio).round(),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, AppColors.background],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.4, 1.0],
              ),
            ),
          ),
          const SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Explore',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.appBar,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Which planet\nwould you like to explore?',
                          style: AppTypography.title,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
