import 'package:crud/model/Lop.dart';
import 'package:crud/temp/temp.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

 void main(List<String> args) {
   runApp(const LopPage());
} 

class LopPage extends StatefulWidget {
  const LopPage({super.key});

  @override
  State<LopPage> createState() => _LopPageState();
}

class _LopPageState extends State<LopPage> {
  TextEditingController maLop = TextEditingController();
  TextEditingController tenLop = TextEditingController();
  static var listLop = getListLop();
   DatabaseReference dataLop = FirebaseDatabase.instance.ref("Lop");
  String updatetenLop = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Danh sách lớp'),
        centerTitle: true,
        leading:const  Icon(Icons.menu),
        actions:const  [
           Icon(Icons.search),
        ],
       ),
       body: ListView(
        children: [
          // textfield id lop
          Container(
            margin: const EdgeInsets.only(top: 20,left: 30,right: 30),
            child: TextField(
              controller: maLop,
              decoration: InputDecoration(
                hintText: 'Nhập mã lớp',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
            ),
          ),
          // textfield ten lop
          Container(
            margin: const EdgeInsets.only(top: 10,left: 30,right: 30),
            child: TextField(
              controller: tenLop,
              decoration: InputDecoration(
                hintText: 'Nhập tên lớp',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
            ),
          ),


          DropdownButton<String>(
             items:  getListTenTruong().map((String value) {
             return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
              );
              }).toList(),
               onChanged: (_) {},
           ),

       


          // get List data Lop from readtime database
           Container(
            margin:const  EdgeInsets.only(bottom: 70,top: 10),
            child: FirebaseAnimatedList(
              shrinkWrap: true,
               query: dataLop,
               itemBuilder: (context ,snapshot,animation,index){
                   return Container(
                     margin: const EdgeInsets.only(top: 2,right: 30,left: 30),
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.amber[200],  
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.child('maLop').value.toString()),
                              Text(snapshot.child('tenLop').value.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const  Icon(Icons.edit),
                                onPressed: (){
                                   showDialog(
                                     context: context,
                                     builder: (context)=>SimpleDialog(
                                        children: [
                                          TextField(
                                             onChanged: (value) => 
                                             setState(() {
                                               updatetenLop = value;
                                             }),                                       
                                          ),
                                    
                                          ElevatedButton(
                                            onPressed: (){
                                              setState(() {
                      
                                                 ScaffoldMessenger.of(context).showSnackBar(
                                                 const SnackBar(content: Text('Cập nhập thành công'))                                                          
                                                 );
                                              });
                                               Navigator.of(context).pop();
                                             
                                               dataLop.child(snapshot.child('maLop').value.toString()).update({
                                                'tenLop' : updatetenLop});                      
                                            },
                                            child: const Text('Update'),
                                          ),
                                        ],
                                     ),
                                   );
                                },
                                ),
                              IconButton(
                                icon: const  Icon(Icons.delete),
                                onPressed: (){
                                  setState(() {
                                   // listTruong.removeAt(index);
                                   
                                    dataLop.child(snapshot.child('maLop').value.toString()).remove();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Xóa thành công'))         
                                 );
                                  });
                                },
                                ),
                            ],
                          )
                        ],
                       ),
                     ),
                   );
               },
            ),
          ),
      
        ]
       ),

       floatingActionButtonLocation:
       FloatingActionButtonLocation.centerDocked, 
       floatingActionButton: Container(
       height: 50,
        margin: const EdgeInsets.only(left:30,right: 30),
        child:ElevatedButton(
          onPressed: (){
            setState(() {
                if(maLop.text.isEmpty || tenLop.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                  const  SnackBar(content: Text('Nhập đầy đủ các trường'))            
                  );
                  return;
                }
                if(checkidLop(listLop, maLop.text)){
                   ScaffoldMessenger.of(context).showSnackBar(
                    const  SnackBar(content: Text('Mã đã bị trùng'))            
                  );
                  return;
                }
                 Map<String,String> lops = {
              'maLop': maLop.text,
              'tenLop': tenLop.text,
              'tenTruong':'Chu Van An'
             };
                dataLop.child(maLop.text).set(lops);
                ScaffoldMessenger.of(context).showSnackBar(
                  const  SnackBar(content: Text('Thêm lớp thành công'))            
                  );
                 maLop.clear();
                 tenLop.clear(); 
                
            });
          
          },
          
          child: const Center(
            child: Text('Thêm lớp'),
          ),
        ),
    ),
    );
  }
}