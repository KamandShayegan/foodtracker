String monthSpecifier(int month){
  
  late String persianMonth;
  switch(month){
    case 1:
    persianMonth = 'فروردین';
    break;
     case 2:
    persianMonth = 'اردیبهشت';
    break;
     case 3:
    persianMonth = 'خرداد';
    break;
     case 4:
    persianMonth = 'تیر';
    break;
     case 5:
    persianMonth = 'مرداد';
    break;
     case 6:
    persianMonth = 'شهریور';
    break;
     case 7:
    persianMonth = 'مهر';
    break;
    case 8:
    persianMonth = 'آبان';
    break;
    case 9:
    persianMonth = 'آذر';
    break;
    case 10:
    persianMonth = 'دی';
    break;
    case 11:
    persianMonth = 'بهمن';
    break;
    case 12:
    persianMonth = 'اسفند';
    break;
    default:
    persianMonth = '';
    break;
  }
  return persianMonth;
}