import 'package:after_salat/utils/asset_path.dart';
import 'package:after_salat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import '../extensions/utils_extension.dart';
import '../widgets/screen_background.dart';
import 'dart:math' as math;

class CompassScreen extends StatefulWidget {
  const CompassScreen({super.key});
  static const String name = '/compassScreen';

  @override
  State<CompassScreen> createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  bool _hasPermissions = false;

  @override
  void initState() {
    super.initState();
    _fetchPermissionStatus();
  }

  void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() => _hasPermissions = status == PermissionStatus.granted);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Builder(
          builder: (context) {
            if (_hasPermissions) {
              return _buildCompass();
            } else {
              return _buildPermissionSheet();
            }
          },
        ),
      ),
    );
  }

  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        double? direction = snapshot.data!.heading;

        if (direction == null) {
          return const Center(child: Text("সেন্সর পাওয়া যায়নি!"));
        }

        return Center(
          child: Transform.rotate(
            angle: (direction * (math.pi / 180) * -1),
            child: Image.asset(AssetsPath.compass, width: 400.w),
          ),
        );
      },
    );
  }

  Widget _buildPermissionSheet() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Text(
              'কম্পাস ব্যবহারের জন্য লোকেশন পারমিশন প্রয়োজন...',
              textAlign: .center,
              style: context.textTheme.titleLarge,
            ),
            CustomButton(buttonText: 'অনুমতি দিন', onTap: _permissionButton),
          ],
        ),
      ),
    );
  }

  Future<void> _permissionButton() async {
    var status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      _fetchPermissionStatus();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
