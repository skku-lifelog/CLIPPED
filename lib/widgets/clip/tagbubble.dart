import 'package:flutter/material.dart';

class TagBubble extends StatefulWidget {
  final Color color;
  final String keyword;
  int type;
  final VoidCallback onPressed;
  TagBubble({required this.keyword, required this.color, required this.type, required this.onPressed, Key? key}) : super(key: key);

  @override
  State<TagBubble> createState() => _TagBubbleState();
}

class _TagBubbleState extends State<TagBubble> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.type == -1 ? widget.color : Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: widget.type == -1
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -1),
                    child: Text(
                      "#${widget.keyword}",
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: widget.color),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                    child: widget.color == Colors.black
                        ? Transform.translate(
                            offset: const Offset(0, -1),
                            child: const Icon(
                              Icons.add,
                              size: 11,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.color,
                          )),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -1),
                    child: Text(
                      widget.keyword,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
      ),
    );
  }
}
