// PACIENTE - Clase Base
class Paciente {
    var edad
    var dolor
    var fortaleza
    const rutina = []
    method edad() = edad
    method dolor() = dolor
    method fortaleza() = fortaleza
    method rutina() = rutina
    method cambiarEdad(nuevaEdad) { edad = nuevaEdad }
    method disminuirDolor(cantidad) {
        dolor = (dolor - cantidad).max(0)
    }
    method aumentarFortaleza(cantidad) {
        fortaleza = fortaleza + cantidad
    }
    method puedeHacerRutina() {
        return rutina.all({aparato => aparato.puedeSerUsadoPor(self)})
    }
    method realizarSesion() {
        self.usarAparatos()
        self.efectoAdicionalSesion()
    }
    method usarAparatos() {
        rutina.forEach({aparato => aparato.serUsadoPor(self)})
    }
    method efectoAdicionalSesion() {}
}

// PACIENTE RESISTENTE
class PacienteResistente inherits Paciente {
    override method efectoAdicionalSesion() {
        const cantidadAparatos = rutina.size()
        self.aumentarFortaleza(cantidadAparatos)
    }
}

// PACIENTE CAPRICHOSO
class PacienteCaprichoso inherits Paciente {
    override method puedeHacerRutina() {
        return super() and self.tieneAparatoRojo()
    }
    method tieneAparatoRojo() {
        return rutina.any({aparato => aparato.color() == "rojo"})
    }
    override method realizarSesion() {
        2.times( super() )
    }
}

// PACIENTE RAPIDA RECUPERACION
class PacienteRapidaRecuperacion inherits Paciente {
    override method efectoAdicionalSesion() {
        self.disminuirDolor(decrementoDolor.valor())
    }
}

object decrementoDolor {
    var valor = 3
    
    method valor() = valor
    method cambiarValor(nuevoValor) { valor = nuevoValor }
}