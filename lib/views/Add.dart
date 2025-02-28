import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addch extends StatefulWidget {
  const Addch({super.key});

  @override
  State<Addch> createState() => _AddchState();
}

class _AddchState extends State<Addch> {
  String childimg='assets/images/camping.jpg';
  PickedFile? pickedFile;
  ImagePicker imagePicker=ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Container(
            padding: EdgeInsets.all(20),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white10,
                  ),
          child: Column(children: [
            Row(children: [
              Material(
                elevation: 2,
                shape: CircleBorder(),
                child: CircleAvatar(
                    radius:24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.keyboard_arrow_left,size: 30,)),
              ),

              SizedBox(width:MediaQuery.of(context).size.width/3-65 ,),
              Center(
                child: Text('Child Registration',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),),
              )
            ],),
            SizedBox(height: 35,),
            Stack(
              children: [
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                      context:context,
                      builder:((builder)=>Bottomsheet())
                    );
                  },
                  child: Center(child: CircleAvatar(
                    radius:60,
                    backgroundImage: AssetImage(childimg),
                  ),),
                ),
                Positioned(
                    top: 78,
                    left: 205,
                    child: CircleAvatar(
                      radius: 21,
                        backgroundColor: Color(0xff677E32),
                        child: Icon(Icons.camera_alt_outlined,color: Colors.white,))),
              ],
            )
          ],),)


      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20,15,20,15),
        child: Row(
          children: [
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Color(0xff677E32),
                ),
                onPressed: () {},
                child: Padding(

                    padding:EdgeInsets.only(top: 15,bottom: 15),
                    child: Text('Reserve a spot')),
              ),
            ),
            SizedBox(width: 10,),
            FloatingActionButton(
              backgroundColor: Colors.white,
              shape: CircleBorder(),
              onPressed: () {},
              child: Icon(Icons.calendar_today_outlined),
            ),
          ],
        ),
      ),

    );
  }
  Widget Bottomsheet(){
    return Container(
      padding: EdgeInsets.all(15),
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Center(child: Text('Choose Profile Photo',style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18
          ),),),
          SizedBox(height: 10,),
          Row(children: [
            GestureDetector(
              onTap: (){

              },
              child: Row(
                children: [
                  Icon(Icons.camera),
                  SizedBox(width: 2,),
                  Text('Camera')
                ],
              ),
            ),
            SizedBox(width: 20,),
            GestureDetector(
              onTap: (){},
              child: Row(
                children: [
                  Icon(Icons.photo),
                  SizedBox(width: 2,),
                  Text('Gallery')
                ],
              ),
            )

          ],),
        ],
      ),
    );
  }
  void takePhoto(ImageSource img)async{
    pickedFile=(await imagePicker.pickImage(source: img)) as PickedFile?;
  }
}
