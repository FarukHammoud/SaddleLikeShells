Objetos OBJETOS = new Objetos();

class Objeto {

  String tipo = "";
  int x = 0;
  int y = 0;
  int z = 0;
}
class Objetos {

  PShape terreno_plano;
  PShape torre;
  PShape globe;
  PShape terreno_subida_norte;
  PShape terreno_subida_sul;
  PShape terreno_subida_leste;
  PShape terreno_subida_oeste;
  PShape casa;
  PShape cubo;
  PShape paraboloide_hiperbolico;
  PImage grama_1;
  PImage rocha_1;
  PImage agua_1;

  void DefineCasa() {
    casa = loadShape("casa/CasaSimples.obj");
  }
  void CarregaCasa() {
    shape(casa);
  }
  void DefineCubo() {
    cubo = loadShape("cubo.obj");
  }
  void CarregaCubo() {
    shape(cubo);
  }
  void DefineTerrenoInclinado() {

    terreno_plano = createShape();
    terreno_plano.beginShape();
    terreno_plano.vertex(0, 0, 0);
    terreno_plano.vertex(50, 0, 0);
    terreno_plano.vertex(50, 50, 50);
    terreno_plano.vertex(0, 50, 50);
    terreno_plano.vertex(0, 0, 0);
    terreno_plano.endShape();
    terreno_plano.beginShape();
    terreno_plano.vertex(50, 50, 0);
    terreno_plano.vertex(50, 0, 0);
    terreno_plano.vertex(50, 50, 50);
    terreno_plano.vertex(50, 50, 0);
    terreno_plano.endShape();
    terreno_plano.beginShape();
    terreno_plano.vertex(0, 0, 0);
    terreno_plano.vertex(0, 50, 0);
    terreno_plano.vertex(0, 50, 50);
    terreno_plano.vertex(0, 0, 0);
    terreno_plano.endShape();
    terreno_plano.beginShape();
    terreno_plano.vertex(0, 50, 0);
    terreno_plano.vertex(0, 50, 50);
    terreno_plano.vertex(50, 50, 50);
    terreno_plano.vertex(50, 50, 0);
    terreno_plano.vertex(0, 50, 0);
    terreno_plano.endShape();
  }
  void CarregaParaboloideHiperbolico() {

    paraboloide_hiperbolico = createShape();
    paraboloide_hiperbolico.beginShape();
    for (int i=-100; i<100; i+=10) {

      strokeWeight(1);
      fill(255);
      stroke(150);
      for (int j=-100; j<100; j+=10) {
        beginShape();
        vertex(i, j, int(pow(i/10, 2)-pow(j/10, 2)));
        vertex(i+10, j, int(pow((i+10)/10, 2)-pow(j/10, 2)));
        vertex(i+10, j+10, int(pow((i+10)/10, 2)-pow((j+10)/10, 2)));
        vertex(i, j+10, int(pow(i/10, 2)-pow((j+10)/10, 2)));
        endShape(CLOSE);
      }
      stroke(0, 0, 255);
      strokeWeight(2);
      line(0, i, -pow(i/10, 2), 0, i+10, -pow((i+10)/10, 2));
      line(i, 0, pow(i/10, 2), i+10, 0, pow((i+10)/10, 2));
    }

    paraboloide_hiperbolico.endShape();
  }
  void CarregaCilindro() {

    for (int i=-100; i<100; i+=10) {

      strokeWeight(1);
      fill(255);
      stroke(150);
      for (int j=0; j<20; j++) {
        fill(255);
        stroke(150);
        strokeWeight(1);
        float ang = 2*PI*j/20.0;
        beginShape();
        vertex(50*cos(ang), i, 50*sin(ang));
        vertex(50*cos(ang+PI/10.0), i, 50*sin(ang+PI/10.0));
        vertex(50*cos(ang+PI/10.0), i+10, 50*sin(ang+PI/10.0));
        vertex(50*cos(ang), i+10, 50*sin(ang));
        endShape(CLOSE);
        stroke(0, 0, 255);
        strokeWeight(2);
        line(50*cos(ang), 0, 50*sin(ang), 50*cos(ang+PI/10.0), 0, 50*sin(ang+PI/10.0));
      }
      stroke(0, 0, 255);
      strokeWeight(2);
      line(0, i, 50, 0, i+10, 50);
    }
  }
  void CarregaDomo() {

    for (int i=0; i<10; i++) {
      float ang_base = PI/4.0 + PI*i/40.0;
      strokeWeight(1);
      fill(255);
      
      for (int j=0; j<20; j++) {
        fill(255);
        stroke(150);
        strokeWeight(1);
        float ang = 2*PI*j/20.0;
        beginShape();
        vertex(150*cos(ang_base)*cos(ang), 150*cos(ang_base)*sin(ang), 150*sin(ang_base));
        vertex(150*cos(ang_base)*cos(ang+2*PI/20.0), 150*cos(ang_base)*sin(ang+2*PI/20.0), 150*sin(ang_base));
        vertex(150*cos(ang_base+PI/40.0)*cos(ang+2*PI/20.0), 150*cos(ang_base+PI/40.0)*sin(ang+2*PI/20.0), 150*sin(ang_base+PI/40.0));
        vertex(150*cos(ang_base+PI/40.0)*cos(ang), 150*cos(ang_base+PI/40.0)*sin(ang), 150*sin(ang_base+PI/40.0));
        endShape(CLOSE);
        stroke(0, 0, 255);
        strokeWeight(2);
        
      }
      stroke(0, 0, 255);
      strokeWeight(2);
      line(150*cos(ang_base), 0, 150*sin(ang_base), 150*cos(ang_base+PI/40.0), 0, 150*sin(ang_base+PI/40.0));
      line(-150*cos(ang_base), 0, 150*sin(ang_base), -150*cos(ang_base+PI/40.0), 0, 150*sin(ang_base+PI/40.0));
      line(0,150*cos(ang_base), 150*sin(ang_base), 0,150*cos(ang_base+PI/40.0), 150*sin(ang_base+PI/40.0));
      line(0,-150*cos(ang_base), 150*sin(ang_base),0, -150*cos(ang_base+PI/40.0), 150*sin(ang_base+PI/40.0));
    }
  }
  void DefineTorre() {
    torre = loadShape("building.obj");
  }
  void CarregaTorre() {
    shape(torre);
  }
  void DefineEsferaDeGrama() {
  }
  void DefineGrama1() {
    grama_1 = loadImage("textura_grama_1.jpg");
  }
  void DefineRocha1() {
    rocha_1 = loadImage("textura_rocha_1.jpg");
  }
  void DefineAgua1() {
    agua_1 = loadImage("textura_agua_1.jpg");
  }
  void CarregaGramaPlano() {
    beginShape(QUADS);
    texture(this.grama_1);
    vertex(0, 0, 50, 0, 0);
    vertex(0, 50, 50, 1, 0);
    vertex(50, 50, 50, 1, 1);
    vertex(50, 0, 50, 0, 1);

    vertex(0, 50, 0, 0, 0);
    vertex(0, 0, 0, 1, 0);
    vertex(0, 0, 50, 1, 1);
    vertex(0, 50, 50, 0, 1);

    vertex(0, 0, 0, 0, 0);
    vertex(50, 0, 0, 1, 0);
    vertex(50, 0, 50, 1, 1);
    vertex(0, 0, 50, 0, 1);

    vertex(50, 0, 0, 0, 0);
    vertex(50, 50, 0, 1, 0);
    vertex(50, 50, 50, 1, 1);
    vertex(50, 0, 50, 0, 1);

    vertex(50, 50, 0, 0, 0);
    vertex(50, 50, 50, 1, 0);
    vertex(0, 50, 50, 1, 1);
    vertex(0, 50, 0, 0, 1);

    endShape();
  }
  void CarregaRochaPlano() {
    beginShape(QUADS);
    texture(this.rocha_1);
    vertex(0, 0, 50, 0, 0);
    vertex(0, 50, 50, 1, 0);
    vertex(50, 50, 50, 1, 1);
    vertex(50, 0, 50, 0, 1);

    vertex(0, 50, 0, 0, 0);
    vertex(0, 0, 0, 1, 0);
    vertex(0, 0, 50, 1, 1);
    vertex(0, 50, 50, 0, 1);

    vertex(0, 0, 0, 0, 0);
    vertex(50, 0, 0, 1, 0);
    vertex(50, 0, 50, 1, 1);
    vertex(0, 0, 50, 0, 1);

    vertex(50, 0, 0, 0, 0);
    vertex(50, 50, 0, 1, 0);
    vertex(50, 50, 50, 1, 1);
    vertex(50, 0, 50, 0, 1);

    vertex(50, 50, 0, 0, 0);
    vertex(50, 50, 50, 1, 0);
    vertex(0, 50, 50, 1, 1);
    vertex(0, 50, 0, 0, 1);

    endShape();
  }
  void CarregaAguaPlano() {
    beginShape(QUADS);
    texture(this.agua_1);
    vertex(0, 0, 50, 0, 0);
    vertex(0, 50, 50, 1, 0);
    vertex(50, 50, 50, 1, 1);
    vertex(50, 0, 50, 0, 1);

    vertex(0, 50, 0, 0, 0);
    vertex(0, 0, 0, 1, 0);
    vertex(0, 0, 50, 1, 1);
    vertex(0, 50, 50, 0, 1);

    vertex(0, 0, 0, 0, 0);
    vertex(50, 0, 0, 1, 0);
    vertex(50, 0, 50, 1, 1);
    vertex(0, 0, 50, 0, 1);

    vertex(50, 0, 0, 0, 0);
    vertex(50, 50, 0, 1, 0);
    vertex(50, 50, 50, 1, 1);
    vertex(50, 0, 50, 0, 1);

    vertex(50, 50, 0, 0, 0);
    vertex(50, 50, 50, 1, 0);
    vertex(0, 50, 50, 1, 1);
    vertex(0, 50, 0, 0, 1);

    endShape();
  }
  void CarregaTerrenoInclinado() {
  }
}