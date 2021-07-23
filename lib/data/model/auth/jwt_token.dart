class JwtToken {
  final int iat;
  final int exp;
  final int nbf;
  final String jti;
  final int sub;
  final String prv;

  JwtToken({
    required this.iat,
    required this.exp,
    required this.nbf,
    required this.jti,
    required this.sub,
    required this.prv,
  });

  factory JwtToken.fromJson(Map<String, dynamic> json) {
    return JwtToken(
      iat: json['iat'],
      exp: json['exp'],
      nbf: json['nbf'],
      jti: json['jti'],
      sub: json['sub'],
      prv: json['prv'],
    );
  }
}
