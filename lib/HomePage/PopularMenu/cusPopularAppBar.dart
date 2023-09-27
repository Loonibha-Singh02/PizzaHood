import 'package:flutter/material.dart';

class Custom_desp extends StatelessWidget {
  final ImageProvider<Object> ImagePath;

  const Custom_desp({
    super.key,
    required this.ImagePath,
  });
  @override
  Widget build(BuildContext context) {
    return  Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image:ImagePath,
    fit: BoxFit.cover,
    ),
    ),
     child: Column(
       children: [
         AppBar(
           backgroundColor: Colors.transparent,
            elevation: 0 ,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
           actions: [
             IconButton(
               icon: Icon(Icons.favorite_border),
               onPressed: () {
                 Navigator.of(context).pop();
               },
             ),
           ],
    ),
       ],
     )
     );
  }
}
