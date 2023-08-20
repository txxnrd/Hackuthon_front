import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';  // 추가


class SearchPage extends StatelessWidget {
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
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(13.0),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: '장소를 입력해주세요.',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 8, left: 25),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              '최근 검색어',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 0, left: 40),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 가로축 정렬
              children: [
                Text(
                  '에버랜드',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                IconButton(

                  icon: Icon(Icons.close), // 'x' 아이콘
                  onPressed: () {
                    // 'x' 버튼을 눌렀을 때의 동작을 여기에 작성합니다.
                  },
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 0, left: 40),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 가로축 정렬
              children: [
                Text(
                  '여의도 한강공원',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.all(2.0),
                  icon: Icon(Icons.close), // 'x' 아이콘
                  onPressed: () {
                    // 'x' 버튼을 눌렀을 때의 동작을 여기에 작성합니다.
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 400,  // 높이는 원하는 대로 조절 가능
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.5665, 126.9780),  // 초기 위치 (서울)
                zoom: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchPage(),
  ));
}