// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../packages.dart';

class SettingsModel {
  final String title;
  final String? subtitle;
  final String icon;
  final Widget? page;
  final Widget? leading;
  final bool arrow;
  final VoidCallback? onTap;
  SettingsModel({
    required this.title,
    this.subtitle,
    this.arrow = true,
    this.leading,
    required this.icon,
    this.onTap,
    this.page,
  });
}
