class Stado {
  final String ownerId;
  final String stadoNumber;
  final String typeofstados;

  Stado({
    required this.ownerId,
    required this.stadoNumber,
    required this.typeofstados,
  });

  Map<String, dynamic> toMap() {
    return {
      'ownerId': ownerId,
      'stadoNumber': stadoNumber,
      'typeofstados': typeofstados,
    };
  }

  factory Stado.fromMap(Map<String, dynamic> map) {
    return Stado(
      ownerId: map['ownerId'] ?? '',
      stadoNumber: map['stadoNumber'] ?? '',
      typeofstados: map['typeofstados'] ?? '',
    );
  }
}
