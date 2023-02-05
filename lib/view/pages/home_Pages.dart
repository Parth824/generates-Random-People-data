import 'package:flutter/material.dart';
import 'package:sky3/Helper/ApiHelper.dart';
import 'package:sky3/model/rendeom.dart';

class RandomClass extends StatefulWidget {
  const RandomClass({super.key});

  @override
  State<RandomClass> createState() => _RandomClassState();
}

class _RandomClassState extends State<RandomClass> {
  late Future<rendeom?> dat;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dat = helperapi.hlpa.getfined();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Generates Random People Data",
          style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                dat = helperapi.hlpa.getfined();
              });
            },
            child: Icon(Icons.restart_alt),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
            future: dat,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Data Not Fond"));
              } else if (snapshot.hasData) {
                return Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              maxRadius: 80,
                              backgroundImage:
                                  NetworkImage("${snapshot.data!.medium}"),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Name : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "${snapshot.data!.name}",
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Email : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "${snapshot.data!.email}",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Phone : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "${snapshot.data!.phone}",
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Call : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "${snapshot.data!.cell}",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Age : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "${snapshot.data!.age}",
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "DOB : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "${snapshot.data!.date}",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Loction : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "${snapshot.data!.city} ${snapshot.data!.state} ${snapshot.data!.country}",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
