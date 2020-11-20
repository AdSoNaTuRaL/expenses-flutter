String formatValue(double value) {
  if (value < 1000) {
    return value.toStringAsFixed(2);
  } else if (value >= 1000 && value < 10000) {
    return value.toString()[0] + "K";
  } else if (value >= 10000 && value < 100000) {
    return value.toString().substring(0, 2) + "K";
  } else if (value >= 100000 && value < 1000000) {
    return value.toString().substring(0, 3) + "K";
  } else {
    return value.toString()[0] + "M";
  }
}
