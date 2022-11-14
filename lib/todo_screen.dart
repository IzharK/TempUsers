import 'package:flutter/material.dart';
import 'package:temp_users/services/api_service.dart';

class TodoScreen extends StatefulWidget {
  int userId;

  TodoScreen(this.userId, {super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    int todoId;
    String title;
    bool isDone = false;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todos of User ${widget.userId}',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getPosts(context, widget.userId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  // widget.userId = snapshot.data[index]['userId'];
                  todoId = snapshot.data[index]['id'];
                  title = snapshot.data[index]['title'];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal.shade700,
                        child: Text(widget.userId.toString()),
                      ),
                      title: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Switch(
                          value: isDone,
                          onChanged: (newDone) {
                            setState(() {
                              isDone = newDone;
                            });
                          }),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
