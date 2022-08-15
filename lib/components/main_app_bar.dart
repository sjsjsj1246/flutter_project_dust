import 'package:flutter/material.dart';
import 'package:flutter_project_dust/const/colors.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white, fontSize: 30);
    return SliverAppBar(
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
            child: Container(
          margin: EdgeInsets.only(top: kToolbarHeight),
          child: Column(
            children: [
              Text(
                "서울",
                style: textStyle.copyWith(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                DateTime.now().toString(),
                style: textStyle.copyWith(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Image.asset(
                "asset/img/mediocre.png",
                width: MediaQuery.of(context).size.width / 2,
              ),
              const SizedBox(height: 20.0),
              Text(
                "보통",
                style: textStyle.copyWith(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                "나쁘지 않네요!",
                style: textStyle.copyWith(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
