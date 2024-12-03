class AgeCalculator {
  final int years;
  final int months;
  final int days;

  AgeCalculator(
      {required this.years, required this.months, required this.days});

  @override
  String toString() {
    return 'Years: $years Months: $months, Days: $days';
  }

  //calculate age
  AgeCalculator calculateAge(int birthYear, int birthMonth, int birthDay) {
    DateTime currentDate = DateTime.now();
    int currentYear = currentDate.year;
    int currentMonth = currentDate.month;
    int currentDay = currentDate.day;

    if (currentDay < birthDay) {
      currentMonth --;
      currentDay += 31;
    }
/*
2024 2 2
2000 2 4
23 12 29 
*/


  if(currentMonth < birthMonth){
    currentYear --;
    currentMonth += 12;
  }

    return AgeCalculator(
      years: currentYear - birthYear,
      months: currentMonth - birthMonth,
      days: currentDay - birthDay,
    );
  }
}
