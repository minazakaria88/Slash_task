

import 'package:flutter/cupertino.dart';

extension Height on BuildContext{
  double get height=>MediaQuery.of(this).size.height;
}

extension Width on BuildContext{
  double get width=>MediaQuery.of(this).size.width;
}

extension Widthd on double{
  SizedBox get width=>SizedBox(width: this,);
}

extension Heightd on double{
  SizedBox get height=>SizedBox(height: this,);
}