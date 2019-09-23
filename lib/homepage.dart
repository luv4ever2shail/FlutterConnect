import 'package:ConnectApp/Modules/itemspage.dart';
import 'package:ConnectApp/Modules/jobspage.dart';
import 'package:ConnectApp/Modules/workorderpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF192A56),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF192A56),
        centerTitle: true,
        title: Text(
          'SPM Connect Home',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5.0,
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          splashColor: Colors.blueAccent,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemsPage()));
                          },
                          child: Center(
                            child: Text(
                              'Items',
                              style: Theme.of(context).textTheme.headline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5.0,
                        child: InkWell(
                          splashColor: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JobsPage()));
                          },
                          child: Center(
                            child: Text(
                              'Jobs',
                              style: Theme.of(context).textTheme.headline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5.0,
                        child: InkWell(
                          splashColor: Colors.orangeAccent,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WorkOrderPage()));
                          },
                          child: Center(
                            child: Text(
                              'Work Order',
                              style: Theme.of(context).textTheme.headline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5.0,
                        child: InkWell(
                          splashColor: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'Purchase Req\'s',
                              style: Theme.of(context).textTheme.headline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
