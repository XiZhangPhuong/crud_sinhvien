import 'package:crud/model/SinhVien.dart';
import 'package:crud/temp/temp.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const SinhVienPage());
}

class SinhVienPage extends StatefulWidget {
  const SinhVienPage({super.key});

  @override
  State<SinhVienPage> createState() => _SinhVienPageState();
}

class _SinhVienPageState extends State<SinhVienPage> {
  TextEditingController maSV = TextEditingController();
  TextEditingController hoTen = TextEditingController();
  TextEditingController dtb = TextEditingController();

  static var listSV = getListSinhVien();
  DatabaseReference dataSinhVien = FirebaseDatabase.instance.ref("SinhVien");
  
  String updateHoten = '';
  String updateDTB = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sinh viên'),
        centerTitle: true,
        leading: const Icon(Icons.menu),   
      ),
      body: ListView(
        children: [
              Container(
            margin: const EdgeInsets.only(top: 20,left: 30,right: 30),
            child: TextField(
              controller: maSV,
              decoration: InputDecoration(
                hintText: 'Nhập mã sinh viên',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10,left: 30,right: 30),
            child: TextField(
              controller: hoTen,
              decoration: InputDecoration(
                hintText: 'Nhập họ tên',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
            ),
          ),
           // TextField nhap DTB
            Container(
            margin: const EdgeInsets.only(top: 10,left: 30,right: 30),
            child: TextField(
              controller: dtb,
              decoration: InputDecoration(
                hintText: 'Nhập ĐTB',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
            ),
          ),
        
          
          // get List data sinh vien from readtime database
           Container(
            margin:const  EdgeInsets.only(bottom: 70,top: 10),
            child: FirebaseAnimatedList(
              shrinkWrap: true,
               query: dataSinhVien,
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
                              Text(snapshot.child('maSV').value.toString()),
                              Text(snapshot.child('hoTen').value.toString()),
                              Text(snapshot.child('dtb').value.toString()),
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
                                               updateHoten = value;
                                             }),                                       
                                          ),

                                          TextField(
                                             onChanged: (value) => 
                                             setState(() {
                                               updateDTB = value;
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
                                             
                                               dataSinhVien.child(snapshot.child('maSV').value.toString()).update({
                                                'hoTen' : updateHoten,'dtb':updateDTB});                      
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
                                   
                                    dataSinhVien.child(snapshot.child('maSV').value.toString()).remove();
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
               if(maSV.text.isEmpty || hoTen.text.isEmpty || dtb.text.isEmpty){
                 ScaffoldMessenger.of(context).showSnackBar(
                  const  SnackBar(content: Text('Nhập đầy đủ các trường'))            
                  );
                  return;
               }
                if(checkidSV(listSV, maSV.text)){
                 ScaffoldMessenger.of(context).showSnackBar(
                  const  SnackBar(content: Text('Đã bị trùng mã'))           
                  );
                return;
               
                }
                  Map<String,String> sv = {
                  'maSV': maSV.text,
                  'hoTen': hoTen.text,
                   'tenLop' : '12A2',
                   'dtb': dtb.text,
             };
                dataSinhVien.child(maSV.text).set(sv);
                maSV.clear();
                hoTen.clear();
                dtb.clear();
            });
          
          },
          
          child: const Center(
            child: Text('Thêm sinh viên'),
          ),
        ),
    )
    );
  }
}