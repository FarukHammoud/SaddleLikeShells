Frames FRAMES = new Frames();

class Frames {

  //Vetor de Controle
  boolean[] frame = new boolean[600];


  //Declaração de Frames

  FrameMapa FRAME_Mapa = new FrameMapa();
  FrameBase FRAME_Base = new FrameBase();

  //Inicialização
  Frames() {

    for (int a = 0; a<this.frame.length; a++) {
      this.frame[a] = false;
    }
  }
  void AtivaFrame(int numero) {

    this.frame[numero] = true;
  }
  void DesativaFrame(int numero) {

    this.frame[numero] = false;
  }
  boolean EstadoFrame(int numero) {

    return this.frame[numero];
  }
  //Função Visualização
  void Mostrar() {

    if (this.frame[500]) {
      this.FRAME_Mapa.Mostrar();
    }
    if (this.frame[0]) {
      this.FRAME_Base.Mostrar();
    }
  }
}

//Frames do Programa
class FrameMapa {

  //Variaveis Gerais

  //Funções do Frame

  //Visualização
  void Mostrar() {
    background(200, 200, 255);
    text("TRANS: X="+INTERFACE.x_relativo+" - "+MAPA.bloco_x+" Y="+INTERFACE.y_relativo+" - "+MAPA.bloco_y, 1000, 50);
    pushMatrix();
    INTERFACE.Referencia();
    MAPA.Mostrar();
    popMatrix();
    fill(255, 0, 0);
    text("TRANS: X="+INTERFACE.x_relativo+" - "+MAPA.bloco_x+" Y="+INTERFACE.y_relativo+" - "+MAPA.bloco_y, 1000, 50);
  }
}
class FrameBase {
  int frame_atual;
  boolean primeira_vez = true;
  int tempo_inicial;
  FrameBase() {
    this.frame_atual = 0;
  }
  float sgn(float num) {
    if (num>=0) {
      return 1.0;
    } else {
      return -1.0;
    }
  }
  void setGradient(int x, int y, float w, float h, color c1, color c2) {
    noStroke();
    for (int i = y; i <= y+h; i+=5) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      fill(c);
      rect(x, i, x+w, i+5);
    }
  }
  void Mostrar() {
    color c1 = color(204+20*sin(millis()/5000.0), 102-10*sin(millis()/3000.0), 0);
    color c2 = color(0, 102-10*sin(millis()/3000.0), 153+20*sin(millis()/5000.0));
    setGradient(0, 0, width, height, c2, c1);
    if (this.frame_atual == 0) {
      textSize(width/16);
      fill(0);
      text("Saddle-like Shells", width/6+random(-5, 5), height/2+random(-5, 5));
      fill(255);
      text("Saddle-like Shells", width/6, height/2);

      textSize(width/40);
      int segundo = int(millis()/1000);

      if (segundo % 6 == 0) {
        fill(0);
        text("Faruk Hammoud", width/6+random(-5, 5), height/1.75+random(-5, 5));
        fill(255);
        text("Faruk Hammoud", width/6, height/1.75);
      }
      if (segundo % 6 == 1) {
        fill(0);
        text("Gabriel Marcos de Sa Loango Borges", width/6+random(-5, 5), height/1.75+random(-5, 5));
        fill(255);
        text("Gabriel Marcos de Sa Loango Borges", width/6, height/1.75);
      }
      if (segundo % 6 == 2) {
        fill(0);
        text("Gabriel Silverio Assuncao", width/6+random(-5, 5), height/1.75+random(-5, 5));
        fill(255);
        text("Gabriel Silverio Assuncao", width/6, height/1.75);
      }
      if (segundo % 6 == 3) {
        fill(0);
        text("Guilherme Henrique Rossi Vieira", width/6+random(-5, 5), height/1.75+random(-5, 5));
        fill(255);
        text("Guilherme Henrique Rossi Vieira", width/6, height/1.75);
      }
      if (segundo % 6 == 4) {
        fill(0);
        text("Pedro Casara Luz", width/6+random(-5, 5), height/1.75+random(-5, 5));
        fill(255);
        text("Pedro Casara Luz", width/6, height/1.75);
      }
      if (segundo % 6 == 5) {
        fill(0);
        text("Sylvio Canton Rinaldi", width/6+random(-5, 5), height/1.75+random(-5, 5));
        fill(255);
        text("Sylvio Canton Rinaldi", width/6, height/1.75);
      }
    } else {
      if (this.primeira_vez && this.frame_atual == 1) {
        this.tempo_inicial = millis();
        this.primeira_vez = false;
      }
      fill(170, 130);
      rect(0, 0, width, height/10);
      image(poli, height/40, height/100, width/6, height/12);
      fill(255);
      textSize(width/40);
      text("PEF 3110 Seminar's: Saddle-like Shells", width/3.8, height/16);
      fill(255);
      int seg = (millis()-this.tempo_inicial)/1000;
      int min = seg /60;
      text(nf(min, 2)+":"+nf(seg%60, 2), width*(0.92), height/16);

      if (this.frame_atual == 1) {
        fill(255);
        rect(width*(3.4/8.0), height*(1/8.0), width*(1.2/8.0), height/12, width/40);
        fill(0, 102, 153);  
        textSize(width/30);
        text("Shell", width*(3/6.5), height*(1/5.6));
        fill(255);
        rect(width*0.05, height*0.35, width*0.4, height*0.5, width*0.025);
        image(calatrava, width*0.07, height*0.37, width*0.36, height*0.46);
        //
        float fator_redutivo = exp(-(millis()-this.tempo_inicial)/2000.0);
        pushMatrix();
        translate(width*0.65, height*(0.55), 200);
        stroke(150);
        rotateX(PI/2*sin(millis()/5000.0));
        rotateZ(-PI/6);
        fill(255);
        strokeWeight(1);
        beginShape();
        vertex(-80, -80, -2-78*fator_redutivo);
        vertex( 80, -80, -2-78*fator_redutivo);
        vertex( 80, 80, -2-78*fator_redutivo);
        vertex(-80, 80, -2-78*fator_redutivo);
        endShape(CLOSE);
        beginShape();
        vertex(-80, -80, 2+ 78*fator_redutivo);
        vertex( 80, -80, 2+ 78*fator_redutivo);
        vertex( 80, 80, 2+78*fator_redutivo);
        vertex(-80, 80, 2+78*fator_redutivo);
        endShape(CLOSE);
        beginShape();
        vertex(-80, -80, 2+78*fator_redutivo);
        vertex( 80, -80, 2+78*fator_redutivo);
        vertex( 80, -80, -2 -78*fator_redutivo);
        vertex(-80, -80, -2 -78*fator_redutivo);
        endShape(CLOSE);
        beginShape();
        vertex(-80, 80, 2+78*fator_redutivo);
        vertex( 80, 80, 2+78*fator_redutivo);
        vertex( 80, 80, -2-78*fator_redutivo);
        vertex(-80, 80, -2 -78*fator_redutivo);
        endShape(CLOSE);
        beginShape();
        vertex(80, - 80, 2+78*fator_redutivo);
        vertex( 80, 80, 2+78*fator_redutivo);
        vertex( 80, 80, -2-78*fator_redutivo);
        vertex(80, -80, -2 -78*fator_redutivo);
        endShape(CLOSE);
        beginShape();
        vertex(-80, -80, 2+78*fator_redutivo);
        vertex(-80, 80, 2+78*fator_redutivo);
        vertex(-80, 80, -2-78*fator_redutivo);
        vertex(-80, - 80, -2-78*fator_redutivo);
        endShape(CLOSE);
        
        strokeWeight(2);
        stroke(255,255*sin(millis()/1000.0),255*sin(millis()/1000.0));
        fill(255,255*sin(millis()/1000.0),255*sin(millis()/1000.0));
        line(-60,0,2+78*fator_redutivo,-20,0,2+78*fator_redutivo);
        line(20,0,2+78*fator_redutivo,60,0,2+78*fator_redutivo);
        line(0,-60,2+78*fator_redutivo,0,-20,2+78*fator_redutivo);
        line(0,20,2+78*fator_redutivo,0,60,2+78*fator_redutivo);
        line(-60,0,-2-78*fator_redutivo,-20,0,-2-78*fator_redutivo);
        line(20,0,-2-78*fator_redutivo,60,0,-2-78*fator_redutivo);
        line(0,-60,-2-78*fator_redutivo,0,-20,-2-78*fator_redutivo);
        line(0,20,-2-78*fator_redutivo,0,60,-2-78*fator_redutivo);
        beginShape();
        vertex(-20, -5, 2+78*fator_redutivo+1);
        vertex(-12, 0, 2+78*fator_redutivo+1);
        vertex(-20, 5, +2+78*fator_redutivo+1);
        endShape(CLOSE);
        beginShape();
        vertex(20, -5, 2+78*fator_redutivo+1);
        vertex(12, 0, 2+78*fator_redutivo+1);
        vertex(20, 5, +2+78*fator_redutivo+1);
        endShape(CLOSE);
        beginShape();
        vertex(-5,-60, 2+78*fator_redutivo+1);
        vertex(0,-68, 2+78*fator_redutivo+1);
        vertex(5,-60, +2+78*fator_redutivo+1);
        endShape(CLOSE);
        beginShape();
        vertex(-5,60, 2+78*fator_redutivo+1);
        vertex(0,68, 2+78*fator_redutivo+1);
        vertex(5,60, +2+78*fator_redutivo+1);
        endShape(CLOSE);
        beginShape();
        vertex(-20, -5, -2-78*fator_redutivo-1);
        vertex(-12, 0, -2-78*fator_redutivo-1);
        vertex(-20, 5, -2-78*fator_redutivo-1);
        endShape(CLOSE);
        beginShape();
        vertex(20, -5, -2-78*fator_redutivo-1);
        vertex(12, 0, -2-78*fator_redutivo-1);
        vertex(20, 5, -2-78*fator_redutivo-1);
        endShape(CLOSE);
        beginShape();
        vertex(-5,-60, -2-78*fator_redutivo-1);
        vertex(0,-68, -2-78*fator_redutivo-1);
        vertex(5,-60, -2-78*fator_redutivo-1);
        endShape(CLOSE);
        beginShape();
        vertex(-5,60, -2-78*fator_redutivo-1);
        vertex(0,68, -2-78*fator_redutivo-1);
        vertex(5,60, -2-78*fator_redutivo-1);
        endShape(CLOSE);
        popMatrix();
      }
      if (this.frame_atual == 2) {
        fill(255);
        rect(width*(2.6/8.0), height*(1.0/8.0), width*(2.8/8.0), height/12, width/40);
        rect(width/20.0, height/4.0, width*(18/20.0), height*(4/6.0), width/40.0);
        fill(0, 102, 153);  
        textSize(width/30);
        text("Curvature on Curves", width*(2.2/6.5), height*(1/5.6));
        //
        fill(255);
        rect(width*(0.1), height*(0.25), width*(0.3), height*0.5, 0.025);


        //Curvature Simulation
        int ponto = int ((width*(0.8/8.0)+(ARDUINO.ard.analogRead(0)/1023.0)*(width*(6.4/8.0))));
        fill(0, 102, 153);
        textSize(width*(0.025));
        float curvatura = sin(ponto/(width*0.12))/pow(pow(cos(ponto/(width*0.12)), 2)+1, 3/2.0);
        text("Curvature = 1/R = "+nf(curvatura, 1, 3), width*(0.60), height*(0.30));
        float raio = int((1/curvatura)*width*0.12);
        noFill();

        stroke(0, 102, 153);
        strokeWeight(2);
        float der = -cos(ponto/(width*0.12));
        println(raio);
        println(der);
        float fator = raio/sqrt(1+pow(1/der, 2));
        println(fator);
        ellipse(ponto-fator*sgn(der), int((width*(0.42))+(width*0.12)*sin(ponto/(width*0.12)))+fator*(-1/abs(der)), raio*2, raio*2);
        stroke(204, 102, 0);

        for (int a = int(width*(0.8/8.0)); a<int(width*(7.2/8.0)); a++) {
          point(a, int((width*(0.42))+(width*0.12)*sin(a/(width*0.12))));
        }
        strokeWeight(8);
        stroke(0, 102, 153);
        point(ponto, int((width*(0.42))+(width*0.12)*sin(ponto/(width*0.12))));
      }
      if (this.frame_atual == 3) {
        fill(255);
        rect(width*(2.4/8.0), height*(1.0/8.0), width*(3.2/8.0), height/12, width/40);
        fill(0, 102, 153);  
        textSize(width/30);
        text("Curvature on Surfaces", width*0.32, height*(1/5.6));
        float angulo = (ARDUINO.ard.analogRead(0)/1023.0)*(2*PI);
        pushMatrix();
        translate(width*0.5, height*(0.55), 200);
        stroke(150);
        rotateX(PI/2*sin(millis()/5000.0));
        rotateZ(-PI/6);
        fill(255);
        strokeWeight(1);
        OBJETOS.CarregaParaboloideHiperbolico();
        fill(255,0,0,100);
        stroke(255,0,0);
        strokeWeight(2);
        beginShape();
        vertex(100*cos(angulo), 100*sin(angulo), 100);
        vertex(-100*cos(angulo), -100*sin(angulo), 100);
        vertex(-100*cos(angulo), -100*sin(angulo), -100);
        vertex(100*cos(angulo), 100*sin(angulo), -100);
        endShape(CLOSE);
        popMatrix();
        fill(0, 102, 153); 
        textSize(width*0.020);
        text("k1 = 1   k2 = -1   K = -1",width*0.70,height*0.95);
      }
      if (this.frame_atual == 4){
        fill(255);
        rect(width*(2.4/8.0), height*(1.0/8.0), width*(3.2/8.0), height/12, width/40);
        fill(0, 102, 153);  
        textSize(width/30);
        text("Cylinder-like surfaces", width*0.32, height*(1/5.6));
        textSize(width*0.020);
        text("k1 = 0   k2 = 1   K = 0",width*0.70,height*0.95);
        pushMatrix();
        translate(width*0.5, height*(0.55), 200);
        stroke(150);
        rotateX(PI/2*sin(millis()/5000.0));
        rotateZ(-PI/6);
        fill(255);
        strokeWeight(1);
        OBJETOS.CarregaCilindro();
        popMatrix();
        
      }
      if (this.frame_atual == 5){
        fill(255);
        rect(width*(2.6/8.0), height*(1.0/8.0), width*(2.8/8.0), height/12, width/40);
        fill(0, 102, 153);  
        textSize(width/30);
        text("Dome-Like Surfaces", width*0.34, height*(1/5.6));
        textSize(width*0.020);
        text("k1 = 1   k2 = 1   K = 1",width*0.70,height*0.95);
        pushMatrix();
        translate(width*0.5, height*(0.55), 200);
        stroke(150);
        rotateX(PI/2*sin(millis()/5000.0));
        rotateZ(-PI/6);
        fill(255);
        strokeWeight(1);
        OBJETOS.CarregaDomo();
        popMatrix();
        
      }
      if (this.frame_atual == 6){
        noStroke();
        fill(255);
        rect(width*(2.1/8.0), height*(1.0/8.0), width*(3.8/8.0), height/12, width/40);
        rect(width/20.0, height*0.22, width*(18/20.0), height*0.11, width/40.0);
        fill(0, 102, 153);  
        textSize(width/30);
        text("Gauss' Theorema Egregium", width*0.28, height*(1/5.6));
        textSize(width*0.024);
        text("\"The Gaussian curvature of a surface is invariant under local isometry.\"",width*0.08,height*0.29);
        image(pizza,width*(0.25),height*0.5,width*0.5,height*0.3);
        
      }
    }
  }
}