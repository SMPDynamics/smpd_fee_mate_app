import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final String assetName;

  const CustomIconButton({super.key, required this.text, required this.assetName});

  @override
  Widget build(final BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){},
        borderRadius: BorderRadius.circular(4),
        child: SvgPicture.asset(assetName, width: 320,),
      ),
    );
  }
}
