import 'package:camping_app/classes/recmdation.dart';
import 'package:flutter/material.dart';
import '../classes/camps.dart'; // Make sure this import is correct

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<camps> ls = camps.getcamps();
  List<recomdation> rc=recomdation.getrec();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 370,
                width: double.infinity,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/camping.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      const Text(
                        'Hello, Orely',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 140,),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16.0,
                        ),
                        child: SearchBar(
                          hintText: 'Search Camp',
                          leading: const Icon(Icons.search),
                          trailing: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.filter_list),
                            ),
                          ],
                          elevation: MaterialStateProperty.all(1.0),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 320,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height-320,
                  decoration: const BoxDecoration(
                    color: Color(0xfffffff8),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                      child:
                      SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: Color.fromARGB(255, 191, 204, 142),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Container(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nearby Camp',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Turn on your location service',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        SizedBox(height: 4),
                                        FilledButton.icon(
                                          onPressed: () {},
                                          icon: Icon(Icons.location_on),
                                          label: Text('Turn on location'),
                                          style: FilledButton.styleFrom(
                                            backgroundColor: Color(0xFF3E501F),
                                            foregroundColor: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.all(8),
                                height: 120,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: ls.length,
                                  separatorBuilder: (context, index) => SizedBox(width: 35),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(ls[index].path),
                                        ),
                                        SizedBox(height: 9),
                                        Text(
                                          ls[index].name,
                                          style: TextStyle(fontSize: 12.5,fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8,bottom: 15,top: 10),
                                child: Text('Recommandation',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                ),),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: rc.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: Colors.white,
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(rc[index].path),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                      child: Text(rc[index].day,style: TextStyle(
                                                        fontSize: 15
                                                      ),),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff89AC46).withOpacity(0.7),
                                                  ),
                                                  padding: EdgeInsets.all(5),),
                                                  Text(rc[index].month,style: TextStyle(
                                                    fontSize: 12
                                                  ),),
                                                ],
                                              ),
                                              SizedBox(width: 20),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(rc[index].title,style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold
                                                  ),),
                                                  Text(rc[index].location,style: TextStyle(
                                                    color: Colors.grey
                                                  ),),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(height: 10),
                              ),
                            ],
                          ),

                      )

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        destinations:  [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.photo_album_outlined),
            label: 'Gallery',
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            shape: CircleBorder(),
            backgroundColor: Color(0xFF667E32),
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        onPressed: (){},
        backgroundColor: Colors.black,
      label: Row(
        children: [
          Text('Map',style: TextStyle(
            color: Colors.white
          ),),
          SizedBox(width: 6,),
          Icon(Icons.map,color: Colors.white,)
        ],
      ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
