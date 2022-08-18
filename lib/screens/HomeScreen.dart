import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_dust/components/card_title.dart';
import 'package:flutter_project_dust/components/category_card.dart';
import 'package:flutter_project_dust/components/hourly_card.dart';
import 'package:flutter_project_dust/components/main_app_bar.dart';
import 'package:flutter_project_dust/components/main_card.dart';
import 'package:flutter_project_dust/components/main_drawer.dart';
import 'package:flutter_project_dust/components/mame_stat.dart';
import 'package:flutter_project_dust/const/colors.dart';
import 'package:flutter_project_dust/const/env.dart';
import 'package:flutter_project_dust/model/stat_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    await Dio().get(
        "http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst",
        queryParameters: {
          "serviceKey": serviceKey,
          "returnType": "json",
          "numOfRows": 30,
          "pageNo": 1,
          "itemCode": "PM10",
          "searchCondition": "WEEK",
          "dataGubun": "HOUR"
        }).then((response) {
      print(response.data['response']['body']['items']
          .map((item) => StatModel.fromJson(json: item)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: PRIMARY_COLOR,
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [CategoryCard(), SizedBox(height: 16), HourlyCard()],
            ),
          )
        ],
      ),
    );
  }
}
