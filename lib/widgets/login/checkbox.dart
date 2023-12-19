import 'package:flutter/material.dart';

// class CustomCheckbox extends StatelessWidget {
//   final bool value;
//   final ValueChanged<bool> onChanged;

//   CustomCheckbox({Key? key, required this.value, required this.onChanged})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => onChanged(!value),
//       child: Container(
//         width: 4,
//         height: 6,
//         child: Transform.scale(
//           scale: 1.5,
//           child: Opacity(
//             opacity: value ? 1.0 : 0.3, // 체크되었을 때는 불투명, 아니면 희미하게
//             child: Checkbox(
//               value: value,
//               onChanged: (bool? newValue) => onChanged(newValue ?? false),
//               checkColor: Colors.black, // 체크 표시의 색상
//               activeColor: Colors.transparent, // 배경색 투명
//               tristate: true,
//               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomCheckbox({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Image.asset(
        value
            ? 'assets/icons/checkmark.png'
            : 'assets/icons/checkmark_grey.png',
        width: 14,
        height: 14,
      ),
    );
  }
}
