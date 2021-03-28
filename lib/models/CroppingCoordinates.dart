class CroppingCoordinates {
  int x;
  int y;

  CroppingCoordinates(int x, int y){
    this.x = x;
    this.y = y;
  }
}

List<CroppingCoordinates> meterValues = List.generate(10, (index) => new CroppingCoordinates(index+1,index+2));
