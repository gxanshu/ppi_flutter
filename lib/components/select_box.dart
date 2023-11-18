import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> listHandler(List<String> items){

	List<DropdownMenuItem<String>> dropdownItems = [];

	for(final item in items){
		dropdownItems.add(DropdownMenuItem(
			value: item,
			child: Text(item),
		));
	}

	return dropdownItems;
}

class SelectBox extends StatefulWidget {
	String value;
	final List<String> items;
	final void Function(String type) changeState;

  SelectBox({ super.key, required this.value, required this.items, required this.changeState });

  @override
  State<SelectBox> createState() => _SelectBoxState();
}

class _SelectBoxState extends State<SelectBox> {
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
    	decoration: InputDecoration(
    		border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    		contentPadding: const EdgeInsets.all(18)
    	),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
        	isDense: true,
        	value: widget.value,
        	items: listHandler(widget.items),
        	isExpanded: true,
        	onChanged: (String? newValue){
        		setState(() {
        		  widget.value = newValue!;
        		});
        		widget.changeState(newValue!);
        	},
        ),
      ),
    );
  }
}