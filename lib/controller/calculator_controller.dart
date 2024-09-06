
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController{
  RxString equation='0'.obs;
  RxString result='0'.obs;
  RxString expression=''.obs;

  buttonPressed(btnText){
    if(btnText=='AC'){
      equation.value='';
      result.value='';

    }else if(btnText=='⌫'){
      equation.value=equation.substring(0,equation.value.length-1);

    }else if(btnText=='='){
      expression.value =equation.value;
      expression.value=expression.replaceAll('×', '*');
      expression.value=expression.replaceAll('÷', '/');
      // expression=expression.replaceAll('×', '*');
      try{
        Parser p=Parser();
        Expression exp=p.parse(expression.value);
        ContextModel cm=ContextModel();
        result.value='${exp.evaluate(EvaluationType.REAL, cm)}';
      }catch(e){
        if (kDebugMode) {
          print('error: ${e.toString()}');
        }
      }
    } else{
      equation.value =equation+btnText;
    }
  }

}