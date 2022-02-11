import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static var screenHeight;
  static var screenWidth;
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    final acceptButton = OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            minimumSize: Size(screenHeight*0.4, 40.0),
            side: BorderSide(width: 1, color: Colors.black87),
          ),
          onPressed: () {},
          child: Text(
            "Accept",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w600, fontFamily: "Bitter"),
          ),
    );

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      //   title: Text('Home Screen',
      //     textAlign: TextAlign.end,
      //     style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 25),
      //   ),
      // ),
      body: Container(
          width: screenWidth,
          height: screenHeight * 0.27,
          margin: EdgeInsets.fromLTRB(25, 15, 25, 15),
          padding: EdgeInsets.fromLTRB(15, 8, 15, 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black87),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Patient Name: Shishir Kandel  ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Location:   Gulariya" ,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Contact Number:   9874569789" ,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        Text(
                          "Needed Time:  2020/20/24 ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),


                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                acceptButton
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 28.0,
                width: 55.0,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'b+',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
