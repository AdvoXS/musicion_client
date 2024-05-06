import 'package:flutter/material.dart';

import '../../../auth/presentation/widgets/textfield/default_input_decoration.dart';

class RegisterTextField extends StatelessWidget{
  final TextEditingController textController;
  final String hintText;
  const RegisterTextField(this.textController, this.hintText);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight*0.02),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            minWidth: 200,
            maxHeight: 50
        ),
        child: SizedBox(
          width: screenWidth * 0.2,
          child: TextFormField(
              controller: textController,
              autofillHints: const [AutofillHints.username],
              style: const TextStyle(color: Colors.white),
              decoration: DefaultInputDecoration(hintText)),
        ),
      ),
    );
  }

}