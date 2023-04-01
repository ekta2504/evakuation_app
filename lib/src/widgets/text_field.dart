import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String title;

  const CustomListTile({Key? key, required this.title}) : super(key: key);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool _isTapped = false;
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
      },
        child: Container(
          decoration: BoxDecoration(color: _isTapped ? Colors.black : Colors.white,),
          child: ListTile(
            title: Text(
                widget.title,
                style:  TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: _isDone ? Colors.white :Colors.black,
                ),
              ),
            
            trailing: IconButton(
              icon: Icon(
                _isDone ? Icons.done : Icons.done,
                color: _isDone ? Colors.white : Colors.transparent,
              ),
              onPressed: () {
                setState(() {
                  _isDone = !_isDone;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
} 





























// import 'package:flutter/material.dart';
// class CustomTile extends StatefulWidget {
//   const CustomTile({Key? key}) : super(key: key);

//   @override
//   State<CustomTile> createState() => _CustomTileState();
// }

// class _CustomTileState extends State<CustomTile> {
//   Color ?color;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     color= Colors.transparent;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(itemCount: 3,itemBuilder: (_,ctx){
//         return SingleChildScrollView(
//           child: Container(
//             color: color,
//             child: ListTile(
//                title:  const Text('title '),
//                onTap: (){
//                 setState(() {
//                   color=Colors.black;
//                 });
//                },
//             ),
//           ),
//         );
//     });
//     // Container(
//     //   color: color,
//     //   child: ListTile(title: const Text('title', style: TextStyle(color: Colors.white),),
//     //   onTap:(){
//     //     setState(() {
//     //       color = Colors.black;
//     //     });
//     //   }
//     //   ),
//     // );
//   }
// }