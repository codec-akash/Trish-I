class BMiModel {
  late int age;
  late double height;
  late double weight;
  late double bmi;
  late String heightUnit;
  late String weightUnit;
  late double givenHeight;
  late double givenWeight;

  BMiModel({
    required this.age,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.givenHeight,
    required this.givenWeight,
    required this.heightUnit,
    required this.weightUnit,
  });

  BMiModel.fromJson(Map<String, dynamic> json) {
    this.age = json['age'] ?? 0;
    this.height = json['height'] ?? 0.0;
    this.weight = json['weight'] ?? 0.0;
    this.bmi = json['bmi'] ?? 0.0;
    this.heightUnit = json['height_unit'] ?? "m";
    this.weightUnit = json['weight_unit'] ?? "kg";
    this.givenHeight = json['given_height'] ?? 0.0;
    this.givenWeight = json['given_weight'] ?? 0.0;
  }
}
