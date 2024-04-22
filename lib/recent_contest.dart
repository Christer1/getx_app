import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentContest extends StatefulWidget {
  const RecentContest({super.key});

  @override
  State<RecentContest> createState() => _RecentContestState();
}

class _RecentContestState extends State<RecentContest> {

  List info = [];

  _readData() async { 


    await DefaultAssetBundle.of(context).loadString("json/detail.json").then((i){
      setState(() {
        info = json.decode(i);
      });
    });
  }

@override
  void initState(){
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFcbe6f6),
        leading: IconButton(
          onPressed: (){
            Get.back();
        }, 
        icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Color(0xFFcbe6f6),
      body: Container(
        margin: const EdgeInsets.only(left:20, top: 10, right: 10),
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  
                  for(int i=0; i < info.length; i++)
                  Container(
                    height: 235,
                    margin: const EdgeInsets.only(bottom: 30),
                    child:GestureDetector(

                            onTap: () {
                              Get.toNamed('/detail/',
                              arguments: {
                                'title': info[i]['title'],
                                'text': info[i]['text'],
                                'name': info[i]['name'],
                                'img': info[i]['img'],
                                'time': info[i]['time'],
                                'prize': info[i]['prize'],
                              }
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              // height: 235,
                              width: MediaQuery.of(context).size.width-20,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  // color: Colors.red,
                                  color:i.isEven?Color(0xFF69c5df):Color(0xFF9294cc)
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    // height: 2,
                                      child:Row(
                                        children: [
                                          Text(
                                            info[i]['title'],
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500,
                                              color:Colors.white
                                            ),
                                          ),
                                          Expanded(child: Container())
                                        ],
                                      )
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      info[i]['text'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:Color(0xFFb8eefc)
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Divider(thickness: 1.0,),
                                  Row(
                                      children:[for(int i=0; i<4; i++)
                                        Container(

                                          width: 50,
                                          height: 50,
                                          child: Container(

                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        info[i]['img'],
                                                    ),
                                                    fit: BoxFit.cover
                                                )
                                            ),
                                          ),
                                        )
                                      ]



                                  ),
                                ],
                              ),
                            ),
                          )
                  ),

                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}