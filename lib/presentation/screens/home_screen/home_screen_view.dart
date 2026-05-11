import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoppiez/data/local/dummy/mood_store.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/burger_card.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/decorated_divider.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/filter_row.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/home_app_bar.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/moods/mood_card.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/moods/mood_grid.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/restaurants_list.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/selectable_filter_card.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).scaffoldBackgroundColor, Colors.white],
            begin: AlignmentGeometry.topRight,
              end: AlignmentGeometry.bottomLeft,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            const HomeAppBar(),
            const BurgerCard(),
            const DecoratedDivider(title: "WHAT'S YOUR MOOD?"),
            const MoodGrid(),
            const DecoratedDivider(title: "RECOMMENDED"),
            const FilterRow(),
            const RestaurantsList(),
          ],
        ),
      ),
    );
  }
}
