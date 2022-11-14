import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:temp_users/base_url.dart';

Future getUsers(BuildContext context) async {
  var userUrl = '${BaseURL().url}/users';
  var users = await http.get(Uri.parse(userUrl));
  var userDecode = jsonDecode(users.body);
  // print(jsonDecode(users.body));
  return userDecode;
}

Future getPosts(BuildContext context, int userId) async {
  var userUrl = '${BaseURL().url}/posts?userId=$userId';
  var posts = await http.get(Uri.parse(userUrl));
  var postsDecode = jsonDecode(posts.body);
  // print(jsonDecode(users.body));
  return postsDecode;
}

Future getAlbums(BuildContext context, int userId) async {
  var userUrl = '${BaseURL().url}/albums?userId=$userId';
  var albums = await http.get(Uri.parse(userUrl));
  var albumDecode = jsonDecode(albums.body);
  // print(jsonDecode(users.body));
  return albumDecode;
}

Future getTodos(BuildContext context, int userId) async {
  var userUrl = '${BaseURL().url}/todos?userId=$userId';
  var todos = await http.get(Uri.parse(userUrl));
  var todoDecode = jsonDecode(todos.body);
  // print(jsonDecode(users.body));
  return todoDecode;
}

Future getPostDetails(BuildContext context, int postId) async {
  var userUrl = '${BaseURL().url}/comments?postId=$postId';
  var postDetails = await http.get(Uri.parse(userUrl));
  var postDetailsDecode = jsonDecode(postDetails.body);
  // print(jsonDecode(users.body));
  return postDetailsDecode;
}

Future getAlbumPics(BuildContext context, int albumId) async {
  var userUrl = '${BaseURL().url}/photos?albumId=$albumId';
  var photos = await http.get(Uri.parse(userUrl));
  var photosDecode = jsonDecode(photos.body);
  // print(jsonDecode(users.body));
  return photosDecode;
}
