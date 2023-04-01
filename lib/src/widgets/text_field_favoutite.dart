
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFavorite;
  final DateTime date;

  const MyListTile({Key? key, 
    required this.title,
    required this.subtitle,
    required this.isFavorite,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // title: Text(title),
      leading: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: fontSize14, fontWeight: fontWeightBold),),
        Text(subtitle, style: const TextStyle(fontSize:fontSize13),),
        Row(
          children: [
            const Icon(Icons.calendar_today_outlined, size: 8,),
            Text('${date.day}/${date.month}/${date.year}',
            style: const TextStyle(fontSize: 8),)
          ],
        ), 
      ],),
      // title: Text(title),
      // subtitle: Text(subtitle),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            icon: isFavorite
                ? const Icon(Icons.favorite, color: Colors.red,)
                : const Icon(Icons.favorite_border),
            onPressed: () {
              
            },
          ),
        ],
      ),
    );
  }
}
