import 'package:flutter/material.dart';
import '../theme/color/color_schemes.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorSchemes.instance.primary,
      ),
    );
  }
}
