import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoppiez/data/local/dummy/mood_store.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/burger_card.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/decorated_divider.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/home_app_bar.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/mood_card.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/mood_grid.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          const BurgerCard(),
          const DecoratedDivider(title: "WHAT'S YOUR MOOD?"),
          const MoodGrid(),
          const DecoratedDivider(title: "RECOMMENDED"),


        ],
      ),
    );
  }
}
