import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../models/application_model.dart';

class ApplyJobScreen extends StatelessWidget {
  final String jobId;

  const ApplyJobScreen({super.key, required this.jobId});

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);
    final userId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('تقديم على الوظيفة'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            if (userId != null) {
              Application application = Application(
                id: DateTime.now().toString(),
                userId: userId,
                jobId: jobId,
                status: 'قيد المراجعة',
                appliedAt: DateTime.now(),
              );

              await firestoreService.addApplication(application);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم تقديم الطلب بنجاح')),
              );

              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('يجب تسجيل الدخول أولاً')),
              );
            }
          },
          child: const Text('تقديم الآن'),
        ),
      ),
    );
  }
}
