import 'package:flutter/cupertino.dart';

import '../../../../data/local/dummy/mood_store.dart';
import 'mood_card.dart';

class MoodGrid extends StatelessWidget {
  const MoodGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return     SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 16,horizontal: 12),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final moodCategory = MoodStore.moods[index];

            return MoodCard(
              key: ValueKey(moodCategory.name),
              moodCategory: moodCategory,
            );
          },
          childCount: MoodStore.moods.length,
        ),

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,

            crossAxisSpacing: 4,
            mainAxisSpacing: 12,
            mainAxisExtent: 125

        ),
      ),
    );
  }
}
