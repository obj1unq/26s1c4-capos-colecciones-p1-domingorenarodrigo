import mochila.*
import castillo.*
import artefacto.*
import historial.*

object rolando {
  const mochilaContenedora = mochila
  const hogar = castilloDePiedra
  const historialDeEncuentros = historial
  
  method artefactosEnMochila() = mochilaContenedora.artefactos()

  method artefactosEnHogar() = hogar.artefactos() 

  method artefactosEnHistorial() = historialDeEncuentros.artefactos()
  
  method encontrar(artefacto) {
    if (mochilaContenedora.tieneCapacidad()) self.recolectar(artefacto)
    
    historialDeEncuentros.registrar(artefacto)
  }
  
  method recolectar(artefacto) {
    mochilaContenedora.guardarArtefacto(artefacto)
  }
  
  method llegarAlHogar() {
    if (mochilaContenedora.tieneArtefactos()) self.dejarArtefactos()
  }
  
  method dejarArtefactos() {
    hogar.guardarArtefactos(mochilaContenedora.artefactos())
    mochilaContenedora.vaciar()
  }

  method posesiones() = self.artefactosEnMochila() + self.artefactosEnHogar()
  
  method posee(artefacto) = self.posesiones().contains(artefacto)
}