import mochila.*
import castillo.*
import artefacto.*
import historial.*

object rolando {
  const mochila = mochilaDeRolando
  const hogar = castilloDePiedra
  const historial = historialDeEncuentros
  
  method posesionesEnMochila() = mochila.artefactos()
  
  method posesionesEnHogar() = hogar.artefactos()

  method historialDeEncuentros() = historial.artefactos()
  
  method capacidadMochila(_capacidad) {
    mochila.capacidad(_capacidad)
  }
  
  method incrementarCapacidadMochila(capacidadExtra) {
    mochila.incrementarCapacidad(capacidadExtra)
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
    hogar.guardarArtefactos(mochila.artefactos())
    mochila.vaciar()
  }
  
  method posesiones() = self.posesionesEnMochila() + self.posesionesEnHogar()
  
  method posee(artefacto) = self.posesiones().contains(artefacto)
}