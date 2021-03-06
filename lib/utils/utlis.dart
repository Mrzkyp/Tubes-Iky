import 'package:flutter/foundation.dart';

String? uValidator({
  required String value,
  bool isEmail = false,
  bool isRequired = false,
  int? minLength,
  String? match,
  }){

  if(isRequired){
    if(value.isEmpty){
      return 'required';
    }
  }

  if (isEmail){
    if(!value.contains('@')|| !value.contains('.')){
      return 'Invalid Email';
    }
  }

  if(minLength != null){
    if(value.length < minLength){
      return 'Min $minLength character';
    }
  }
  
  if(match != null){
    if(value != match){
      return 'Not Match';
    }
  }
return null;
}



