import 'dart:io';

import 'package:flutter/material.dart';

class SharePostScreen extends StatelessWidget {
  final File imageFile;

  const SharePostScreen({Key key, this.imageFile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.file(imageFile);
  }
}
