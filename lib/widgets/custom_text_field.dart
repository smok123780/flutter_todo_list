import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/providers/tasks.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool autoFocus;
  final bool enabled;
  final bool visibleIcon;

  CustomTextField(
      {this.textEditingController,
      this.autoFocus = true,
      this.enabled = true,
      this.visibleIcon = true,
      });

  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        height: 40,
        child: TextField(
          controller: textEditingController,
          onChanged: (text) => tasksData.searchTasks(text),
          cursorColor: Colors.black,
          autofocus: autoFocus,
          enabled: enabled,
          maxLines: 1,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () => textEditingController.clear(),
              icon: Icon(
                MdiIcons.closeCircle,
                color: visibleIcon ? Colors.grey : Colors.transparent,
              ),
            ),
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            filled: true,
            prefixStyle: TextStyle(color: Colors.black),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: "Search",
          ),
        ),
      ),
    );
  }
}
