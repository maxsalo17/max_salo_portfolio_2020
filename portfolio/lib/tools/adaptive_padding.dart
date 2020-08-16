class AdaptivePadding{
  static getHorizontalPaddingRelativeValue(double screenWidth, double relativePadding){
    return (screenWidth * relativePadding) *
        screenWidth / 1000;
  }
}