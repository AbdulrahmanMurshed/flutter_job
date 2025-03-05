import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/job_model.dart';
import '../models/application_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // جلب الوظائف
  Future<List<Job>> getJobs() async {
    QuerySnapshot snapshot = await _firestore.collection('jobs').get();
    return snapshot.docs
        .map((doc) => Job.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  // إضافة طلب توظيف
  Future<void> addApplication(Application application) async {
    await _firestore
        .collection('applications')
        .doc(application.id)
        .set(application.toMap());
  }
}
