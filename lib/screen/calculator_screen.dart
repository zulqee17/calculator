import 'dart:ffi';

import 'package:calculator/colors/colors.dart';
import 'package:calculator/controller/calculator_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  final controller=Get.put(CalculatorController());


  Widget buttons(String txtBtn,var btnWidth, Color btnColor,Color txtColor){
    return GestureDetector(
      onTap: (){
        controller.buttonPressed(txtBtn);
      },
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: btnWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: btnColor
        ),
        child: Text(txtBtn,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: txtColor),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build from top');
    return Scaffold(
      backgroundColor: Colours().backgroundColor,
      appBar: AppBar(
        backgroundColor: Colours().backgroundColor,
        foregroundColor: Colours().foregroundColor,
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Obx((){
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerRight,
                  height: 70,
                  width: MediaQuery.of(context).size.width*1,
                  decoration: BoxDecoration(
                      color: Colours().backgroundColor
                  ),
                  child:  Text(controller.equation.value.toString(),style: TextStyle(fontSize: 40,color:Colours().foregroundColor),),
                ),
              );
            }),
            SizedBox(
              height: 5,
            ),
            Obx((){
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerRight,
                  height: 70,
                  width: MediaQuery.of(context).size.width*1,
                  decoration: BoxDecoration(
                    color: Colours().backgroundColor,
                  ),
                  child:  Text(controller.result.value,style: TextStyle(fontSize: 45,color:Colours().foregroundColor ),),
                ),
              );
            }),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttons('AC', 173.0, Colours().operationButtonColor, Colours().foregroundColor),
                    buttons('⌫', 80.0, Colours().clearAndDivideButtonColor, Colours().foregroundColor),
                    buttons('÷', 80.0, Colours().operationButtonColor, Colours().foregroundColor),
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttons('7', 80.0, Colours().numberButtonColor, Colours().foregroundColor),
                    buttons('8', 80.0, Colours().numberButtonColor, Colours().foregroundColor),
                    buttons('9', 80.0, Colours().numberButtonColor, Colours().foregroundColor),
                    buttons('×', 80.0, Colours().operationButtonColor, Colours().foregroundColor),
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttons('4', 80.0, Colours().numberButtonColor, Colours().foregroundColor),
                    buttons('5', 80.0, Colours().numberButtonColor, Colours().foregroundColor),
                    buttons('6', 80.0, Colours().numberButtonColor, Colours().foregroundColor),
                    buttons('-', 80.0, Colours().operationButtonColor, Colours().foregroundColor),
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttons('1', 80.0, Colours().numberButtonColor, Colours().foregroundColor),
                    buttons('2', 80.0, Colours().numberButtonColor, Colours().foregroundColor),
                    buttons('3', 80.0, Colours().numberButtonColor, Colours().foregroundColor),
                    buttons('+', 80.0, Colours().operationButtonColor, Colours().foregroundColor),
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttons('0', 255.0, Colours().numberButtonColor, Colours().foregroundColor),
                    buttons('=', 80.0, Colours().operationButtonColor, Colours().foregroundColor),

                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
