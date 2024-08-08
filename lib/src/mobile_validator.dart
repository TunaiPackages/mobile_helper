class MobileValidator {
  static bool isValid(String mobile) {
    //MY
    if (mobile.startsWith('60')) {
      if (mobile.length >= 4) {
        if (mobile.substring(0, 4) == '6011') {
          return mobile.length == 12;
        } else {
          return mobile.length == 11;
        }
      }
    }

    //SG
    else if (mobile.startsWith('65')) {
      return mobile.length == 10;
    }

    //Brunei
    else if (mobile.startsWith('673')) {
      return mobile.length == 10;
    }

    //HongKong
    else if (mobile.startsWith('852')) {
      return mobile.length == 8;
    }

    //Indonesia
    else if (mobile.startsWith('62')) {
      return mobile.length == 11;
    }

    //test is it updating
    //default
    return mobile.length > 6;
  }
}
