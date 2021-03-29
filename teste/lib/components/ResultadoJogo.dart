class ResultadoJogo {
  int id;
  String adversario1;
  String adversario2;
  String resultado1;
  String resultado2;

  ResultadoJogo.empty() {
    adversario1 = "";
    adversario2 = "";
    resultado1 = "0";
    resultado2 = "0";
    id = null;
  }

  ResultadoJogo(
      this.adversario1, this.adversario2, this.resultado1, this.resultado2,
      [this.id = 0]);
}
