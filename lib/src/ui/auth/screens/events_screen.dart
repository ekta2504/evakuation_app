import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Container().authContainerScaffold(context: context);
  }
}