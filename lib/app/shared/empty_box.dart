import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../config/constants/app_constant.dart";
import "../config/messages/app_message.dart";
import "../config/themes/app_theme.dart";

class EmptyBox extends StatelessWidget {
  final String label;
  const EmptyBox({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    ///
    final bool isTablet = context.isTablet;
    final double screenWidth = isTablet ? AppConstant.screenTablet : AppConstant.screenWidth;
    final double screenHeight = isTablet ? AppConstant.screenHeight : AppConstant.screenHeight;
    final double width = screenWidth * .5;
    final double height = screenWidth * .5;

    ///
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 50 : 15,
        vertical: isTablet ? 25 : 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            AppMessage.asset_icon_warning,
            color: AppTheme.red_color.withValues(alpha: .25),
            width: width,
            height: height,
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 0,
            minVerticalPadding: 0,
            horizontalTitleGap: 0,
            title: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppTheme.red_color,
                fontWeight: FontWeight.w500,
                letterSpacing: .5,
                fontSize: 17.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
