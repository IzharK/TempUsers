import 'package:flutter/material.dart';
import 'package:temp_users/album_screen.dart';
import 'package:temp_users/post_screen.dart';
import 'package:temp_users/todo_screen.dart';

import 'services/api_service.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int userId;
    String name, email;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Temp Users',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
          future: getUsers(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    userId = snapshot.data[index]['id'];
                    name = snapshot.data[index]['name'];
                    email = snapshot.data[index]['email'];
                    return Card(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.teal.shade700,
                              child: Text(userId.toString()),
                            ),
                            title: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              email,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PostScreen(userId),
                                          ),
                                        ),
                                    icon: const Icon(
                                        Icons.local_post_office_outlined)),
                                IconButton(
                                    onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AlbumScreen(userId),
                                          ),
                                        ),
                                    icon:
                                        const Icon(Icons.photo_album_outlined)),
                                IconButton(
                                    onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TodoScreen(userId),
                                          ),
                                        ),
                                    icon: const Icon(Icons.today_outlined)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
