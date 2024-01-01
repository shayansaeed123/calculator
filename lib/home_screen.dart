import 'package:calculator/components/button.dart';
import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text(userInput.toString(), style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 10,),
                    Text(answer.toString(), style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      MyButton(myColor: Colors.grey, title: "AC", press: (){
                        userInput = '';
                        answer = '';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.grey, title: "+/-", press: (){
                        // userInput += '+/-';
                        // setState(() {
                        //
                        // });
                      }),
                      MyButton(myColor: Colors.grey, title: "%", press: (){
                        userInput += '%';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.indigo, title: "/", press: (){
                        userInput += '/';
                        setState(() {

                        });
                      }),
                    ],
                  ),
                  SizedBox(height: dPadding,),
                  Row(
                    children: [
                      MyButton(myColor: Colors.grey, title: "7", press: (){
                        userInput += '7';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.grey, title: "8", press: (){
                        userInput += '8';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.grey, title: "9", press: (){
                        userInput += '9';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.indigo, title: "x", press: (){
                        userInput += 'x';
                        setState(() {

                        });
                      }),
                    ],
                  ),
                  SizedBox(height: dPadding,),
                  Row(
                    children: [
                      MyButton(myColor: Colors.grey, title: "4", press: (){
                        userInput += '4';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.grey, title: "5", press: (){
                        userInput += '5';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.grey, title: "6", press: (){
                        userInput += '6';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.indigo, title: "-", press: (){
                        userInput += '-';
                        setState(() {

                        });
                      }),
                    ],
                  ),
                  SizedBox(height: dPadding,),
                  Row(
                    children: [
                      MyButton(myColor: Colors.grey, title: "1", press: (){
                        userInput += '1';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.grey, title: "2", press: (){
                        userInput += '2';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.grey, title: "3", press: (){
                        userInput += '3';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.indigo, title: "+", press: (){
                        userInput += '+';
                        setState(() {

                        });
                      }),
                    ],
                  ),
                  SizedBox(height: dPadding,),
                  Row(
                    children: [
                      MyButton(myColor: Colors.grey, title: "0", press: (){
                        userInput += '0';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.grey, title: ".", press: (){
                        userInput += '.';
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.grey, title: "DEL", press: (){
                        userInput = userInput.substring(0, userInput.length - 1);
                        setState(() {

                        });
                      }),
                      MyButton(myColor: Colors.indigo, title: "=", press: (){
                        equalPress();
                        setState(() {

                        });
                      }),
                    ],
                  ),
                  SizedBox(height: dPadding/2,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void equalPress(){
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();

  }
}
