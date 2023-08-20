import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'data.dart';  // Data.dart 파일에서 DataPage를 import

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GoogleMapController? _mapController;
  TextEditingController _searchController = TextEditingController();
  DateTime? selectedDate;
  String googleAPIKey = "AIzaSyDMTx4E4-eVsH4OGR2cNdidSLmcMEyKT1c"; // Google API 키를 여기에 입력해 주세요.

  LatLng _initialPosition = LatLng(37.5665, 126.9780); // 초기 위치

  List<String> relatedSearches = ['여의도 한강공원', '뚝섬 한강공원', '반포 한강공원']; // 연관 검색어

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<void> _searchPlace() async {
    String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${_searchController.text}&inputtype=textquery&fields=geometry&key=$googleAPIKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      print('Result from Google API: $result');  // 결과 로깅

      // 결과 배열이 비어있는지 확인
      if (result['candidates'].isNotEmpty) {
        double lat = result['candidates'][0]['geometry']['location']['lat'];
        double lng = result['candidates'][0]['geometry']['location']['lng'];

        _mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, lng), zoom: 15),
          ),
        );
      } else {
        print('No candidates found');  // 결과가 없을 경우 로깅
      }
    } else {
      print('Failed to search for place');
    }

  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(13.0),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '장소를 입력해주세요.',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchPlace,
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            width: 500,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: relatedSearches.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _searchController.text = relatedSearches[index];
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(
                      label: Text(relatedSearches[index]),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            height: 400,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 11,
              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            child: ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(selectedDate == null ? '날짜 선택' : '${selectedDate!.toLocal()}'.split(' ')[0]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          if (_searchController.text.isNotEmpty && selectedDate != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DataPage(
                  location: _searchController.text,
                  date: selectedDate!,
                ),
              ),
            );
          } else {
            // 경고 메시지를 표시하거나 다른 처리를 할 수 있습니다.
            print("위치와 날짜를 모두 선택해주세요.");
          }
        },
      ),

    );
  }
}


void main() {
  runApp(MaterialApp(
    home: SearchPage(),
  ));
}
