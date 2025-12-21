import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../config/themes/app_theme.dart";

class EmptyBox extends StatelessWidget {
  final String label;
  const EmptyBox({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTablet = context.isTablet;
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
          // SvgPicture.asset(
          //   AppMessage.asset_empty_box,
          //   color: AppTheme.main_color_2,
          //   width: 100,
          //   height: 100,
          // ),
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
                color: AppTheme.main_color_1,
                fontWeight: FontWeight.w600,
                letterSpacing: .5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
