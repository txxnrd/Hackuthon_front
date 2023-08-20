import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFFF0000).withOpacity(0.27),
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
                          width: 60,
                          height: 30,
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
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 60,
                          height: 30,
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
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: 200,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 17),
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
                  child: Image.asset(
                    'assets/images/mad.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SchedulePage(),
  ));
}
