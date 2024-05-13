import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/presentation/app_colors.dart';
class ProductMinimalView extends StatefulWidget{
  final String assetPath;
  final String text;

  const ProductMinimalView(this.assetPath, this.text, {super.key});



  @override
  State<ProductMinimalView> createState() =>_ProductMinimalViewState(assetPath, text);

}
class _ProductMinimalViewState extends State<ProductMinimalView> {
  final String assetPath;
  final String text;
  bool _ishovering = false;
   _ProductMinimalViewState(this.assetPath, this.text);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (details) => setState(() => _ishovering = true),
      onExit: (details) => setState(() {
        _ishovering = false;
      }),
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        decoration: BoxDecoration(
          color: _ishovering ? AppColor.backgroundColorBlockHover : AppColor.backgroundColorBlock,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[ ConstrainedBox(
                constraints: const BoxConstraints(
                    maxHeight: 230,
                    maxWidth: 230,
                    minWidth: 200,
                    minHeight: 200),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),// Image radius
                    child: Image.asset(assetPath, fit: BoxFit.cover),
                ),
              ),
            const Padding(padding: EdgeInsets.only(bottom: 4)),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
            )
          ]),
        ),
      ),
    );
  }
}
