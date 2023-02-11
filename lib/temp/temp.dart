
import 'package:crud/model/SinhVien.dart';
import 'package:crud/model/Truong.dart';
import 'package:crud/model/Lop.dart';

List<Truong> getListTruong(){
  List<Truong> list =[
    Truong('truong1','Chu Văn An','43 Đà Nẵng'),
    Truong('truong2','Nnguyễn Bỉh Khiêm','123 Phan Thanh'),
    Truong('truong3','Lê Độ','43 Lâm Đồng'),
    Truong('truong4','Vạn Tường','Nguyễn Hữu Thọ'),
    Truong('truong5','Lê Đại Hành','Kim Tuấn'),

    Truong('truong6','Chu Văn An','43 Đà Nẵng'),
    Truong('truong7','Nguyễn Bỉnh Khiêm','123 Phan Thanh'),
    Truong('truong8','Lê Độ','43 Lâm Đồng'),
    Truong('truong9','Vạn Tường','Nguyễn Hữu Thọ'),
    Truong('truong10','Lê Đại Hành','Kim Tuấn'),
    Truong('truong6','Chu Văn An','43 Đà Nẵng'),
    Truong('truong7','Nguyễn Bỉnh Khiêm','123 Phan Thanh'),
    Truong('truong8','Lê Độ','43 Lâm Đồng'),
    Truong('truong9','Vạn Tường','Nguyễn Hữu Thọ'),
    Truong('truong10','Lê Đại Hành','Kim Tuấn'),
    Truong('truong6','Chu Văn An','43 Đà Nẵng'),
    Truong('truong7','Nguyễn Bỉnh Khiêm','123 Phan Thanh'),
    Truong('truong8','Lê Độ','43 Lâm Đồng'),
    Truong('truong9','Vạn Tường','Nguyễn Hữu Thọ'),
    Truong('truong10','Lê Đại Hành','Kim Tuấn'),
    Truong('truong6','Chu Văn An','43 Đà Nẵng'),
    Truong('truong7','Nguyễn Bỉnh Khiêm','123 Phan Thanh'),
    Truong('truong8','Lê Độ','43 Lâm Đồng'),
    Truong('truong9','Vạn Tường','Nguyễn Hữu Thọ'),
    Truong('truong10','Lê Đại Hành','Kim Tuấn'),
    Truong('truong6','Chu Văn An','43 Đà Nẵng'),
    Truong('truong7','Nguyễn Bỉnh Khiêm','123 Phan Thanh'),
    Truong('truong8','Lê Độ','43 Lâm Đồng'),
    Truong('truong9','Vạn Tường','Nguyễn Hữu Thọ'),
    Truong('truong10','Lê Đại Hành','Kim Tuấn'),
  ];
  return list;
}

List<Lop> getListLop(){
  List<Lop> listLop = [
      Lop('lop01', '12A2', 'Chu Van An'),
      Lop('lop02', '12A4', 'Nguyễn Hữu Thọ'),
      Lop('lop03', '12A5', 'Kim Tuấn'),
  ];
  return listLop;
}
List<String> getListTenTruong(){
  List<String> listMaTruong =  [];
  for(int i = 0;i<getListLop().length;i++){
    listMaTruong.add(getListTruong()[i].tenTruong);
  }
  return listMaTruong;
}
List<SinhVien> getListSinhVien(){
  List<SinhVien> list = [
     SinhVien('sv001', 'Văn Văn Phương', '12A2', 8),
     SinhVien('sv002', 'Lê Thị Thu Phượng', '12A2', 7),
     SinhVien('sv003', 'Lê Quang Nhân', '12A2', 4),
     SinhVien('sv004', 'Nguyễn Long Nhật', '12A2', 9),
     SinhVien('sv005', 'Kim Dung', '12A2', 2),
     SinhVien('sv006', 'Em Dũng', '12A2', 7),
  ];
  return list;
}
bool checkidTruong(List<Truong> list,String id){
  for(int i = 0;i<list.length;i++){
    if(list[i].maTruong.compareTo(id)==0){
      return true;
    }
  }
  return false;
}

bool checkidLop(List<Lop> list,String id){
  for(int i = 0;i<list.length;i++){
    if(list[i].maLop.compareTo(id)==0){
      return true;
    }
  }
  return false;
}
bool checkidSV(List<SinhVien> list,String id){
  for(int i = 0;i<list.length;i++){
    if(list[i].maSV.compareTo(id)==0){
      return true;
    }
  }
  return false;
}