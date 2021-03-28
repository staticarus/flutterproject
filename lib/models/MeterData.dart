class MeterData {
  String meter;
  int value;
  DateTime date;
  
  MeterData(String meter, int value){
    this.meter = meter;
    this.value = value;
    this.date = DateTime.now();
  }
}

List<MeterData> meterValues = List.generate(10, (index) => new MeterData("Value "+index.toString(), index));
