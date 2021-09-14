class BmiRepo {
  double calculateBMI({required double height, required double weight}) {
    double bmi = weight / (height * height);
    print(bmi);
    return bmi;
  }

  double calculateWeight({required double weight, required String weightUnit}) {
    if (weightUnit == "lb") {
      return weight * 0.453592;
    }
    return weight;
  }

  double calculateHeight({required double height, required String heightUnit}) {
    if (heightUnit == "cm") {
      return height * 0.01;
    } else if (heightUnit == "ft") {
      return height * 0.3048;
    }
    return height;
  }
}
