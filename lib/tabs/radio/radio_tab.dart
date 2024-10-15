import 'package:assignment2/app_theme.dart';
import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.15,
        horizontal: MediaQuery.sizeOf(context).height * 0.05,
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/image/radio_image.png',
            height: MediaQuery.sizeOf(context).height * 0.25,
            width: MediaQuery.sizeOf(context).height * 0.5,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'اذاعة القران الكريم',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous, color: AppTheme.lightPrimary),
                onPressed: () {},
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  color: AppTheme.lightPrimary,
                  size: 40.0,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_next,
                    color: AppTheme.lightPrimary,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
