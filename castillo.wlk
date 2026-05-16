object castilloDePiedra {
  const property artefactos = #{}
  
  method guardarArtefactos(_artefactos) {
    _artefactos.forEach({ artefacto => self.guardar(artefacto) })
  }

  method guardar(artefacto) {
    artefactos.add(artefacto)
  }
}