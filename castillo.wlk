object castilloDePiedra {
  const almacen = #{}
  
  method artefactos() = almacen

  method guardar(artefactos) {
    artefactos.forEach({ artefacto => almacen.add(artefacto) })
  }
}