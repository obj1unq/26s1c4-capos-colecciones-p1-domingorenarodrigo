object mochilaDeRolando {
  const property artefactos = #{}
  var property capacidad = 2
  
  method capacidad(_capacidad) {
    if (_capacidad < 0) self.error(
      "No se puede configurar una capacidad negativa"
    )

    capacidad = _capacidad
  }
  
  method incrementarCapacidad(capacidadExtra) {
    if (capacidadExtra < 0) self.error(
        "La capacidad a incrementar no puede ser negativa"
      )
    
    capacidad += capacidadExtra
  }
  
  method tieneCapacidad() = capacidad > artefactos.size()
  
  method poseeArtefactos() = not artefactos.isEmpty()
  
  method guardar(artefacto) {
    if (not self.puedeGuardar()) self.error(
        "La mochila no tiene capacidad para guardar un nuevo artefacto"
      )
    
    artefactos.add(artefacto)
  }
  
  method puedeGuardar() = self.tieneCapacidad()

  method vaciar() {
    artefactos.clear()
  }
}