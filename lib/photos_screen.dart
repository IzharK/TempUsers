import 'package:flutter/material.dart';
import 'package:temp_users/services/api_service.dart';

class PhotosScreen extends StatefulWidget {
  int albumId;

  PhotosScreen(this.albumId, {super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  Widget build(BuildContext context) {
    int photoId;
    String title, imgUrl, thumbnailUrl;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photos',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getAlbumPics(context, widget.albumId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  // widget.userId = snapshot.data[index]['userId'];
                  photoId = snapshot.data[index]['id'];
                  title = snapshot.data[index]['title'];
                  imgUrl = snapshot.data[index]['url'];
                  thumbnailUrl = snapshot.data[index]['thumbnailUrl'];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Image.network(imgUrl),
                                );
                              }),
                          child: Image.network(
                            thumbnailUrl,
                            width: 120,
                            height: 120,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
