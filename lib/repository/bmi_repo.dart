class BmiRepo {
  double calculateBMI({required double height, required double weight}) {
    double bmi = weight / (height * height);
    print(bmi);
    return bmi;
  }
}
