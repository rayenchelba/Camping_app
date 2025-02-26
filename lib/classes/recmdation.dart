class recomdation{
  String path;
  String location;
  String title;
  String month;
  String day;
  recomdation({required this.title,required this.path,required this.location,required this.month,required this.day});
  static List<recomdation> getrec(){
    List<recomdation> ls=[];
    ls.add(recomdation(title: 'Camp Granite Lake', path: 'assets/images/camping.jpg', location: 'Golden,Colorado,Us', month: 'June', day: '22'));
    ls.add(recomdation(title: 'Camp Granite Lake', path: 'assets/images/camping.jpg', location: 'Golden,Colorado,Us', month: 'June', day: '22'));
    ls.add(recomdation(title: 'Camp Granite Lake', path: 'assets/images/camping.jpg', location: 'Golden,Colorado,Us', month: 'June', day: '22'));
    ls.add(recomdation(title: 'Camp Granite Lake', path: 'assets/images/camping.jpg', location: 'Golden,Colorado,Us', month: 'June', day: '22'));
    return ls;
  }
}