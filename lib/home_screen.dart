import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sagomap/detail_screen.dart';
import 'package:sagomap/models/cultural_event_info.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'main.dart';
import 'models/cultural_event_info_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _today = DateTime.now();
  int _currentPage = 1;
  int _perPageRow = 1000;
  bool _isPageEnd = false;

  List<CulturalEventInfoDetail> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("서울시 문화행사 정보"),
        actions: [
          IconButton(
              onPressed: () {
                getFullList();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, SwipeablePageRoute(
                builder: (context) {
                  return DetailScreen(detail: _list[index]);
                },
              ));
            },
            leading: Image.network(_list[index].MAIN_IMG),
            title: Text(_list[index].TITLE,
                maxLines: 1, overflow: TextOverflow.ellipsis),
            subtitle: Text(_list[index].STRTDATE.replaceAll("00:00:00.0", "") +
                "~" +
                _list[index].END_DATE.replaceAll("00:00:00.0", "")),
            trailing: Chip(
                label: Text(_list[index].IS_FREE,
                    style: TextStyle(
                        color: _list[index].IS_FREE == "무료"
                            ? null
                            : Colors.white)),
                backgroundColor: _list[index].IS_FREE == "무료"
                    ? Colors.greenAccent
                    : Colors.redAccent,visualDensity: VisualDensity.compact),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    getFullList();
  }

  void pageUp() {
    _currentPage += _perPageRow;
  }

  Future<void> getFullList() async {
    _currentPage = 1;
    _list = [];
    while (!_isPageEnd) {
      await getList();
      pageUp();
    }
    _list.sort(
      (a, b) {
        return a.STRTDATE.compareTo(b.STRTDATE);
      },
    );
    setState(() {});
  }

  Future<void> getList() async {
    Response response = await Dio().get(
        'http://openapi.seoul.go.kr:8088/497243664869646c38307271785848/json/culturalEventInfo/' +
            _currentPage.toString() +
            '/' +
            (_currentPage + _perPageRow - 1).toString());

    CulturalEventInfo result =
        CulturalEventInfo.fromJson(response.data['culturalEventInfo']);

    if (result.row.length != _perPageRow) {
      _isPageEnd = true;
    }

    for (CulturalEventInfoDetail row in result.row) {
      var endDate = DateTime.parse(row.END_DATE);
      if (endDate.isAfter(_today)) {
        continue;
      } else {
        _list.add(row);
      }
    }
  }
}
