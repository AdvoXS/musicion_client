import 'package:flutter/material.dart';

import '../../../../../core/utils/presentation/enter_exit_page_route.dart';


class NextButton extends StatefulWidget {
  Widget thisPage;
  Widget nextPage;

  NextButton({super.key,
    required this.thisPage,
    required this.nextPage});

  @override
  _NextButtonState createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  bool _load = false;
  Color backColor = const Color(0xffF1F1F1);
  final Color color = const Color(0xff222222);
  late Widget thisPage;
  late Widget nextPage;

  @override
  void initState() {
    super.initState();
    thisPage = widget.thisPage;
    nextPage = widget.nextPage;
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 200,
              minHeight: 40
            ),
            child: SizedBox(
              width: widthScreen * 0.12,
              height: heightScreen * 0.03,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(12))),
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Color.fromARGB(
                              backColor.alpha,
                              backColor.red ~/ 1.5,
                              backColor.green ~/ 1.5,
                              backColor.blue ~/ 1.5);
                        } else if (states.contains(MaterialState.disabled)) {
                          return Color.fromARGB(
                              backColor.alpha,
                              backColor.red ~/ 1.5,
                              backColor.green ~/ 1.5,
                              backColor.blue ~/ 1.5);
                        }
                        return backColor;
                      }),
                      foregroundColor: MaterialStateProperty.all(color)),
                  onPressed: () {
                    _load ? null : applyNextPage();
                  },
                  child: _load
                      ? const Padding(
                      padding: EdgeInsets.all(6),
                      child: Center(
                          child: SizedBox(
                              width: 29,
                              height: 29,
                              child: CircularProgressIndicator(
                                  color: Color(0xff1AAF8C)
                              ))))
                      :  const Padding(
                      padding: EdgeInsets.all(6),
                      child: Center(
                          child: Text("Далее",
                              //textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))))),
            ),
          )
      ],
    );
  }

  applyNextPage() async {
    setState(() {
      _load = true;
      Navigator.push(
          context,
          EnterExitRoute(
          exitPage: thisPage, enterPage:nextPage));
      _load = false;
    });
  }
}
