import 'package:flutter/material.dart';

class Calculate_Delivery extends StatefulWidget {
  const Calculate_Delivery({super.key});

  @override
  State<Calculate_Delivery> createState() => _Calculate_DeliveryState();
}

class _Calculate_DeliveryState extends State<Calculate_Delivery> {
  final _formKey = GlobalKey<FormState>();
  String? _speed = 'ปกติ';
  bool _isChecked = false;
  bool _isCheckedPackage= false;
  String? _selectedItem;
  double count = 0;
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("คำนวณค่าจัดส่ง"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'น้ำหนักสินค้า (กก.):'),
                  cursorRadius: Radius.circular(30),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  count = value as double;
                  return 'กรอกน้ำหนักสินค้า (กิโลกรัม)';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'เลือกระยะทาง'),
            value: _selectedItem,
            items: ['ในเมือง', 'ต่างจังหวัด', 'ต่างประเทศ']
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: (value) {
              _selectedItem = value;
              if (value == 'ในเมือง') {
                count *= 10 ;
              } else if (value == 'ต่างจังหวัด') {
                count *= 15;
              } else {
                count *= 50;
              }
            },
            validator: (value) =>
                value == null ? 'Please select an option' : null,
          ),
          const SizedBox(height: 12),
          Text('บริการเสริม:'),
          CheckboxListTile(
            title: const Text('แพ็คกิ้งพิเศษ (+20 บาท)'),
            value: _isCheckedPackage,
            onChanged: (value) {
              setState(() {
                _isCheckedPackage = value!;
                count+=20;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('ประกันพัสดุ (+50 บาท)'),
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value!;
                count+=50;
              });
            },
          ),
          Text('เลือกความเร่งด่วน:'),
          RadioListTile(
              title: const Text('ปกติ'),
              value: 'ปกติ',
              groupValue: _speed,
              onChanged: (value) {
                setState(() {
                  _speed = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text('ด่วน'),
              value: 'ด่วน',
              groupValue: _speed,
              onChanged: (value) {
                setState(() {
                  _speed = value.toString();
                  count += 30;
                });
              },
            ),
            RadioListTile(
              title: const Text('ด่วนพิเศษ'),
              value: 'ด่วนพิเศษ',
              groupValue: _speed,
              onChanged: (value) {
                setState(() {
                  _speed = value.toString();
                  count += 50;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text("ค่าจัดส่งทั้งหมด: ${count} B")),
                    );
                    count = 0;
                  }
                },
                child: const Text('คำนวณราคา'),
            ),
          ],
        ),
      ),
    );
  }
}
