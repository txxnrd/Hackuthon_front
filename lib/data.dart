import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class DataPage extends StatelessWidget {
  final String location;
  final DateTime date;
  var status;
  var past_data;
  var user_data;
  var weather;

  DataPage(required location, required date){
    this.location = location;
    this.date = date;

    Future<void> _searchPlace() async {
    String url =
        'http://192.168.0.121:5000/get_place_data?date=${selectedDate.toString()}&place=$_searchController.text';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      print('Result from Google API: $result');  // 결과 로깅

      // 결과 배열이 비어있는지 확인
      if (result['status'].isNotEmpty) {
        this.status = result['status'];
        this.past_data = result['past_data'];
        this.user_data = result['user_data'];
        this.weather = result['weather'];
      } else {
        print('No candidates found');  // 결과가 없을 경우 로깅
      }
    } else {
      print('Failed to search for place');
    }

  }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('데이터 '),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          // 상단에 위치와 날짜를 표시
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '장소: $location',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height:10),
                Text(
                  '날짜: ${date.toLocal().toString().split(' ')[0]}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // 하단에 두 개의 흰색 컨테이너
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(16),
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(16),
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 40, //
                          left: 116, // 왼쪽 여백을 16으로 설정
                          child: Text(
                            '띠로리! 눈치게임 대실패.',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 40, // 아래쪽 위치 설정
                          right: 90, // 오른쪽 위치 설정
                          child: Image.asset(
                            'assets/images/mad.png', // 이미지 경로
                            width: 200, // 이미지 너비
                            height: 200, // 이미지 높이
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                Container(
                  margin: EdgeInsets.all(16),
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/ago-data.png', // 이미지 경로
                      width: 300, // 이미지 너비 (선택 사항)
                      height: 350, // 이미지 높이 (선택 사항)
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(16),
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/current-data.png', // 이미지 경로
                      width: 300, // 이미지 너비 (선택 사항)
                      height: 350, // 이미지 높이 (선택 사항)
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/weather.png', // 이미지 경로
                      width: 300, // 이미지 너비 (선택 사항)
                      height: 100, // 이미지 높이 (선택 사항)
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Share.share('공유할 내용을 여기에 작성하세요.');
                      },
                      child: Text(
                        '공유하기',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
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
