class NumericConstant {
  // Ensure singleton
  static final NumericConstant _instance = NumericConstant._privateConstructor();
  static NumericConstant get instance => _instance;
  NumericConstant._privateConstructor();

  double searchBoxHeight = 60;
}
