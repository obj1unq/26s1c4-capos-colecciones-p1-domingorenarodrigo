object mochila {
  const property artefactos = #{}
  var capacidad = 2
  
  method capacidad() = capacidad
  
  method incrementarCapacidad(capacidadExtra) {
    if (capacidadExtra < 0) self.error(
        "La capacidad a incrementar no puede ser negativa"
      )
    
    capacidad += capacidadExtra
  }
  
  method tieneCapacidad() = capacidad > artefactos.size()
  
  method tieneArtefactos() = not artefactos.isEmpty()
  
  method guardarArtefacto(artefacto) {
    if (not self.tieneCapacidad()) self.error(
        "La mochila no tiene capacidad para un nuevo artefacto"
      )
    
    artefactos.add(artefacto)
  }
  
  method vaciar() {
    artefactos.clear()
  }
}