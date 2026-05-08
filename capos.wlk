import artefacto.*
import castillo.*

object rolando {
  const mochila = #{}
  var capacidadMochila = 2
  const property hogar = castilloDePiedra
  const property historialDeEncuentros = []
  
  method artefactos() = mochila
  
  method capacidadMochila() = capacidadMochila
  
  method incrementarCapacidad(capacidadExtra) {
    if (capacidadExtra < 0) self.error(
        "La capacidad a incrementar no puede ser negativa"
      )
    
    capacidadMochila += capacidadExtra
  }
  
  method hayCapacidad() = capacidadMochila > mochila.size()
  
  method encontrar(artefacto) {
    if (self.hayCapacidad()) self.recolectar(artefacto)
    
    self.registrarEnHistorial(artefacto)
  }
  
  method recolectar(artefacto) {
    if (not self.hayCapacidad()) self.error(
        "No se puede recolectar con la mochila llena"
      )
    
    mochila.add(artefacto)
  }
  
  method registrarEnHistorial(artefacto) {
    historialDeEncuentros.add(artefacto)
  }
  
  method llegarAlHogar() {
    if (self.hayArtefactos()) {
      hogar.guardar(self.artefactos())
      self.vaciarMochila()
    }
  }
  
  method hayArtefactos() = not mochila.isEmpty()
  
  method vaciarMochila() {
    mochila.clear()
  }
  
  method posesiones() = self.artefactos() + hogar.artefactos()
  
  method posee(artefacto) = self.posesiones().contains(artefacto)
}