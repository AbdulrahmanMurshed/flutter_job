class Application {
  final String id;
  final String userId;
  final String jobId;
  final String status;
  final DateTime appliedAt;

  Application({
    required this.id,
    required this.userId,
    required this.jobId,
    required this.status,
    required this.appliedAt,
  });

  factory Application.fromMap(Map<String, dynamic> data, String id) {
    return Application(
      id: id,
      userId: data['userId'] ?? '',
      jobId: data['jobId'] ?? '',
      status: data['status'] ?? 'قيد المراجعة',
      appliedAt: DateTime.parse(data['appliedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'jobId': jobId,
      'status': status,
      'appliedAt': appliedAt.toIso8601String(),
    };
  }
}
