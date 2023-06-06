import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'error.dart';

class User {
  final String name;
  final String email;
  final String company;

  User({required this.name, required this.email, required this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      company: json['company']['name'],
    );
  }
}

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late Future<List<User>> futureUsers;


  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
    
  }

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        List<User> users =
            List<User>.from(l.map((model) => User.fromJson(model)));
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ErrorPage()));
      return []; // You need to return something here. An empty list would work.
    }
  }


  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: FutureBuilder<List<User>>(
      future: futureUsers,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ErrorPage(),
            ),
          );
          return SizedBox.shrink(); // Return an empty widget.
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  expandedHeight: 100.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Пользователи',style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        width: 375,
                        height: 80,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 80,
                              height: 80,
                              child: Image.asset('assets/images/user.png'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  snapshot.data![index].name,
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  snapshot.data![index].email,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black54),
                                ),
                                Text(
                                  snapshot.data![index].company,
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: snapshot.data!.length,
                  ),
                ),
              ],
            );
          }
        }

        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator(color: Color(0xFF9B51E0),));
      },
    ),
  );
}
}