import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_to_do_list/app/cores/utils/extenstion.dart';
import 'package:getx_to_do_list/app/modules/home/controller.dart';

class DoingList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DoingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeCtrl.doingTodos.isEmpty && homeCtrl.doneTodos.isEmpty
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0.wp),
            child: Column(
              children: [
                SizedBox(
                  height: 30.0.wp,
                  width: 30.0.wp,
                  child: Image.asset(
                    'assets/images/task.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Add task',
                  style:
                      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        : ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              ...homeCtrl.doingTodos
                  .map((element) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0.wp, horizontal: 9.0.wp),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.grey),
                                value: element['done'],
                                onChanged: (value) {
                                  homeCtrl.doneTodo(element['title']);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                              child: Text(element['title']),
                            )
                          ],
                        ),
                      ))
                  .toList(),
              if (homeCtrl.doingTodos.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: const Divider(
                    thickness: 2,
                  ),
                )
            ],
          ));
  }
}
