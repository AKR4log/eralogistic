import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

Widget inputTextCustom(
    {String titleInput,
    TextEditingController controller,
    String titleHint,
    IconData icon}) {
  return Container(
    margin: const EdgeInsets.symmetric(),
    child: Column(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Text(titleInput),
      ),
      TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: Icon(icon,
                color: const Color.fromRGBO(57, 94, 149, 1), size: 18),
            hintText: titleHint,
            errorText: controller.text.isEmpty ? 'Error message' : null,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color.fromRGBO(45, 67, 80, 1))),
      )
    ]),
  );
}

Widget inputPhoneCustom(
    {String titleInput,
    TextEditingController controller,
    String titleHint,
    IconData icon}) {
  return Container(
    margin: const EdgeInsets.symmetric(),
    child: Column(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Text(titleInput),
      ),
      TextField(
        controller: controller,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          PhoneInputFormatter(
            onCountrySelected: (PhoneCountryData countryData) {},
            allowEndlessPhone: false,
          )
        ],
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(icon,
                color: const Color.fromRGBO(57, 94, 149, 1), size: 18),
            isCollapsed: true,
            // contentPadding: const EdgeInsets.symmetric(
            //   horizontal: 25,
            //   vertical: 22,
            // ),
            hintText: titleHint,
            errorText: controller.text.isEmpty ? 'Error message' : null,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color.fromRGBO(45, 67, 80, 1))),
      )
    ]),
  );
}

Widget inputDropdownCustom(
    {String titleInput, dynamic val, String titleHint, IconData icon}) {
  return StatefulBuilder(builder: (context, setState) {
    return Container(
      margin: const EdgeInsets.symmetric(),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(titleInput),
        ),
        DropdownButton(
          value: val,
          icon: Icon(icon),
          iconSize: 6,
          borderRadius: BorderRadius.circular(8),
          hint: Text(titleHint),
          items: const <DropdownMenuItem>[
            DropdownMenuItem(
              value: 'Option 1',
              child: Text('Option 1'),
            ),
            DropdownMenuItem(
              value: 'Option 2',
              child: Text('Option 2'),
            ),
            DropdownMenuItem(
              value: 'Option 3',
              child: Text('Option 3'),
            ),
            DropdownMenuItem(
              value: 'Option 4',
              child: Text('Option 4'),
            ),
            DropdownMenuItem(
              value: 'Option 5',
              child: Text('Option 5'),
            ),
            DropdownMenuItem(
              value: 'Option 6',
              child: Text('Option 6'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              val = value;
            });
          },
        ),
      ]),
    );
  });
}
