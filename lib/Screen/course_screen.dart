import 'package:education_app/widgets/description_section.dart';
import 'package:education_app/widgets/video_section.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  String imglist;
  CourseScreen(this.imglist);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
        bool isVideoSection=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.imglist,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              size: 28,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF5F3FF),
                  image: DecorationImage(
                    image: AssetImage("assets/${widget.imglist}.png"),
                  )),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 35,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "${widget.imglist} Complete Course",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Created by Dear Programmer",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "55 videos",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
              const SizedBox(
                 height: 20,
              ),
              Container(
                 padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                 decoration: BoxDecoration(
                   color: const Color(0xFFF5F3FF),
                    borderRadius: BorderRadius.circular(10),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                        Material(
                          //if isVideoSection is true then other color and else another color
                          // will be on button and if condtion is false then the color will  be
                          // shown on button but with some opacity
                            color: isVideoSection ? Color(0xFF674AFF) :Color(0xFF674AFF).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: (){
                              //change value of isvideosSection
                               setState(() {
                                 isVideoSection=true;
                               });
                            },
                            child: Container(
                               padding:  EdgeInsets.symmetric(
                                 vertical: 15,
                                  horizontal: 35,
                               ),
                               child: const Text(
                                  "Videos ",
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                 ),
                               ),
                            ),
                          ),
                        ),
                       Material(
                         color: isVideoSection ? Color(0xFF674AFF).withOpacity(0.6) :Color(0xFF674AFF),
                         borderRadius: BorderRadius.circular(10),
                         child: InkWell(
                           onTap: (){
                            setState(() {
                              isVideoSection=false;
                            });
                           },
                           child: Container(
                             padding: const EdgeInsets.symmetric(
                               vertical: 15,
                               horizontal: 35,
                             ),
                             child: const Text(
                               "Description",
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 20,
                                 fontWeight: FontWeight.w500,
                               ),
                             ),
                           ),
                         ),
                       ),
                     ],
                 ),
              ),
               SizedBox(
                  height: 10,
               ),
            isVideoSection ?  VideoSection() : Description(),
          ],
        ),
      ),
    );
  }
}
