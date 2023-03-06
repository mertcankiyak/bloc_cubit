library finans;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A Calculator.
class Finans {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class FinansView extends StatelessWidget {
  const FinansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finans view"),
      ),
    );
  }
}
