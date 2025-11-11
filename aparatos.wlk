// APARATO - Clase Abstracta
class Aparato {
    var color
    method color() = color
    method cambiarColor(nuevoColor) { color = nuevoColor }
    method puedeSerUsadoPor(paciente)
    method efectoSobre(paciente)
    method serUsadoPor(paciente) {
        self.efectoSobre(paciente)
        self.registrarUso(paciente)
    }
    method registrarUso(paciente)
    method necesitaMantenimiento()
    method realizarMantenimiento()
}

// MAGNETO
class Magneto inherits Aparato {
    var imantacion
    method imantacion() = imantacion
    override method puedeSerUsadoPor(paciente) = true
    override method efectoSobre(paciente) {
        paciente.disminuirDolor(paciente.dolor() * 0.10)
    }
    override method registrarUso(paciente) {
        imantacion = imantacion - 1
    }
    override method necesitaMantenimiento() = imantacion < 100
    override method realizarMantenimiento() {
        imantacion = imantacion + 500
    }
}

// BICICLETA
class Bicicleta inherits Aparato {
    var desajustesTornillos
    var perdidasAceite
    method desajustesTornillos() = desajustesTornillos
    method perdidasAceite() = perdidasAceite
    override method puedeSerUsadoPor(paciente) = paciente.edad() > 8
    override method efectoSobre(paciente) {
        paciente.disminuirDolor(4)
        paciente.aumentarFortaleza(3)
    }
    override method registrarUso(paciente) {
        if (paciente.dolor() > 30) {
            desajustesTornillos = desajustesTornillos + 1
            if (paciente.edad().between(30, 50)) {
                perdidasAceite = perdidasAceite + 1
            }
        }
    }
    override method necesitaMantenimiento() {
        return desajustesTornillos >= 10 or perdidasAceite >= 5
    }
    override method realizarMantenimiento() {
        desajustesTornillos = 0
        perdidasAceite = 0
    }
}

// MINITRAMP
class Minitramp inherits Aparato {
    override method puedeSerUsadoPor(paciente) = paciente.dolor() < 20
    override method efectoSobre(paciente) {
        const aumento = paciente.edad() * 0.10
        paciente.aumentarFortaleza(aumento)
    }
    override method registrarUso(paciente) {}
    override method necesitaMantenimiento() = false
    override method realizarMantenimiento() {}
}