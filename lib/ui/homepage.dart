import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_x_practise/ui/utility/cutom_circular_progress_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_view_controller.dart';

class HomeView extends StatefulWidget {

   HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {

  HomeViewController homeViewcontroller = Get.put(HomeViewController());


  @override
  void initState() {
    homeViewcontroller.getRestData();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Home',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 17.0,
            ),
          ),
        ),
      ),


      body:  GetBuilder<HomeViewController>(
          // init: ProductController(),

          builder: (context) {

            if(homeViewcontroller.showIndicator)
            {
              return CustomCircularProgressIndicator();
            }
            else if(homeViewcontroller.error == null && homeViewcontroller.list.length >0 )
            {
              return  ListView.builder(
                shrinkWrap: true,
                itemCount: homeViewcontroller.list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                     leading: Text(
                      index.toString(),
                       style: GoogleFonts.poppins(
                         textStyle: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.w400,
                           fontSize: 17.0,
                         ),
                       ),
                     ),
                    title: Text(
                      homeViewcontroller.list[index].title.toString() ?? "Fake",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            else
            {
              print("why i ama here");
              return ErrorView(
                errorText: homeViewcontroller.error,
              );
            }
          }),



    );
  }
}
