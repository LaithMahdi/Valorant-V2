import 'package:flutter/material.dart';
import '../../../utils/class/status-request.dart';

class LoadingState extends StatelessWidget {
  final StatusRequest status;
  final Widget widget;
  const LoadingState({super.key, required this.status, required this.widget});

  @override
  Widget build(BuildContext context) {
    return status == StatusRequest.loading
        ? const Center(child: CircularProgressIndicator())
        : widget;
  }
}
