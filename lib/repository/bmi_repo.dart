class BmiRepo {
  double calculateBMI({required double height, required double weight}) {
    double bmi = height / (weight * weight);
    return bmi;
  }
}
