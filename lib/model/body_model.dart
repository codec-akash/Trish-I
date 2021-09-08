class BMiModel {
  late int age;
  late double height;
  late double weight;
  late double bmi;

  BMiModel({
    required this.age,
    required this.height,
    required this.weight,
    required this.bmi,
  });

  BMiModel.fromJson(Map<String, dynamic> json) {
    this.age = int.tryParse(json['age']) ?? 0;
    this.height = double.tryParse(json['height']) ?? 0.0;
    this.weight = double.tryParse(json['weight']) ?? 0.0;
    this.bmi = double.tryParse(json['bmi']) ?? 0.0;
  }
}
