import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_app/utilities/utils.dart';

import 'create_todo_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CreateTodoView();
          }));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: () {
            showBarModalBottomSheet(
              context: context,
              builder: (context) {
                return CompletedTasksWidget();
              },
            );
          },
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            height: 50,
            decoration: BoxDecoration(
                color:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Completed',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
                Text('24')
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            backgroundImage: AssetImage('assets/1.jpg'),
          ),
        ),
        title: Text('My Tasks'),
        actions: [
          IconButton(onPressed: null, icon: const Icon(Icons.sort)),
          IconButton(onPressed: null, icon: const Icon(Icons.search))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return const TodoTileWidget(status: true);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: 10)),
    );
  }
}

class CompletedTasksWidget extends StatelessWidget {
  const CompletedTasksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const TodoTileWidget(status: false);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: 10);
  }
}

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({
    Key? key,
    required this.status,
  }) : super(key: key);

  final bool status;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).shadowColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).backgroundColor,
      child: ListTile(
        leading: Icon(
          status ? Icons.check_circle_outline : Icons.check,
          color: dateColor('Yesterday'),
          size: 30,
        ),
        title: Text('Plan your Base Program ',
            style: Theme.of(context).textTheme.bodyText1),
        subtitle: const Text('This base program is going to be a very fun one'),
        trailing: TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: dateColor('Yesterday')),
            label: Text('Yesterday',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: dateColor('Yesterday')))),
      ),
    );
  }
}
