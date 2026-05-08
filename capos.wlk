import mochila.*
import castillo.*
import artefacto.*

object rolando {
  const mochilaContenedora = mochila
  const hogar = castilloDePiedra
  const property historialDeEncuentros = []
  
  method artefactosEnMochila() = mochilaContenedora.artefactos()

  method artefactosEnHogar() = hogar.artefactos() 
  
  method encontrar(artefacto) {
    if (mochilaContenedora.tieneCapacidad()) self.recolectar(artefacto)
    
    self.registrarEnHistorial(artefacto)
  }
  
  method recolectar(artefacto) {
    mochilaContenedora.guardarArtefacto(artefacto)
  }
  
  method registrarEnHistorial(artefacto) {
    historialDeEncuentros.add(artefacto)
  }
  
  method llegarAlHogar() {
    if (mochilaContenedora.tieneArtefactos()) self.dejarArtefactos()
  }
  
  method dejarArtefactos() {
    hogar.guardarArtefactos(mochilaContenedora.artefactos())
    mochilaContenedora.vaciar()
  }

  method posesiones() = self.artefactosEnMochila() + self.artefactosEnHogar()()
  
  method posee(artefacto) = self.posesiones().contains(artefacto)
}