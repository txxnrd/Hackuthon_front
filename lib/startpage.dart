import 'package:flutter/material.dart';
import 'package:hackuton_front_flutter/searchpage.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String selectedPlace = "장소를 입력해주세요.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // 여기에 프로필 버튼을 눌렀을 때의 동작을 추가합니다.
            },
          ),
        ],
      ),
      body: Column(

        children: [
          Container(
            height: 280,
            width: double.infinity,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),  // 모서리 둥글게
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25.0),  // 왼쪽 마진 설정
                  alignment: Alignment.centerLeft,  // 왼쪽 정렬
                  child: Text(
                    '언제 어디로 놀러가시나요?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '날짜',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 20), // 간격
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],  // 회색 배경
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: DropdownButton<String>(
                          underline: SizedBox.shrink(),  // 밑줄 제거
                          items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                          hint: Row(
                            children: [
                              SizedBox(width: 10),  // 여기에서 원하는 마진 크기를 설정하세요.
                              Text("월")
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],  // 회색 배경
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: DropdownButton<String>(
                          underline: SizedBox.shrink(),  // 밑줄 제거
                          items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                          hint: Row(
                            children: [
                              SizedBox(width: 10),  // 여기에서 원하는 마진 크기를 설정하세요.
                              Text("일")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(

                  margin: EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '장소',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 20), // 간격
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchPage()),
                          );
                        },
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          padding: EdgeInsets.only(left: 17), // 원하는 마진값을 줍니다.
                          child: Row(
                            children: [
                              Text(
                                '장소를 입력해주세요.',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.search,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 15),
                Container(

                  margin: EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '장소',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 20), // 간격
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          padding: EdgeInsets.only(left: 17), // 원하는 마진값을 줍니다.
                          child: Row(
                            children: [
                              Text(
                                '장소를 입력해주세요.',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 40,
                  width: 100,
                  margin: EdgeInsets.only(left: 200),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,  // 버튼의 배경 색을 흰색으로 설정
                      onPrimary: Colors.blue,  // 버튼의 글자 색을 하늘색으로 설정
                      side: BorderSide(color: Colors.blue, width: 2),  // 테두리 색과 두께 설정
                      shape: RoundedRectangleBorder(  // 테두리 둥글게 설정
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {
                      // 추가하기 버튼을 눌렀을 때의 동작을 추가합니다.
                    },
                    child: Text(
                      '추가하기',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
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
    home: StartPage(),
  ));
}
