import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        // value: widget.state.outputFormat,
        onChanged: (value) {},

        onMenuStateChange: (value) {},

        hint: Row(
          children: const [
            Icon(
              Icons.more_horiz,
              color: Colors.grey,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                'More',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: [
          DropdownMenuItem(
              alignment: Alignment.center,
              value: 'Share',
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.share),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Share'),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              onTap: () {}),
          DropdownMenuItem(
            alignment: Alignment.center,
            value: 'Save',
            child: DropdownMenuItem(
                alignment: Alignment.center,
                value: 'Share',
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.bookmark),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Save'),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                onTap: () {}),
          ),
          DropdownMenuItem(
              alignment: Alignment.center,
              value: 'Report',
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.report),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Report'),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              onTap: () {}),
        ],
        isExpanded: true,
        iconStyleData: IconStyleData(
          iconSize: 0,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(left: 6, right: 6),
          height: 35,
          width: 80,
        ),
        dropdownStyleData: DropdownStyleData(
          width: 140,
          elevation: 0,
          offset: Offset(-65, 180),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2.0,
                  blurRadius: 5.0
                ),

              ],
          ),
        ),
      ),
    );
  }
}
