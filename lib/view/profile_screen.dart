import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              //header
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.person_add_alt_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.grey.shade300,
                                  size: 14,
                                ),
                                Text(
                                  'Add name',
                                  style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //body
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.4,
                // decoration: BoxDecoration(color: Colors.grey),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [

                              //avatar
                              Positioned(
                                child: CircleAvatar(
                                  radius: 40,
                                  child: Icon(Icons.person, size: 60,),
                                ),
                              ),

                              //icon add post
                              Positioned(child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Column(
                                  children: const [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 26,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Add',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              ),),
                            ],
                          ),
                        ),

                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.cyan,
                                        Colors.cyanAccent,
                                      ],
                                    ),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.black, width: 2)),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                )))
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('Username', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16

                    ),),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80, right: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('0', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16

                              ),),
                              Text('Following', style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12
                              ),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('0', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16

                              ),),
                              Text('Follower', style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12
                              ),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('0', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16

                              ),),
                              Text('Like', style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(3)),
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  'Set up profile',
                                  style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(3)),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(Icons.arrow_drop_down, color: Colors.white,)
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
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
