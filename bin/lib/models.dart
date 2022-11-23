// // ignore: avoid_relative_lib_imports
// import 'utils.dart';

// class Schema {
//   Schema();

//   Map<String, dynamic> toMap() {
//     return {};
//   }

//   ///
//   /// Cette fonction permet de voir le schema de donnée au format Json d'une classe de Reponse
//   ///
//   /// ```[dataView] par défaut à [false]```
//   /// ```
//   ///    {
//   ///      "id": "id",
//   ///      "mail": "tonton@gmail.com"
//   ///    }
//   /// ```
//   /// ```[dataView] à [true]```
//   /// ```
//   ///    {"id": "id","mail": "tonton@gmail.com"}
//   /// ```
//   /// @returns String
//   ///

//   String schema({bool readable = false}) {
//     return Json.shema(toMap(), readable: readable);
//   }
// }

// class Location extends Schema {
//   String? pays;
//   String? capital;

//   Location({this.pays, this.capital});

//   factory Location.create(Map<String, dynamic> map) {
//     return Location(pays: map['pays'], capital: map['capital']);
//   }

//   @override
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{'pays': pays, 'capital': capital};
//   }
// }

// class Personne extends Schema {
//   String? firstName;
//   String? lastName;
//   String? sex;
//   Location? location;

//   Personne({this.firstName, this.lastName, this.sex, this.location});

//   factory Personne.create(Map<String, dynamic> map) {
//     return Personne(
//       firstName: map['firstName'],
//       lastName: map['lastName'],
//       sex: map['sex'],
//       location:
//           (map['location'] != null) ? Location.create(map['location']) : null,
//     );
//   }

//   @override
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'firstName': firstName,
//       'lastName': lastName,
//       'sex': sex,
//       'location': (location != null) ? location!.toMap() : null,
//     };
//   }
// }
