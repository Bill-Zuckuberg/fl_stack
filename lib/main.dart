import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stack',
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _stackState();
}

class _stackState extends State<MyApp> {
  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: _alignmentDirectional,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.red,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            )
          ],
        ),
      ),
      bottomNavigationBar: _getBottomBar(),
    );
  }

  Widget _getBottomBar() {
    const kAlignmentDicrectionalVals = <String, AlignmentDirectional>{
      'topStart': AlignmentDirectional.topStart,
      'topCenter': AlignmentDirectional.topCenter,
      'topEnd': AlignmentDirectional.topEnd,
      'centerStart': AlignmentDirectional.centerStart,
      'center': AlignmentDirectional.center,
      'centerEnd': AlignmentDirectional.centerEnd,
      'bottomStart': AlignmentDirectional.bottomStart,
      'bottomCenter': AlignmentDirectional.bottomCenter,
      'bottomEnd': AlignmentDirectional.bottomEnd,
    };

    return Material(
      color: Colors.lightBlue,
      child: ListTile(
        title: const Text("AlignmentDirectional: "),
        trailing: DropdownButton<AlignmentDirectional>(
          value: _alignmentDirectional,
          onChanged: (AlignmentDirectional? newVal) {
            if (newVal != null) {
              setState(() {
                _alignmentDirectional = newVal;
              });
            }
          },
          items: kAlignmentDicrectionalVals
              .map((String? key, AlignmentDirectional? value) => MapEntry(
                  key,
                  DropdownMenuItem(
                    child: Text(key.toString()),
                    value: value,
                  )))
              .values
              .toList(),
        ),
      ),
    );
  }
}
