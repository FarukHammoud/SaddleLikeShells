Mapa MAPA = new Mapa();

class Mapa {

  Objeto[][] objeto = new Objeto[MAP_MAX][MAP_MAX];

  int bloco_x = 0;
  int bloco_y = 0;
  int bloco_z = 0;

  Mapa() {
    for (int a = 0; a<MAP_MAX; a++) {
      for (int b = 0; b<MAP_MAX; b++) {
        this.objeto[a][b] = new Objeto();
      }
    }
  }
  void PlotaMapa() {
    this.PlotaSubstrato();
    this.PlotaRelevo();
  }
  void TestBox(int x, int y) {
    pushMatrix();
    noFill();
    translate(x*50, y*50, 50);  
    OBJETOS.CarregaGramaPlano();
    popMatrix();
  }

  void PlotaSubstrato() {
    for (int a = 50*this.bloco_x; a<50*this.bloco_x+50; a++) {
      for (int b = 50*this.bloco_y; b<50*this.bloco_y+50; b++) {
        pushMatrix();  
        //translate(a*50, b*50, 25*cos((a+b)*millis()/1000)); //HABILITAR PARA EFEITOS LEGAIS
        translate(a*50+25, b*50+25, -25); 
        fill(0, 0, 0);
        stroke(255, 255, 255);
        box(50);
        popMatrix();
      }
    }
  }
  void PlotaRelevo() {
    stroke(0);
    OBJETOS.CarregaParaboloideHiperbolico();
  }


  void Mostrar() {
    this.PlotaMapa();
  }
}