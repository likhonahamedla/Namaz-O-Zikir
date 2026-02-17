import 'package:after_salat/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/urls.dart';
import '../widgets/screen_background.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});
  static const String name = '/developerScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Column(
          spacing: 10.h,
          children: [
            SizedBox(height: 100.h),
            CircleAvatar(
              radius: 70.r,
              backgroundColor: Colors.grey.shade200,
              child: ClipOval(
                child: Align(
                  alignment: Alignment(0, 0.3),
                  child: Image.asset(
                    AssetsPath.profile,
                    width: 135.r,
                    height: 140.r,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Text(
              'Emon Ahamed Likhon',
              style: GoogleFonts.prompt(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20.h,
              children: [
                _socialBtn(
                  context,
                  LineIcons.facebook,
                  Colors.blue,
                  ProfileUrls.facebook,
                ),
                _socialBtn(
                  context,
                  LineIcons.whatSApp,
                  Colors.green,
                  ProfileUrls.whatsApp,
                ),
                _socialBtn(
                  context,
                  LineIcons.linkedin,
                  Colors.blueAccent,
                  ProfileUrls.linkdIn,
                ),
                _socialBtn(
                  context,
                  LineIcons.github,
                  Colors.black,
                  ProfileUrls.gitHub,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please check Internet Connection first')),
      );
    }
  }

  Widget _socialBtn(
    BuildContext context,
    IconData icon,
    Color color,
    String url,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () => openUrl(context, url),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(icon, color: color, size: 70),
        ),
      ),
    );
  }
}
