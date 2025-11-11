// CENTRO DE KINESIOLOGIA
object centroKinesiologia {
    const aparatos = #{}
    const pacientes = #{}
    method aparatos() = aparatos
    method pacientes() = pacientes
    method agregarAparato(aparato) {
        aparatos.add(aparato)
    }
    method agregarPaciente(paciente) {
        pacientes.add(paciente)
    }
    method coloresAparatos() {
        return aparatos.map({aparato => aparato.color()}).asSet()
    }
    method pacientesMenores8() {
        return pacientes.filter({paciente => paciente.edad() < 8})
    }
    method cantidadPacientesQueNoPuedenCumplir() {
        return self.pacientesQueNoPuedenCumplir().size()
    }
    method pacientesQueNoPuedenCumplir() {
        return pacientes.filter({paciente => not paciente.puedeHacerRutina()})
    }
    method estaEnOptimasCondiciones() {
        return aparatos.all({aparato => not aparato.necesitaMantenimiento()})
    }
    method estaComplicado() {
        const cantidadQueNecesitan = self.aparatosQueNecesitanMantenimiento().size()
        return cantidadQueNecesitan >= aparatos.size() / 2
    }
    method aparatosQueNecesitanMantenimiento() {
        return aparatos.filter({aparato => aparato.necesitaMantenimiento()})
    }
    method visitaTecnico() {
        self.aparatosQueNecesitanMantenimiento().forEach({aparato => 
            aparato.realizarMantenimiento()
        })
    }
}