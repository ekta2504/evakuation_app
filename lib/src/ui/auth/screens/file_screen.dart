
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';

class FileScreen extends StatefulWidget {
  const FileScreen({Key? key}) : super(key: key);

  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container().authContainerScaffold(context: context);
  }
}