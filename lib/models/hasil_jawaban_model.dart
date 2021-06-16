import 'dart:convert';

HasilJawabanModel hasilJawabanModelFromJson(String str) =>
    HasilJawabanModel.fromJson(json.decode(str));

String hasilJawabanModelToJson(HasilJawabanModel data) =>
    json.encode(data.toJson());

class HasilJawabanModel {
  final String nik;
  final int periode;
  final int idPertanyaan;
  final String jawaban;

  HasilJawabanModel({
    this.nik,
    this.periode,
    this.idPertanyaan,
    this.jawaban,
  });

  factory HasilJawabanModel.fromJson(Map<String, dynamic> json) =>
      HasilJawabanModel(
        nik: json["NIK"],
        periode: json["Periode"],
        idPertanyaan: json["IdPertanyaan"],
        jawaban: json["Jawaban"],
      );

  Map<String, dynamic> toJson() => {
        "NIK": nik,
        "Periode": periode,
        "IdPertanyaan": idPertanyaan,
        "Jawaban": jawaban,
      };
}
