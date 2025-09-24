import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget that will be started on the application startup
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  //set counter value
  int _counter = 0;

  Color _getTextColor() {
    if (_counter == 0) {
      return Colors.red;
    } else if (_counter > 50) {
      return Colors.green;
    } else {
      return Colors.orange; // For values between 1 and 50
    }
  }

  void _incrementCounter() {
    setState((){
      if(_counter < 100){
        _counter++;
        
      }
    });
  }

  void _decrementCounter(){
    setState(() {
      if(_counter > 0){
        _counter--;
      }
    });
  }

  void _resetCounter(){
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display counter or LIFTOFF message
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: _counter == 100
                  ? Column(
                      children: [
                        Text(
                          'LIFTOFF! 🚀',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          '$_counter',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: _getTextColor(),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      '$_counter',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: _getTextColor(),
                      ),
                    ),
            ),
          ),
          
          SizedBox(height: 30),
          
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Ignite Button
              ElevatedButton(
                onPressed: _incrementCounter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, 
                  foregroundColor: Colors.white, 
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)),

                child: Text(
                  'Ignite', 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ),
                //Abort Button
                ElevatedButton(
                  onPressed: _decrementCounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, 
                    foregroundColor: Colors.white, 
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  child: Text(
                    'Abort',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                  ),
                  //Reset Button
                  ElevatedButton(
                    onPressed: _resetCounter, 
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: Text('Reset', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                  ),
          ],    
          )
        ],
      ),
    );
  }
}
