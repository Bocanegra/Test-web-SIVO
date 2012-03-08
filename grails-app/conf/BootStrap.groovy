import sivo_web.Administrator

class BootStrap {

  def init = {servletContext ->
    // Si no existe el administrador del sistema se crea
    def admin = Administrator.findByName("admin")
    if (!admin) {
      admin = new Administrator (name:"admin", password:"21232f297a57a5a743894a0e4a801fc3")
      admin.save()
    }

    }
    def destroy = {
    }
  }
