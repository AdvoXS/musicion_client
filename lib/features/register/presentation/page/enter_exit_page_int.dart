import 'package:flutter/material.dart';

abstract interface class EnterExitPage extends Widget{
  const EnterExitPage({super.key});

  EnterExitPage nextPage();
}