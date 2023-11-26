import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title, subtitle;

  const TopTitles({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kToolbarHeight + 12,
        ),
        if(title=='Login'||title=='Create Account')
          GestureDetector(onTap: () {
            Navigator.of(context).pop();
          }, child: const Icon(Icons.arrow_back_ios)),
        const SizedBox(height: 12,),
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(
          height: 12,
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
