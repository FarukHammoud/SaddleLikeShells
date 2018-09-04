Tarefas TAREFAS = new Tarefas();

class Tarefas {

  //Vetor Tarefa por Letra e Codigo
  String[] tarefa_letra = new String[512];
  String[] tarefa_codigo = new String[512];
  String[] codigo = new String[512];
  int indice_codigo = 0;
  //Inicialização
  Tarefas() {
    for (int a = 0; a < this.tarefa_letra.length; a++) {

      this.tarefa_letra[a] = "";
      this.tarefa_codigo[a] = "";
      this.codigo[a]= "";
    }
  }

  //Função Tarefa

  void AlteraTarefaLetra(String tarefa, char letra) {

    this.tarefa_letra[int(letra)] = tarefa;
  }
  void AlteraTarefaCodigo(String tarefa, String n_codigo) {

    this.tarefa_codigo[this.indice_codigo] = tarefa;
    this.codigo[this.indice_codigo] = n_codigo;
    this.indice_codigo++;
  }
  void Tarefa(String tarefa) {
    if (tarefa == "") {
      //Livre Execução
    }
    if (tarefa == "Ativa Frame Mapa") {
      FRAMES.AtivaFrame(500);
    }
    if (tarefa == "Ativa Frame Base") {
      FRAMES.AtivaFrame(0);
    }
    if (tarefa == "Estabelece Referência") {
      INTERFACE.x_ref=mouseX;
      INTERFACE.y_ref=mouseY;
    }
    if (tarefa == "Estabelece Arraste Mouse") {
      INTERFACE.x_relativo+=(mouseX-INTERFACE.x_ref);
      INTERFACE.y_relativo+=(mouseY-INTERFACE.y_ref);
      INTERFACE.x_ref=mouseX;
      INTERFACE.y_ref=mouseY;
    }
    if (tarefa == "Rotacionar Sentido Anti-horario") {
      INTERFACE.rotacao_z -= PI/18;
    }
    if (tarefa == "Rotacionar Sentido Horario") {
      INTERFACE.rotacao_z += PI/18;
    }
    if (tarefa == "CIMA - Bloco de Mapa") {
      if (MAPA.bloco_y != 0) {
        MAPA.bloco_y--;
      }
    }
    if (tarefa == "Retorna Slide") {
      FRAMES.FRAME_Base.frame_atual--;
    }
    if (tarefa == "BAIXO - Bloco de Mapa") {
      if (MAPA.bloco_y != MAP_MAX/50 - 1) {
        MAPA.bloco_y++;
      }
    }
    if (tarefa == "Avanca Slide") {
      FRAMES.FRAME_Base.frame_atual++;
  
    }
  }
  void TarefaLetra(char letra) {
    //println(int(letra));
    this.Tarefa(this.tarefa_letra[int(letra)]);
  }

  void TarefaCodigo(String texto) {
    for (int a = 0; a<256; a++) {
      if (this.codigo[a] == texto) {
        this.Tarefa(this.tarefa_codigo[a]);
      }
    }
  }
}