import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/providers/tasks.dart';
import 'package:todo_list_app/widgets/custom_text_field.dart';
import 'package:todo_list_app/widgets/expansion_tile_button.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var textEditingController;

  @override
  void initState() {
    super.initState();

    textEditingController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => Provider.of<Tasks>(context, listen: false).clearSearchedTasks());
  }

  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context);
    final highPriorityTasks = tasksData.highPrioritySearchedTasks;
    final normalPriorityTasks = tasksData.normalPrioritySearchedTasks;
    final lowPriorityTasks = tasksData.lowPrioritySearchedTasks;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: CustomTextField(
                    textEditingController: textEditingController,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: FlatButton(
                    child: Text("Cancel"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                )
              ],
            ),
            ExpansionTileButton(
                "HIGH PRIORITY", Colors.redAccent, highPriorityTasks),
            ExpansionTileButton(
                "NORMAL PRIORITY", Colors.green, normalPriorityTasks),
            ExpansionTileButton("LOW PRIORITY", Colors.blue, lowPriorityTasks),
          ],
        ),
      ),
    );
  }
}
