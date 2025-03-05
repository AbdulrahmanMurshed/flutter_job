class Job {
  final String id;
  final String title;
  final String company;
  final String location;
  final String salary;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
  });

  factory Job.fromMap(Map<String, dynamic> data, String id) {
    return Job(
      id: id,
      title: data['title'] ?? '',
      company: data['company'] ?? '',
      location: data['location'] ?? '',
      salary: data['salary'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'company': company,
      'location': location,
      'salary': salary,
    };
  }
}
