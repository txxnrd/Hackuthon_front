import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 이름 표시
            Column(
              children: [
                Container(
                  height: 120,
                  width:340,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      // 이미지 추가
                      Image.asset(
                        'assets/images/noonchi.png',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 16), // 이미지와 텍스트 사이의 간격
                      // 텍스트
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center, // 중앙에 배치
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '이현정님',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '프로필 열기',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                ),
                // 버튼 추가
                Container(
                  width: 330, // 꽉 차게
                  height: 30, // 버튼 높이
                  margin: EdgeInsets.all(16), // 마진
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // 배경색 흰색
                      onPrimary: Colors.blue, // 글자색 파란색
                      side: BorderSide(color: Colors.blue, width: 2), // 테두리 파란색
                    ),
                    onPressed: () {
                      // 버튼을 눌렀을 때의 동작
                    },
                    child: Text(
                      '리워드 확인하기',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: 20),
            // 계정 관리 섹션
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '계정관리',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListTile(title: Text('개인 정보')),
                  ListTile(title: Text('로그인 및 보안')),
                  ListTile(title: Text('알림 설정')),
                ],
              ),
            ),
            // 도움말 섹션
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '도움말',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListTile(title: Text('이용 약관')),
                  ListTile(title: Text('개인정보 처리방침')),
                  ListTile(title: Text('고객센터')),
                ],
              ),
            ),
            // 로그아웃 버튼
            Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // 로그아웃 로직
                  },
                  child: Text('로그아웃'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyPage(),
  ));
}
