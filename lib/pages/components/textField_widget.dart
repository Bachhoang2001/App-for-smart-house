import 'package:door_manager/constants.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Text(
              widget.label,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: KMainText),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              cursorColor: KMainText,
              controller: controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29),
                      borderSide: BorderSide(width: 1, color: KMainText)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29),
                      borderSide: BorderSide(width: 1, color: KMainText)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29),
                      borderSide: BorderSide(width: 1, color: KMainText))),
              maxLines: widget.maxLines,
            ),
          ),
        ],
      );
}
