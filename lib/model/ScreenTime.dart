

///converts SQL into json, maps and genral model of sql database for Screen Time
final String ScreenTimeTable = 'Screen_Time';

class STFields {
  static final List<String> values = [
    ST_id, startTime, stopTime, diffTime
  ];
  ///TODO:Add Bool of IsScreenON?
  static final String ST_id = '_STid';
  static final String startTime = 'startTime';
  static final String stopTime = 'stopTime';
  static final String diffTime = 'diffTime';

}

class ScreenContents {
  final int? ST_id;
  final DateTime startTime;
  final DateTime stopTime;
  final int diffTime;

  //constructs contents of the column in the table
  const ScreenContents ({
    this.ST_id,
    required this.diffTime,
    required this.stopTime,
    required this.startTime
});


//Preparing contents to be converted
ScreenContents copy ({
  int? ST_id,
  int? diffTime,
  DateTime? startTime,
  DateTime? stopTime
}) =>
//Setting types to each column objects before converting
    ScreenContents(
    ST_id: ST_id ?? this.ST_id,
    diffTime: diffTime ?? this.diffTime,
    stopTime: stopTime ?? this.stopTime,
    startTime: startTime ?? this.startTime,

);

//converting to json
static ScreenContents fromJson (Map<String, Object?> json) => ScreenContents(
    diffTime: json[STFields.diffTime] as int,
    stopTime: DateTime.parse(json[STFields.stopTime]as String),
    startTime: DateTime.parse(json[STFields.startTime] as String),
    ST_id: json[STFields.ST_id] as int?);

//converting maps
  Map<String, Object?>toJson() => {
    //a map of key values
    //Table name:Key: other Value
    STFields.ST_id: ST_id,
    STFields.diffTime: diffTime,
    STFields.startTime: startTime.toIso8601String(),
    STFields.stopTime: stopTime.toIso8601String(),
  };
}