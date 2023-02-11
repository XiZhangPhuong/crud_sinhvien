import 'package:crud/model/Truong.dart';
import 'package:crud/temp/temp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

 void main(List<String> args) {
   runApp(const TruongPage());
}

class TruongPage extends StatefulWidget {
  const TruongPage({super.key});

  @override
  State<TruongPage> createState() => _TruongPageState();
}

class _TruongPageState extends State<TruongPage> {
  TextEditingController maTruong =  TextEditingController();
  TextEditingController tenTruong =  TextEditingController();
  TextEditingController diaChi =  TextEditingController();
  String updateTenTruong = '';
  String updateDiaChi = '';
  static var listTruong = getListTruong();
  static DatabaseReference dataTruong = FirebaseDatabase.instance.ref("Truong");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Danh sách trường'),
        centerTitle: true,
        leading:const  Icon(Icons.menu),
        actions:const  [
           Icon(Icons.search),
        ],
       ),
       body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20,left: 30,right: 30),
            child: TextField(
              controller: maTruong,
              decoration: InputDecoration(
                hintText: 'Nhập mã trường',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
            ),
          ),

            Container(
            margin: const EdgeInsets.only(top: 10,left: 30,right: 30),
            child: TextField(
              controller: tenTruong,
              decoration: InputDecoration(
                hintText: 'Nhập tên trường',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
            ),
          ),

            Container(
            margin: const EdgeInsets.only(top: 10,left: 30,right: 30),
            child: TextField(
              controller: diaChi,
              decoration: InputDecoration(
                hintText: 'Nhập địa chỉ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
            ),
          ),

          // Container(
          //   margin: const EdgeInsets.only(top: 10,bottom: 70),
          //   child: ListView.builder(
          //      shrinkWrap: true,
          //      physics: const ScrollPhysics(),
          //      itemCount: listTruong.length,
          //      itemBuilder: (BuildContext context,int index){
          //        return Container(
          //          margin: const EdgeInsets.only(top: 2,right: 30,left: 30),
          //          decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10.0),
          //           color: Colors.amber[200],  
          //          ),
          //          child: Padding(
          //            padding: const EdgeInsets.all(8.0),
          //            child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(listTruong[index].tenTruong),
          //                   Text(listTruong[index].diaChi),
          //                 ],
          //               ),
          //               Row(
          //                 children: [
          //                   IconButton(
          //                     icon: const  Icon(Icons.edit),
          //                     onPressed: (){
          //                        showDialog(
          //                          context: context,
          //                          builder: (context)=>SimpleDialog(
          //                             children: [
          //                               TextField(
          //                                  onChanged: (value) => 
          //                                  setState(() {
          //                                    updateTenTruong = value;
          //                                  }),                                       
          //                               ),

          //                               TextField(
          //                                  onChanged: (value) => 
          //                                  setState(() {
          //                                    updateDiaChi = value;
          //                                  }),                                       
          //                               ),

          //                               ElevatedButton(
          //                                 onPressed: (){
          //                                   setState(() {
          //                                      listTruong[index].tenTruong = updateTenTruong;
          //                                      listTruong[index].diaChi = updateDiaChi;
          //                                      ScaffoldMessenger.of(context).showSnackBar(
          //                                      const SnackBar(content: Text('Cập nhập thành công'))
                                                        
          //                                      );
          //                                   });
          //                                    Navigator.of(context).pop(); 
          //                                 },
          //                                 child: const Text('Update'),
          //                               ),
          //                             ],
          //                          ),
          //                        );
          //                     },
          //                     ),
          //                   IconButton(
          //                     icon: const  Icon(Icons.delete),
          //                     onPressed: (){
          //                       setState(() {
          //                         listTruong.removeAt(index);
          //                         ScaffoldMessenger.of(context).showSnackBar(
          //                         const SnackBar(content: Text('Xóa thành công'))         
          //                      );
          //                       });
          //                     },
          //                     ),
          //                 ],
          //               )
          //             ],
          //            ),
          //          ),
          //        );
          //      },
          //   ),
          // ),
          // ListView get data from FireBase
          Container(
            margin:const  EdgeInsets.only(bottom: 70,top: 10),
            child: FirebaseAnimatedList(
              shrinkWrap: true,
               query: dataTruong,
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
                              Text(snapshot.child('tenTruong').value.toString()),
                              Text(snapshot.child('diaChi').value.toString()),
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
                                               updateTenTruong = value;
                                             }),                                       
                                          ),

                                          TextField(
                                             onChanged: (value) => 
                                             setState(() {
                                               updateDiaChi = value;
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
                                             
                                               dataTruong.child(snapshot.child('maTruong').value.toString()).update({
                                                'tenTruong' : updateTenTruong,'diaChi':updateDiaChi});                      
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
                                   
                                    dataTruong.child(snapshot.child('maTruong').value.toString()).remove();
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
          
          
          
        ],
       ),
      //  floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //          if(maTruong.text.isEmpty || tenTruong.text.isEmpty || diaChi.text.isEmpty){
      //         ScaffoldMessenger.of(context).showSnackBar(
      //          const SnackBar(content: Text('Nhập đầy đủ các trường'))         
      //        );
      //         return;
      //      }
      //      if(checkidTruong(maTruong.text)==true){
      //         ScaffoldMessenger.of(context).showSnackBar(
      //          const SnackBar(content: Text('Mã đã trùng.Yêu cầu nhập lại!'))         
      //        );
      //         return;
      //      }
      //      getListTruong().add(Truong(maTruong.text,tenTruong.text,diaChi.text));
      //       ScaffoldMessenger.of(context).showSnackBar(
      //          const SnackBar(content: Text('Thêm dữ liệu thành công'))         
      //        );
      //       maTruong.text = '';
      //       tenTruong.text = '';
      //       diaChi.text = '';   
      //   },
      //   child: const Icon(Icons.add),
      //  ),

       floatingActionButtonLocation:
       FloatingActionButtonLocation.centerDocked, 
       floatingActionButton: Container(
       height: 50,
        margin: const EdgeInsets.only(left:30,right: 30),
        child:ElevatedButton(
          onPressed: (){
            setState(() {
               if(maTruong.text.isEmpty || tenTruong.text.isEmpty || diaChi.text.isEmpty){
              
              ScaffoldMessenger.of(context).showSnackBar(
               const SnackBar(content: Text('Nhập đầy đủ các trường'))         
             );
             return;
             }
             if(checkidTruong(listTruong,maTruong.text)){
              ScaffoldMessenger.of(context).showSnackBar(
               const SnackBar(content:  Text('Đã trùng mã'))            
             );
                return;
             }
           
             ScaffoldMessenger.of(context).showSnackBar(
              const  SnackBar(content: Text('Thêm thành công'))            
             );
           // listTruong.add(Truong(maTruong.text,tenTruong.text,diaChi.text));
             // push Data readTimeDatabase
             Map<String,String> truongs = {
              'maTruong': maTruong.text,
              'tenTruong': tenTruong.text,
              'diaChi':diaChi.text
             };
             
             
             dataTruong.child(maTruong.text).set(truongs);
            

             maTruong.text = '';
             tenTruong.text = '';
             diaChi.text = '';
            });
          
          },
          
          child: const Center(
            child: Text('Thêm trường'),
          ),
        ),
       ),
    );
  }
}

