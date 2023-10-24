import 'dart:ffi';

import 'package:finance_app/data/listdata.dart';
import 'package:finance_app/data/top.dart';
import 'package:finance_app/widgets/chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  int index_color = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Statistics',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        4,
                            (index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                index_color = index;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                color: index_color == index ? Color.fromARGB(255, 47, 125, 121) : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                day[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Expenses', style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),
                              Icon(Icons.arrow_downward_sharp,size: 20, color: Colors.grey,)

                            ],
                          ),
                          decoration: BoxDecoration(
                            border:Border.all(
                              color: Colors.grey,width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Charts(),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Top Spending',style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),
                        Icon(Icons.swap_vert,size: 25,color: Colors.green,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                leading: Image.asset('images/${geter_top()[index].image!}',
                  height: 40),
                title: Text(
                  geter_top()[index].name!,

                ),subtitle:
              Text(
                geter_top()[index].time!, style: TextStyle(
                fontWeight: FontWeight.w600,

              ),

              ),
              trailing: Text(
                geter_top()[index].fee!, style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                  color: Colors.red
              ),
              ),


              );

            },
            childCount: geter_top().length))
          ],
        ),
      ),
    );
  }
}
