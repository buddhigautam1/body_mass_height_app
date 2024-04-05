

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  var wtControlller = TextEditingController();
  var ftControlller = TextEditingController();
  var inControlller = TextEditingController();

  var result = "";


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text('BMI'),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('my app',
              style: TextStyle(fontWeight: FontWeight.w600),),
              SizedBox(height: 11),
          
              TextField(
                controller: wtControlller,
                decoration: InputDecoration(
                  label: Text("Enter your Weight"),
                  prefixIcon: Icon(Icons.line_weight),
                ),
          
                keyboardType: TextInputType.number,
          
              ),
              SizedBox(height: 11),
              TextField(
                controller: ftControlller,
                decoration: InputDecoration(
                  label: Text("Enter your height(feet)"),
                  prefixIcon: Icon(Icons.height),
                ),
          
                keyboardType: TextInputType.number,
          
              ),
              SizedBox(height: 11),
              TextField(
                controller: inControlller,
                decoration: InputDecoration(
                  label: Text("Enter your height(inch)"),
                  prefixIcon: Icon(Icons.height),
                ),
          
                keyboardType: TextInputType.number,
          
              ),
              SizedBox(height: 11),

              ElevatedButton(onPressed: (){
                //variable declare
                var wt = wtControlller.text.toString();
                var ft = ftControlller.text.toString();
                var inch = inControlller.text.toString();

                if(wt != "" && ft != "" && inch != ""){
                  //bmi calculation
                  var iwt = int.parse(wt);
                  var ift = int.parse(ft);
                  var iinch = int.parse(inch);

                  var totalInch = (ift*12) +iinch;
                  var totalCm = totalInch*2.54;
                  var totalMeter = totalCm/100;
                  var bmi = iwt/(totalMeter*totalMeter);
                 setState(() {
                    result ="your bmi is : $bmi";
                 });
                }
                else{
                  setState(() {
                    result = "please fill all required blanks!!";
                  });

                }

              }, 
              child:Text('Calculate')),

              SizedBox(height: 11,),

              Text(result, style: TextStyle(fontSize: 15),)
            ],
          ),
        ),
      )
    );
  }
}
