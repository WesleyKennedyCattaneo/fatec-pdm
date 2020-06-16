import 'package:flutter/material.dart';
import 'package:projetofatec/tabs/home_tab.dart';


class  TelaInicial extends StatelessWidget {

  final _pageController =  PageController();

  @override
  Widget build(BuildContext context) {

    return PageView(
       controller: _pageController,
      physics: : NeverScrollableScrollPhysics(),
    children: <Widget>[
      HomeTab()
    ],


    )






  }
















}
