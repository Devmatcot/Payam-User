 //
//dimension
import 'package:flutter/material.dart';


class NavigatorKey {
  static GlobalKey<NavigatorState> myKey = GlobalKey<NavigatorState>();
}
double screenHeight =
    MediaQuery.of(NavigatorKey.myKey.currentContext!).size.height;
double screenWidth =
    MediaQuery.of(NavigatorKey.myKey.currentContext!).size.width;


//heights
double height380 = screenHeight / 2.16;
double height20 = screenHeight / 34.15;
double height30 = screenHeight / 22.78;

double height17 = screenHeight / 40.2;

double height10 = screenHeight / 68.3;
double height5 = screenHeight / 164.2;
double height150 = screenHeight / 5.47;
double height140 = screenHeight / 4.88;

double height70 = screenHeight / 11.73;
double height180 = screenHeight / 4.56;
double height250 = screenHeight / 2.73;
double height280 = screenHeight / 2.93;
double width330 = screenWidth / 1.28;
double width170 = screenWidth / 2.42;
double height500 = screenHeight / 1.64;
double height350 = screenHeight / 2.35;

double height400 = screenHeight / 1.71;
double width75 = screenWidth / 5.8;
double width180 = screenWidth / 2.28;
double width2H = screenWidth / 1.8;

double width200 = screenWidth / 1.7;