Interface INTERFACE = new Interface();
class Interface {

  String tmp_text="";
  float valor_scroll = -30.0;
  float valor_setas = 0;

  float rotacao_z = 0.0;

  int x_ref = 0;
  int y_ref = 0;
  int x_relativo = 0;
  int y_relativo = 0;

  boolean mouse_clicked = false;

  Interface() {

  }
  void Referencia() {
    
    rotateZ(INTERFACE.rotacao_z);
    translate(INTERFACE.x_relativo, INTERFACE.y_relativo, INTERFACE.valor_scroll*10);
  }
  void ScrollPlus() {
    valor_scroll++;
    if(valor_scroll>0){valor_scroll = 0;}
  }
  void ScrollMinus() {
    valor_scroll--;
    if(valor_scroll<-50){valor_scroll = -50;}
    
  }
  void DeletaString() {
    this.tmp_text="";
  }
  String RetornaString() {
    return this.tmp_text;
  }
  float RetornaScroll() {
    return this.valor_scroll;
  }
  void ZeraScroll() {
    this.valor_scroll = 0;
  }
  void VerificaCodigo(String codigo) {
  }
}
void keyPressed() {
  //Geral
  //Especifico
  if ((key>='a'&&key<='z')||key==' '||key=='.'||(key>='A'&&key<='Z')||(key>='0'&&key<='9')||key=='ç'||key=='!'||key=='?') {
    INTERFACE.tmp_text += str(key);
    TAREFAS.TarefaLetra(key);
  }
  if (keyCode == DOWN) {
    TAREFAS.TarefaCodigo("BAIXO");
  } else if (keyCode == LEFT) {
    TAREFAS.TarefaCodigo("ESQUERDA");
  } else if (keyCode == RIGHT) {
    TAREFAS.TarefaCodigo("DIREITA");
  } else if (keyCode == UP) {
    TAREFAS.TarefaCodigo("CIMA");
  } else if (keyCode == ENTER) {
    TAREFAS.TarefaCodigo("ENTER");
  } 
  if (key==DELETE) {
    INTERFACE.DeletaString();
  }
  if (key==BACKSPACE) {
    if (INTERFACE.tmp_text.length() > 0) {
      INTERFACE.tmp_text = INTERFACE.tmp_text.substring(0, INTERFACE.tmp_text.length() - 1);
    }
  }
}
void mousePressed() {
  TAREFAS.TarefaCodigo("MOUSEPRESSED");
}
void mouseDragged() {
  TAREFAS.TarefaCodigo("MOUSEDRAGGED");
}
void mouseClicked() {

  INTERFACE.mouse_clicked = true;
  TAREFAS.TarefaCodigo("MOUSECLICKED");
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e>0) {
    //println(mouseX+" "+mouseY);
    INTERFACE.ScrollPlus();
  } else {
    INTERFACE.ScrollMinus();
  }
}