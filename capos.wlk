import artefacto.*

object rolando {
  const mochila = #{}
  var capacidadMochila = 2
  
  method artefactos() = mochila
  
  method capacidadMochila() = capacidadMochila
  
  method incrementarCapacidad(_capacidadExtra) {
    if (_capacidadExtra < 0) self.error(
        "La capacidad a incrementar no puede ser negativa"
      )
    
    capacidadMochila += _capacidadExtra
  }
  
  method hayCapacidad() = capacidadMochila > mochila.size()
  
  method encontrar(artefacto) {
    if (self.hayCapacidad()) self.recolectar(artefacto)
  }
  
  method recolectar(artefacto) {
    if (not self.hayCapacidad()) self.error(
        "No se puede recolectar con la mochila llena"
      )
    
    mochila.add(artefacto)
  }
}