ArduinoData ARDUINO = new ArduinoData();
class ArduinoData {
  Arduino ard;
  void Inicializa(Arduino ard) {
    this.ard = ard;
    for (int i = 0; i <= 53; i++) {
      this.ard.pinMode(i, Arduino.INPUT);
    }
    this.ard.pinMode(1, this.ard.INPUT);
    this.ard.pinMode(0, this.ard.INPUT);
  }
}