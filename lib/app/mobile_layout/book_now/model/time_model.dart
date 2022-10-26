String convertTo12hr({required String hour}) {
  switch (hour) {
    case "1:00":
      return '01:00 - 02:00';
    case "2:00":
      return '02:00 - 03:00';
    case "3:00":
      return '03:00 - 04:00';
    case "4:00":
      return '04:00 - 05:00';
    case "5:00":
      return '05:00 - 06:00';
    case "6:00":
      return '06:00 - 07:00';
    case "7:00":
      return '07:00 - 08:00';
    case "8:00":
      return '08:00 - 09:00';
    case "9:00":
      return '09:00 - 10:00';
    case "10:00":
      return '10:00 - 11:00';
    case "11:00":
      return '11:00 - 12:00';
    case "12:00":
      return '12:00 -  01:00';
    case "13:00":
      return ' 01:00 - 02:00';
    case "14:00":
      return ' 02:00 - 03:00';
    case "15:00":
      return ' 03:00 - 04:00';
    case "16:00":
      return ' 04:00 - 05:00';
    case "17:00":
      return ' 05:00 - 06:00';
    case "18:00":
      return ' 06:00 - 07:00';
    case "19:00":
      return ' 07:00 - 08:00';
    case "20:00":
      return ' 08:00 - 09:00';
    case "21:00":
      return ' 09:00 - 10:00';
    case "22:00":
      return ' 10:00 - 11:00';
    case "23:00":
      return ' 11:00 - 12:00';
    case "24:00":
      return ' 12:00 - 01:00';

    default:
      return "";
  }
}

int backTo24Hour({required String hour}) {
  switch (hour) {
    case "01:00 - 02:00":
      return 1;
    case "02:00 - 03:00":
      return 2;
    case "03:00 - 04:00":
      return 3;
    case "04:00 - 05:00":
      return 4;
    case "05:00 - 06:00":
      return 5;
    case "06:00 - 07:00":
      return 6;
    case "07:00 - 08:00":
      return 7;
    case "08:00 - 09:00":
      return 8;
    case "09:00 - 10:00":
      return 9;
    case "10:00 - 11:00":
      return 10;
    case "11:00 - 12:00":
      return 11;
    case "12:00 -  01:00":
      return 12;
    case " 01:00 - 02:00":
      return 13;
    case " 02:00 - 03:00":
      return 14;
    case " 03:00 - 04:00":
      return 15;
    case " 04:00 - 05:00":
      return 16;
    case " 05:00 - 06:00":
      return 17;
    case " 06:00 - 07:00":
      return 18;
    case " 07:00 - 08:00":
      return 19;
    case " 08:00 - 09:00":
      return 20;
    case " 09:00 - 10:00":
      return 21;
    case " 10:00 - 11:00":
      return 22;
    case " 11:00 - 12:00":
      return 23;
    case " 12:00 - 01:00":
      return 24;
    default:
      return 0;
  }
}


