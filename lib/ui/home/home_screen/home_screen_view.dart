import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/ui/home/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter_app_e_commerece_online/ui/home/home_screen/cubit/home_states.dart';
import 'package:flutter_app_e_commerece_online/ui/home/home_screen/widget/custom_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatelessWidget {
  static const String routeName = 'home';
  HomeScreenViewModel viewModel = HomeScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: buildCustomBottomNavigationBar(
            context: context,
            selectedIndex: viewModel.selectedIndex,
            onTapFunction: (index) {
              viewModel.changeBottomNavIndex(index);
            },
          ),
          body: viewModel.tabs[viewModel.selectedIndex],
        );
      },
    );
  }
}
