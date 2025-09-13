import 'package:flutter/material.dart';

import '../../core/constant/colors.dart';

class SetsPanel extends StatelessWidget {
  final VoidCallback onToggleComplete;

  const SetsPanel({super.key, required this.onToggleComplete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             const Text(
            "Sets",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Container(
            width: 97,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(24),
              
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add,color: Colors.black,size: 18,),
                SizedBox(width: 2,),
                Text("Add set",style: TextStyle(color: Colors.black,fontSize: 14),
            )
              ],
            ),
          )
          ],

         ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(flex: 1, child: Center(child: Text("#", style: TextStyle(fontWeight: FontWeight.w600)))),
              Expanded(flex: 2, child: Center(child: Text("Kg", style: TextStyle(fontWeight: FontWeight.w600)))),
              Expanded(flex: 2, child: Center(child: Text("Reps", style: TextStyle(fontWeight: FontWeight.w600)))),
              Expanded(flex: 2, child: Center(child: Text("10RM", style: TextStyle(fontWeight: FontWeight.w600)))),
              Expanded(flex: 1, child: SizedBox()),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children: List.generate(2, (idx) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: idx == 0 ? const Color(0xFFFFFADC) : Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(child: Text("${idx + 1}")),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: idx == 0 ?Color(0xffF7F1C6): Color(0xffF3F2F7),
                              border: Border.all(color:idx == 0 ?Color(0xffF7F1C6): Color(0xffF3F2F7),),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: Center(child: Text(idx == 0 ? "25" : "25")),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: idx == 0 ?Color(0xffF7F1C6): Color(0xffF3F2F7),
                              border: Border.all(color: idx == 0 ?Color(0xffF7F1C6): Color(0xffF3F2F7),),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: Center(child: Text(idx == 0 ? "12" : "19")),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              // border: Border.all(color: idx == 0 ?Color(0xffF7F1C6): Color(0xffF3F2F7),),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: Center(child: Text(idx == 0 ? "27.5" : "27.5")),
                          ),
                        ),
                        CircleAvatar(
                    radius:  12,
                    backgroundColor:idx == 0? AppColors.yellow :Colors.white,
                    child:
                     idx == 0  ? const Icon(Icons.check, color: Colors.black, size: 14):Icon(Icons.radio_button_off,color: Color(0xffF3F2F7),),
                  )
                        // Expanded(
                        //   flex: 1,
                        //   child: IconButton(
                        //     onPressed: onToggleComplete,
                        //     icon: Icon(
                        //       idx == 0 ? Icons.check_circle : Icons.check_circle_outline,
                        //       color: idx == 0 ? Colors.green : Colors.grey,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  if (idx == 0)
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                ],
              );
            }),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 18),
              label: const Text("Add Set"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[100],
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}