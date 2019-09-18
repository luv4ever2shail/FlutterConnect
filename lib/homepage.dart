import 'dart:convert';
import 'dart:io';
import 'package:connect/itemDetails.dart';
import 'package:connect/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Items> posts = List<Items>();
  List<Items> filteredWordsList = List<Items>();
  FocusNode _focusNode;
  TextEditingController _textFieldController = new TextEditingController();
  @override
  void initState() {
    _focusNode = FocusNode();

    super.initState();
    getdData();
  }

  Future<List> getdData() async {
    var httpClient = new HttpClient();
    var request = await httpClient.get("192.168.199.241", 8080, '/api/items');
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var jsonString = await response.transform(utf8.decoder).join();
      List data = json.decode(jsonString);
      for (var i = 0; i < data.length; i++) {
        posts.add(Items.fromJson(data[i]));
      }

      //posts = json.decode(jsonString);

      print(posts[0].itemNumber);
      setState(() {
        filteredWordsList = posts;
      });
      return posts;
    } else {
      setState(() {});
      return posts;
    }
  }

  String label = "SPM Connect";
  void _onSearch(value) {
    setState(() {
      filteredWordsList = posts
          .where((item) => item.fullSearch
              .toString()
              .toLowerCase()
              .contains('$value'.toLowerCase()))
          .toList();
      if (value.toString().length == 0) {
        label = "SPM Connect Items ";
      } else {
        label = filteredWordsList.length.toString() + " matching records";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(label)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                posts.clear();
                filteredWordsList.clear();
              });
              getdData();
            },
          )
        ],
      ),
      body: Center(
        child: posts.length == 0
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      focusNode: _focusNode,
                      controller: _textFieldController,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            size: 20,
                          ),
                          onPressed: () {
                            _textFieldController.text = "";
                            _onSearch("");
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                          },
                        ),
                        hintText: 'Search Here...',
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.0),
                        ),
                      ),
                      onChanged: _onSearch,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredWordsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5.0,
                          child: ListTile(
                            subtitle: Text(
                                '${filteredWordsList[index].manufacturer} - ${filteredWordsList[index].manufacturerItemNumber}'),
                            title: Text(
                                '${filteredWordsList[index].itemNumber} - ${filteredWordsList[index].description}'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemDetail(
                                            item: filteredWordsList[index],
                                          )));
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
