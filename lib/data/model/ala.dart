class AlaModel {
  final int ala_id;

  AlaModel({
    required this.ala_id,
  });

  factory AlaModel.fromMap(Map<String, dynamic> map)
  {
    return AlaModel(
        ala_id: map['ala_id'],
    );
  }
}
