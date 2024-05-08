// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:payam_user/packages.dart';

class ServiceModel {
  String title;
  String icon;
  Widget? page;
  ServiceModel({
    required this.title,
    required this.icon,
    this.page,
  });
}
