import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/model/user_model.dart';
import 'package:email_password_login/screens/login_screen.dart';
import 'package:email_password_login/screens/profile/components/edit_profilePic.dart';
import 'package:email_password_login/screens/profile/components/myProfileDivider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
  @override
  Widget build(BuildContext context) {
    final editProfileButton = Material(
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            minimumSize: Size(150.0, 40.0),
            side: BorderSide(width: 1, color: Colors.red),
          ),
          onPressed: () {},
        child: Text(
          "Edit Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, color: Colors.red, fontWeight: FontWeight.w600, fontFamily: "Bitter"),
        )),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Theme(
        data: MyProfileDivider.theme(context),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 1),
          child: Column(
            children: [
              EditProfilePic(),
              SizedBox(height: 12),
              editProfileButton,
              SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        "Full Name",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${loggedInUser.firstName} ${loggedInUser.secondName}",
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(25, 25, 25, 0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 24),
                      Text(
                        "Email address",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${loggedInUser.email}",
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(25, 25, 25, 0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 24),
                      Text(
                        "Gender",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Female",
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(25, 25, 25, 0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 24),
                      Text(
                        "Age",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "20",
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(25, 25, 25, 0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 24),
                      Text(
                        "Blood Type",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "B+",
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(25, 25, 25, 0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 24),
                      Text(
                        "Contact Number",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "9845612478",
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(25, 25, 25, 0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(),
                    ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}