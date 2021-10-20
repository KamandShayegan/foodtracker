String mealSpecifier(int index) {
  String meal = '';
  switch (index) {
    case 0:
      meal = 'breakfast';
      break;
    case 1:
      meal = 'lunch';
      break;
    case 2:
      meal = 'brunch';
      break;
    case 3:
      meal = 'dinner';
      break;
  }
  return meal;
}
