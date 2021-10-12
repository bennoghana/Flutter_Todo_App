import 'package:flutter/material.dart';

class CreateTodoView extends StatelessWidget {
  CreateTodoView({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create  New Todo'),
        ),
        body: Form(
          child: ListView(children: [
            TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: 'Title',
                    hintText: "Enter your title here",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: Theme.of(context).textTheme.bodyText1)),
            SizedBox(height: 15),
            TextFormField(
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              controller: _descController,
              decoration: const InputDecoration(
                labelText: "Description",
                hintText: "Please  describe your task here",
              ),
            )
          ]),
        ));
  }
}
