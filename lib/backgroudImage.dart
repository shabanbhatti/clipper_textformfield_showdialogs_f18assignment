import 'package:flutter/material.dart';

Widget backgroundImage({required var src,required BuildContext context}){
  var mqSize= MediaQuery.of(context).size;
  return   SizedBox(
              height: mqSize.height,
              width: mqSize.width,
              child: Image.network(
                src,
                fit: BoxFit.fill,
              ),
            );
}