import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddJobScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  AddJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة وظيفة جديدة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'عنوان الوظيفة'),
            ),
            TextField(
              controller: _companyController,
              decoration: const InputDecoration(labelText: 'اسم الشركة'),
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'الموقع'),
            ),
            TextField(
              controller: _salaryController,
              decoration: const InputDecoration(labelText: 'الراتب'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'وصف الوظيفة'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_titleController.text.isEmpty ||
                    _companyController.text.isEmpty ||
                    _locationController.text.isEmpty ||
                    _salaryController.text.isEmpty ||
                    _descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('يرجى ملء جميع الحقول')),
                  );
                } else {
                  final job = {
                    'title': _titleController.text,
                    'company': _companyController.text,
                    'location': _locationController.text,
                    'salary': _salaryController.text,
                    'description': _descriptionController.text,
                    'postedAt': DateTime.now(),
                  };

                  await FirebaseFirestore.instance.collection('jobs').add(job);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم إضافة الوظيفة بنجاح')),
                  );

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                }
              },
              child: const Text('إضافة الوظيفة'),
            ),
          ],
        ),
      ),
    );
  }
}
