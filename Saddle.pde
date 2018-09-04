import cc.arduino.*;
import org.firmata.*;

import processing.serial.*;

import cc.arduino.*;


Arduino ard;
PImage poli;
PImage calatrava;
PImage pizza;


import camera3D.*;
import camera3D.generators.*;
import camera3D.generators.util.*;
import processing.net.*;





//DEFINES
int MAP_MAX = 1000;

//Funções Anexas
void Definicoes() {
  
  TAREFAS.AlteraTarefaCodigo("Estabelece Referência", "MOUSEPRESSED");
  TAREFAS.AlteraTarefaCodigo("Estabelece Arraste Mouse", "MOUSEDRAGGED");
  TAREFAS.AlteraTarefaCodigo("Avanca Slide", "DIREITA");
  TAREFAS.AlteraTarefaCodigo("Retorna Slide", "ESQUERDA");
  TAREFAS.AlteraTarefaLetra("Rotacionar Sentido Anti-horario", 'q');
  TAREFAS.AlteraTarefaLetra("Rotacionar Sentido Horario", 'e');
  TAREFAS.AlteraTarefaLetra("Rotacionar Sentido Anti-horario", 'Q');
  TAREFAS.AlteraTarefaLetra("Rotacionar Sentido Horario", 'E');
  TAREFAS.AlteraTarefaLetra("CIMA - Bloco de Mapa", 'W');
  TAREFAS.AlteraTarefaLetra("ESQUERDA - Bloco de Mapa", 'A');
  TAREFAS.AlteraTarefaLetra("BAIXO - Bloco de Mapa", 'S');
  TAREFAS.AlteraTarefaLetra("Avanca Slide", 'D');
  TAREFAS.AlteraTarefaLetra("CIMA - Bloco de Mapa", 'w');
  TAREFAS.AlteraTarefaLetra("Retorna Slide", 'a');
  TAREFAS.AlteraTarefaLetra("BAIXO - Bloco de Mapa", 's');
  TAREFAS.AlteraTarefaLetra("DIREITA - Bloco de Mapa", 'd');
  TAREFAS.Tarefa("Ativa Frame Base");
  OBJETOS.DefineTorre();
  OBJETOS.DefineAgua1();
  OBJETOS.DefineGrama1();
  OBJETOS.DefineRocha1();
  OBJETOS.DefineCasa();
  OBJETOS.DefineCubo();
  ARDUINO.Inicializa(ard);
  textureMode(NORMAL);
  noCursor();
}

//Funções Main
void setup() {
  size(1024,768,P3D);
  poli = loadImage("poli.png");
  calatrava = loadImage("calatrava.jpg");
  pizza = loadImage("pizza.png");
  ard = new Arduino(this, Arduino.list()[0], 57600);
  Definicoes();
}
void draw() {
  FRAMES.Mostrar();
  lights();
  directionalLight(0, 255, 0, 0, -1, 0);
}