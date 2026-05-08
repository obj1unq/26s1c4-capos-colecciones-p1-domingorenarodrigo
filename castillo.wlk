object castilloDePiedra {
  const property artefactos = #{}
  
  method guardarArtefactos(_artefactos) {
    _artefactos.forEach({ artefacto => self.guardarArtefacto(artefacto) })
  }

  method guardarArtefacto(artefacto) {
    artefactos.add(artefacto)
  }
}