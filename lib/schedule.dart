import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<Map<String, dynamic>> datas = [];
  bool showListView = true;  // 추가된 부분

  @override
  void initState() {
    super.initState();
    _searchPlace();
  }

  Future<void> _searchPlace() async {
    var username = 'HackKuthon2023';
    String url = 'http://192.168.0.121:5000/list?username={$username}';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      setState(() {
        datas = List<Map<String, dynamic>>.from(result.values);
      });
    } else {
      print('Failed to search for place');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', fit: BoxFit.cover, height: 30,),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showListView = true;
                  });
                },
                child: Text("남은 일정"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showListView = false;
                  });
                },
                child: Text("방문 완료"),
              ),
            ],
          ),
          Expanded(
              child: showListView
                  ? ListView.builder(
                itemCount: datas.length,
                itemBuilder: (context, index) {

                  var data = datas[index];
                  return Container(
                    height: 110,
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: data['status'] == 'happy' ? Color(0xffB8C7FF   ) : data['status'] == 'soso' ? Color(0xfffffb90) : Color(0xffFFBABA ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,  // 왼쪽 정렬
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 25.0),
                              child: Text(
                                '날짜',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              margin: EdgeInsets.only(left: 25.0),
                              child: Text(
                                '장소',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${data['month']}',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: 40,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${data['day']}',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Container(
                              width: 160,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '${data['place']}',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Image.asset(
                            'assets/images/${data['status']}.png',
                            width: 62,
                            height: 62,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
                  : Container(
                height: 60,
                margin: EdgeInsets.only(left:20,right:20,top:20,bottom:430),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,  // 왼쪽 정렬
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 25.0),
                          child: Text(
                            '날짜',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          margin: EdgeInsets.only(left: 25.0),
                          child: Text(
                            '장소',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,  // 왼쪽 정렬
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '8',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 40,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '9',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: 160,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Center(
                              child: Text(
                                '여의도 한강 공원',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: IconButton(
                          icon: Icon(Icons.check),
                          color: Colors.green,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('방문인증'),
                                  content: Text('리워드 200P 지급 완료!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();  // 알림창 닫기
                                      },
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        )


                    ),
                  ],
                ),
              )

          ),
        ],
      ),
    );
  }
}