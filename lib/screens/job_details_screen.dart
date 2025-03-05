import 'package:flutter/material.dart';
import '../models/job_model.dart';
import 'apply_job_screen.dart';

class JobDetailsScreen extends StatelessWidget {
  final Job job;

  const JobDetailsScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الوظيفة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('الشركة: ${job.company}'),
            const SizedBox(height: 10),
            Text('الموقع: ${job.location}'),
            const SizedBox(height: 10),
            Text('الراتب: ${job.salary}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ApplyJobScreen(jobId: job.id),
                  ),
                );
              },
              child: const Text('تقديم على الوظيفة'),
            ),
          ],
        ),
      ),
    );
  }
}
