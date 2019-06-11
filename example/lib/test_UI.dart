import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();
  GlobalKey _four = GlobalKey();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCase.startShowCase(context, [_two, _one, _three, _four]));

    return Scaffold(
      appBar: AppBar(
        title: TargetWidget(
          key: _one,
          title: "Title",
          description: "Hey There! I am title of the screen.",
          child: Text('Showcase Animation'),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              // Align(
              //   alignment: Alignment(-0.5, -0.3),
              //   child: TargetWidget(
              //     title: 'Sample Text',
              //     description: 'This is Sample Text',
              //     key: _five,
              //     container: Text(
              //       'Helloooow',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 30,
              //       ),
              //     ),
              //     child: Text(
              //       'Text',
              //       style: TextStyle(fontSize: 50),
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment(0.5, 0.6),
                child: TargetWidget.withWidget(
                  cHeight: 200,
                  cWidht: 200,
                  key: _two,
                  container: Text(
                    'Helloooow',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  // title: 'Title',
                  // description: 'Desc',
                  child: Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TargetWidget(
                    overlayColor: Colors.black,
                    key: _four,
                    shapeBorder: CircleBorder(),
                    title: 'Title',
                    description: 'Temp Fab',
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.add),
                    )),
              ),
            ],
          )),
      floatingActionButton: TargetWidget(
        key: _three,
        title: "Tap Me!",
        description: "Tap me and counter will increase.",
        shapeBorder: CircleBorder(),
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}