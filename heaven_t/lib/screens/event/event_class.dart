
class eventClass {
  
  int id;
  int likes;
  //TODO_Find a way to call an image
  //Image image;
  String name;
  int day;
  String month;
  int years;
  String dateFinal;
  String time;
  String starttime;
  String endtime;
  String location;
  String adress;
  int price;
  String description;
  String dayOfWeek;

  @override
  eventClass(/*Image _image,*/ String _name, int _years, String _dayOfWeek, int _day, int _month, String _starttime, String _endtime, String _location, String _adress, int _price, String _description) 
  {
    //this.image = _image;
    this.name = _name;
    this.location= _location;
    this.adress= _adress;
    this.price= _price;
    this.description = _description;
    this.dayOfWeek = _dayOfWeek;
    this.day = _day;
    switch (_month) {
      case 1 :
        this.month = "Jan";
        break;
        case 2 :
        this.month = "Feb";
        break;
        case 3 :
        this.month = "March";
        break;
        case 4 :
        this.month = "Apr";
        break;
        case 5 :
        this.month = "May";
        break;
        case 6 :
        this.month = "June";
        break;
        case 7 :
        this.month = "Jully";
        break;
        case 8 :
        this.month = "Aug";
        break;
        case 9 :
        this.month = "Sept";
        break;
        case 10 :
        this.month = "Oct";
        break;
        case 11 :
        this.month = "Nov";
        break;
      default:
      this.month = "Dec";
      break;
    }
    this.time = "$_starttime - $_endtime";
    this.dateFinal = "$dayOfWeek, $_day $month $_years";
    

  }
}

