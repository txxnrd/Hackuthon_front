import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:fl_chart/fl_chart.dart';

int convertDateToInt(DateTime date) {
  return date.year * 10000 + date.month * 100 + date.day;
}
class DataPage extends StatefulWidget {
  String location;
  final DateTime date;

  DataPage({required this.location, required this.date});

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  var status;
  var user_data;
  var past_data;
  var weather;


  @override
  void initState() {
    super.initState();
    _searchPlace();
  }

  Future<void> _searchPlace() async {
    String url =
        'http://192.168.0.121:5000/get_place_data?date=${widget.date.toString()}&place=${widget.location}';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      print('Result from Google API: $result');  // 결과 로깅

      if (result['status'].isNotEmpty) {
        setState(() {
          this.status = result['status'];
          this.past_data = result['past_data'];
          this.user_data = result['user_data'];
          this.weather = result['weather'];
        });
        print(result);
      } else {
        print('No candidates found');
      }
    } else {
      print('Failed to search for place');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '데이터',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            thickness: .3,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 상단에 위치와 날짜를 표시
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 0.1,),
                  Text(
                    '장소: ${widget.location}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    '날짜: ${widget.date.toLocal().toString().split(' ')[0]}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5,),
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
                          top: 40,
                          left: 0,
                          right: 0, // left와 right를 0으로 설정하여 가로로 꽉 차게 만듭니다.
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              status == 'happy' ? '딩동댕동! 눈치게임 대성공!' :
                              status == 'mad' ? '띠로리! 눈치게임 대실패.' :
                              '눈치게임 보통.',
                              style: TextStyle(
                                color: status == 'happy' ? Colors.blue :
                                status == 'mad' ? Colors.red :
                                Colors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center, // 텍스트를 가운데 정렬합니다.
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 40,
                          right: 90,
                          child: Image.asset(
                            status == 'happy' ? 'assets/images/happy.png' :
                            status == 'mad' ? 'assets/images/mad.png' :
                            'assets/images/soso.png',
                            width: 200,
                            height: 200,
                          ),
                        ),

                      ],
                    )
                  ],
                ),

                Container(
                  margin: EdgeInsets.all(16),  // 여기에 마진을 추가했습니다.
                  height: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5 ),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: past_data != null ? BarChart(
                      BarChartData(

                        barGroups: [
                          BarChartGroupData(
                            x: -3,
                            barRods: [
                              BarChartRodData(color: Color(0xFFD9D9D9),borderRadius: BorderRadius.circular(4), width: 20, toY: (past_data['-3'] ?? 0).toDouble()),
                            ],
                          ),
                          BarChartGroupData(
                            x: -2,
                            barRods: [
                              BarChartRodData(color: Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(4),width: 20,toY: (past_data['-2'] ?? 0).toDouble()),
                            ],
                          ),
                          BarChartGroupData(
                            x: -1,
                            barRods: [
                              BarChartRodData(color: Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(4),width: 20,toY: (past_data['-1'] ?? 0).toDouble()),
                            ],
                          ),
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(color:Color(0xFFFFD7D7),width: 20,borderRadius: BorderRadius.circular(4),
                                  toY: (past_data['0'] ?? 0).toDouble()),
                            ],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(color:Color(0xFF7190FF),borderRadius: BorderRadius.circular(4),width: 20, toY: (past_data['1'] ?? 0).toDouble()),
                            ],
                          ),
                          BarChartGroupData (
                            x: 2,
                            barRods: [
                              BarChartRodData(color: Color(0xFFD9D9D9),borderRadius: BorderRadius.circular(4),width: 20, toY: (past_data['2'] ?? 0).toDouble()),
                            ],
                          ),
                        ],
                        gridData: FlGridData(show: false),  // 그리드를 숨겼습니다.
                        borderData: FlBorderData(
                          show: true,
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                            left: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                            right: BorderSide(
                              color: Colors.white,
                            ),
                            top: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ) : CircularProgressIndicator(),  // 데이터가 null일 경우 로딩 인디케이터를 표시합니다.
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(16),  // 여기에 마진을 추가했습니다.
                  height: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5 ),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: user_data != null ? BarChart(
                      BarChartData(

                        barGroups: [
                          BarChartGroupData(
                            x: -3,
                            barRods: [
                              BarChartRodData(color: Color(0xFFD9D9D9),borderRadius: BorderRadius.circular(4), width: 20, toY: (user_data['-3'] ?? 0).toDouble()),
                            ],
                          ),
                          BarChartGroupData(
                            x: -2,
                            barRods: [
                              BarChartRodData(color: Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(4),width: 20,toY: (user_data['-2'] ?? 0).toDouble()),
                            ],
                          ),
                          BarChartGroupData(
                            x: -1,
                            barRods: [
                              BarChartRodData(color: Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(4),width: 20,toY: (user_data['-1'] ?? 0).toDouble()),
                            ],
                          ),
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(color:Color(0xFFFFD7D7),width: 20,borderRadius: BorderRadius.circular(4),
                                  toY: (user_data['0'] ?? 0).toDouble()),
                            ],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(color:Color(0xFF7190FF),borderRadius: BorderRadius.circular(4),width: 20, toY: (user_data['1'] ?? 0).toDouble()),
                            ],
                          ),
                          BarChartGroupData (
                            x: 2,
                            barRods: [
                              BarChartRodData(color: Color(0xFFD9D9D9),borderRadius: BorderRadius.circular(4),width: 20, toY: (user_data['2'] ?? 0).toDouble()),
                            ],
                          ),
                        ],
                        gridData: FlGridData(show: false),  // 그리드를 숨겼습니다.
                        borderData: FlBorderData(
                          show: true,
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                            left: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                            right: BorderSide(
                              color: Colors.white,
                            ),
                            top: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ) : CircularProgressIndicator(),  // 데이터가 null일 경우 로딩 인디케이터를 표시합니다.
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
                        Share.share('[띠로리! 눈치 게임 대실패.]\n '
                            '이 날에는 ${widget.location}에 703명이 이곳에 올 예정이에요\n'
                            '과거 이날에는 830명이 이곳을 방문했어요.\n'
                        '날씨는 31도로 조금 더울 예정이에요.');
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
