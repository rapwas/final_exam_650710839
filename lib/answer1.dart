import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override

  
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("โปรไฟล์ผู้ใช้"),
          backgroundColor: const Color.fromARGB(255, 117, 165, 255),
        ),
        body: Column(
            children: [
              const SizedBox(height: 12),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    "https://www.kasandbox.org/programming-images/avatars/leaf-blue.png"),
              ),
              const SizedBox(height: 12),
              Text(
                "ชื่อผู้ใช้: John Doe",
                style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "อีเมล: johndoe@example.com",
                style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 129, 129, 129)),
              ),
              ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text("การตั้งค่า"),
              onTap: () {},
            ),
              ListTile(
                leading: Icon(Icons.lock, color: Colors.blue),
                title: Text("เปลี่ยนรหัสผ่าน"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.question_mark_rounded, color: Colors.blue),
                title: Text("ความเป็นส่วนตัว"),
                onTap: () {},
              ),
              ElevatedButton(onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("แก้ไขโปรไฟล์")),
                );
              }, 
              child: Text("แก้ไขโปรไฟล์",selectionColor:Color.fromARGB(255, 189, 135, 214)) ),
              ElevatedButton(onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("ออกจากระบบ")),
                );
              }, 
              child: Text("ออกจากระบบ",selectionColor:Color.fromARGB(255, 189, 135, 214)) ),
            ],
          ),
        ),
    );
  }
}
