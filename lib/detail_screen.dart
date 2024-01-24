import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sagomap/models/cultural_event_info_detail.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final CulturalEventInfoDetail detail;

  DetailScreen({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(detail.MAIN_IMG),
              ListTile(
                leading: Text("이름"),
                trailing: Text(detail.TITLE),
              ),
              ListTile(
                leading: Text("주최"),
                trailing: Text(detail.ORG_NAME),
              ),
              ListTile(
                leading: Text("기간"),
                trailing: Text(detail.STRTDATE.replaceAll("00:00:00.0", "") +
                    "~" +
                    detail.END_DATE.replaceAll("00:00:00.0", "")),
              ),
              ListTile(
                leading: Text("위치"),
                trailing: Text(detail.GUNAME),
              ),
              ListTile(
                leading: Text("장소"),
                trailing: Text(detail.PLACE),
              ),
              ListTile(
                leading: Text("대상"),
                trailing: Text(detail.USE_TRGT),
              ),
              ListTile(
                leading: Text("가격"),
                trailing: Text(
                    detail.USE_FEE.isEmpty ? detail.IS_FREE : detail.USE_FEE),
              ),
              ListTile(
                leading: Text("티켓"),
                trailing: Text(detail.TICKET),
              ),
              ListTile(
                leading: Text("링크"),
                title: InkWell(
                    onTap: () {
                      launchUrl(Uri.parse(detail.ORG_LINK));
                    },
                    child: Text(
                      detail.ORG_LINK,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
