import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/home/tag_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 88,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: TagButton(text: '北部地區', isSelected: true),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: TagButton(text: '中部地區', isSelected: false),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: TagButton(text: '中部地區', isSelected: false),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: TagButton(text: '中部地區', isSelected: false),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: TagButton(text: '中部地區', isSelected: false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
