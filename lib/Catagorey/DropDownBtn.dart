import 'package:flutter/material.dart';

// Create a reusable dropdown component
class CustomDropdownButton extends StatefulWidget {
  final List<String> dropDownItems; // List of dropdown items
  final String? selectedItem; // Currently selected item
  final Function(String?) onChanged; // Callback when the value changes
  final String hintText; // Hint text for the dropdown

  const CustomDropdownButton({
    Key? key,
    required this.dropDownItems,
    required this.selectedItem,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.hintText,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          value: widget.selectedItem,
          onChanged:
              widget.onChanged, // Call the passed function when value changes
          dropdownColor: Colors.grey,
          items: widget.dropDownItems.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Text(
                      item,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
