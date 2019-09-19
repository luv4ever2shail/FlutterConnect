import 'dart:convert';
import 'dart:io';
import 'package:connect/itemDetails.dart';
import 'package:connect/items.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';

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
  bool isSearching = false;
  ScrollController _rrectController = ScrollController();

  @override
  void initState() {
    _focusNode = FocusNode();
    getdData();
    isSearching = false;
    super.initState();
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

  Widget appBarTitle = new Text(
    "SPM Connect",
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  void _handleSearchStart() {
    setState(() {
      isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "SPM Connect",
        style: new TextStyle(color: Colors.white),
      );
      isSearching = false;
      _textFieldController.clear();
      filteredWordsList = posts;
    });
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

  Widget buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      backgroundColor: Color(0xFF192A56),
      title: appBarTitle,
      actions: <Widget>[
        new IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(
                  Icons.close,
                  color: Colors.white,
                );
                this.appBarTitle = new TextField(
                  focusNode: _focusNode,
                  controller: _textFieldController,
                  onChanged: _onSearch,
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    hintStyle: new TextStyle(color: Colors.white),
                  ),
                );
                _handleSearchStart();
              } else {
                _handleSearchEnd();
              }
            });
          },
        ),
      ],
      leading: isSearching
          ? Container()
          : IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  posts.clear();
                  filteredWordsList.clear();
                });
                getdData();
              },
            ),
    );
  }

  final _itemExtent = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBar(context),
      body: DraggableScrollbar.arrows(
        alwaysVisibleScrollThumb: false,
        backgroundColor: Colors.grey[850],
        padding: EdgeInsets.only(right: 4.0),
        labelTextBuilder: (double offset) {
          final int currentItem = offset ~/ 100;
          var letter = currentItem <= filteredWordsList.length - 1
              ? filteredWordsList[currentItem].itemNumber.substring(0, 3)
              : filteredWordsList[currentItem].itemNumber.substring(0, 3);
          return Text(
            "$letter",
            style: TextStyle(color: Colors.white),
          );
        },
        controller: _rrectController,
        child: ListView.builder(
          controller: _rrectController,
          itemCount: filteredWordsList.length,
          itemExtent: _itemExtent,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.blue[index % 9 * 100],
                child: Center(
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
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
