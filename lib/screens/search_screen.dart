import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class SearchScreen extends StatefulWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<Map> searchResult = [];
  bool isLoading = false;

  void onSearch() async {
    setState(() {
      searchResult = [];
      isLoading = true;
    });
    await FirebaseFirestore.instance
        .collection('users')
        .where(
          "firstname",
          isEqualTo: searchController.text,
        )
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Aucun utilisateur trouvé",
            ),
          ),
        );
        setState(() {
          isLoading = false;
        });
        return;
      }
      for (var user in value.docs) {
        if (user.data()['email'] != widget.user?.email) {
          searchResult.add(user.data());
        }
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Rechercher",
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Ecriver le nom d'utilisateur...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  onSearch();
                },
                icon: const Icon(
                  Icons.search,
                ),
              )
            ],
          ),
          if (searchResult.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.network(
                        searchResult[index]['image'],

                      ),
                    ),
                    title: Text(
                      searchResult[index]['firstname'],
                    ),
                    subtitle: Text(
                      searchResult[index]['email'],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          searchController.text = "";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              currentUser: widget.user,
                              friendId: searchResult[index]['id'],
                              friendName: searchResult[index]['firstname'],
                              friendImage: searchResult[index]['image'],
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.message),
                    ),
                  );
                },
              ),
            )
          else if (isLoading == true)
            const Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }
}
