import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

        ],
      ),
      body: Column(
        children: [
          Container(
            height: 110,
            width: double.infinity,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFFFBABA),
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
                  child: Image.asset(
                    'assets/images/mad.png',
                    width: 62,
                    height: 62,
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
