import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/ui/home/home_screen/cubit/home_states.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/favorite_tab/favorite_tab.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/home_tab/home_tab.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/product_list_tab/product_list_tab.dart';
import 'package:flutter_app_e_commerece_online/ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeInitialState());
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];
  void changeBottomNavIndex(int newSelectedIndex){
    HomeInitialState();
    selectedIndex = newSelectedIndex ;
    emit(HomeChangeBottomNavBar());
  }
}