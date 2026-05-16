import mochila.*
import castillo.*
import artefacto.*
import historial.*

object rolando {
  const mochila = mochilaDeRolando
  const hogar = castilloDePiedra
  const historial = historialDeEncuentros
  var property poderBase = 5
  
  method posesionesEnMochila() = mochila.artefactos()
  
  method posesionesEnHogar() = hogar.artefactos()
  
  method historialDeEncuentros() = historial.artefactos()
  
  method capacidadMochila(_capacidad) {
    mochila.capacidad(_capacidad)
  }
  
  method incrementarCapacidadMochila(capacidadExtra) {
    mochila.incrementarCapacidad(capacidadExtra)
  }

    method poderBase(_poderBase) {
    if (_poderBase < 0) self.error(
        "No se puede configurar un poder base negativo"
      )
    
    poderBase = _poderBase
  }
  
  method incrementarPoderBase(poderExtra) {
    if (poderExtra < 0) self.error(
        "El poder a incrementar no puede ser negativo"
      )
    
    poderBase += poderExtra
  }
  
  method encontrar(artefacto) {
    if (self.puedeRecolectar()) self.recolectar(artefacto)
    
    historial.registrar(artefacto)
  }
  
  method puedeRecolectar() = mochila.tieneCapacidad()
  
  method recolectar(artefacto) {
    if (not self.puedeRecolectar()) self.error(
        "La mochila no tiene capacidad para recolectar un nuevo artefacto"
      )
    
    mochila.guardar(artefacto)
  }
  
  method llegarAlHogar() {
    if (mochila.poseeArtefactos()) self.dejarArtefactos()
  }
  
  method dejarArtefactos() {
    hogar.guardarArtefactos(self.posesionesEnMochila())
    mochila.vaciar()
  }
  
  method posesiones() = self.posesionesEnMochila() + self.posesionesEnHogar()
  
  method posee(artefacto) = self.posesiones().contains(artefacto)
}