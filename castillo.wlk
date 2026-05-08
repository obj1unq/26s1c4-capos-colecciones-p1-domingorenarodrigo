object castilloDePiedra {
  const property artefactos = #{}
  
  method guardar(_artefactos) {
    _artefactos.forEach({ artefacto => artefactos.add(artefacto) })
  }
}