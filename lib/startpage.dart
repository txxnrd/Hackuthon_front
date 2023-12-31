import 'package:flutter/material.dart';
import 'package:hackuton_front_flutter/searchpage.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String? searchText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', fit: BoxFit.cover, height: 30,),
      ),
      body:SingleChildScrollView(
        child:Column(

         children: [
          Container(
            height: 190,
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
                  margin: EdgeInsets.only(left: 25.0,top: 13),  // 왼쪽 마진 설정
                  alignment: Alignment.centerLeft,  // 왼쪽 정렬
                  child: Text(
                    '언제 어디로 놀러가시나요?',
                    style: TextStyle(
                      fontSize: 18,
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
                        height: 30,
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
                        height: 30,
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
                          height: 40,
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

                  ),
                ),
              ],
            ),
          ),
           Container(
             margin: EdgeInsets.only(left:30,right:30,top:10),
             width: double.infinity,

             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
               children: [
                 Text(
                   '야경 맛집 한강공원 추천',
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 SizedBox(height: 20), // 텍스트와 이미지 사이의 간격
                 Container(
                   height: 200,  // 이 값을 조절하여 스크롤 영역의 높이를 설정할 수 있습니다.
                   child: ListView(
                     scrollDirection: Axis.horizontal,  // 수직 스크롤
                     children: [
                       Image.asset('assets/images/yangwha.png', width: 120, height: 300,), // 세 번째 이미지
                       SizedBox(width: 20), // 이미지 사이의 간격
                       Image.asset('assets/images/mang.png', width: 120, height: 300,), // 두 번째 이미지
                       SizedBox(width: 20), // 이미지 사이의 간격
                       Image.asset('assets/images/banpo.png', width: 120, height: 300,), // 첫 번째 이미지
                     ],
                   ),
                 ),
               ],
             ),
           ),
           Container(
             margin: EdgeInsets.only(left:30,right:30,top:10),
             width: double.infinity,

             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
               children: [
                 Text(
                   '지금 한적한 공원',
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 SizedBox(height: 20), // 텍스트와 이미지 사이의 간격
                 Container(
                   height: 200,  // 이 값을 조절하여 스크롤 영역의 높이를 설정할 수 있습니다.
                   child: ListView(
                     scrollDirection: Axis.horizontal,  // 수직 스크롤
                     children: [
                       Image.asset('assets/images/banpo.png', width: 120, height: 300,), // 첫 번째 이미지
                       SizedBox(width: 20), // 이미지 사이의 간격
                       Image.asset('assets/images/mang.png', width: 120, height: 300,), // 두 번째 이미지
                       SizedBox(width: 20), // 이미지 사이의 간격
                       Image.asset('assets/images/yangwha.png', width: 120, height: 300,), // 세 번째 이미지
                     ],
                   ),
                 ),
               ],
             ),
           ),




         ],

      ),
      )
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: StartPage(),
  ));
}
