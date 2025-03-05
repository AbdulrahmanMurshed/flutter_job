import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'add_job_screen.dart';
import 'admin_login_screen.dart';
import '../models/job_model.dart';
import '../widgets/job_card.dart';
import 'job_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الوظائف المتاحة'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                DocumentSnapshot userDoc = await FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.uid)
                    .get();
                if (userDoc['role'] == 'admin') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AddJobScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('غير مصرح لك بإضافة وظائف')),
                  );
                }
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AdminLoginScreen()),
                );
              }
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('jobs').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('حدث خطأ أثناء تحميل البيانات'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('لا توجد وظائف متاحة'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Job job = Job.fromMap(
                    snapshot.data!.docs[index].data() as Map<String, dynamic>,
                    snapshot.data!.docs[index].id);
                return JobCard(
                  job: job,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JobDetailsScreen(job: job),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
