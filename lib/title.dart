import 'package:flutter/material.dart';

Widget myTitle({required BuildContext context}){
  var mqSize= MediaQuery.of(context).size;

  return  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: mqSize.height * 0.1,
                            width: mqSize.width * 0.2,
                            child: Image.asset(
                              'assets/images/bluehead.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: mqSize.width * 0.02,
                        ),
                        const Flexible(
                          child: FittedBox(
                            child: Text(
                              '𝓗𝓮𝓪𝓭𝓼𝓮𝓽𝓼',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    );
}