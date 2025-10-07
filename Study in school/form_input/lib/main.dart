import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent.shade700,
          title: const Text("Form Input Muhammad Faiz Al Zaki"),
          centerTitle: true,
          elevation: 4,
        ),
        body: const MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  String _nama = "";
  String _kelas = "";
  int _umur = 0;
  String _alamat = "";

  final _formKey = GlobalKey<FormState>();

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _nama = _namaController.text;
        _kelas = _kelasController.text;
        _umur = int.tryParse(_umurController.text) ?? 0;
        _alamat = _alamatController.text;
      });
      FocusScope.of(context).unfocus(); // tutup keyboard setelah submit
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: 'Masukkan Nama',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _umurController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Umur',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.cake),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Umur tidak boleh kosong';
                }
                final umur = int.tryParse(value);
                if (umur == null || umur <= 0) {
                  return 'Masukkan umur valid (> 0)';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _kelasController,
              decoration: InputDecoration(
                labelText: 'Masukkan Kelas',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.class_),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kelas tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _alamatController,
              decoration: InputDecoration(
                labelText: 'Masukkan Alamat',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.home),
              ),
              maxLines: 2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Alamat tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submitData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Submit'),
              ),
            ),
            const SizedBox(height: 30),
            if (_nama.isNotEmpty || _kelas.isNotEmpty || _umur > 0 || _alamat.isNotEmpty)
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 6,
                color: Colors.lightGreenAccent.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Nama: $_nama\nUmur: $_umur\nKelas: $_kelas\nAlamat: $_alamat',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
