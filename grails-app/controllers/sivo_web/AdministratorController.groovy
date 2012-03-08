package sivo_web

class AdministratorController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [administratorInstanceList: Administrator.list(params), administratorInstanceTotal: Administrator.count()]
  }

  def create = {
    def administratorInstance = new Administrator()
    administratorInstance.properties = params
    return [administratorInstance: administratorInstance]
  }

  def save = {
    def administratorInstance = new Administrator(params)
    if (administratorInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'administrator.label', default: 'Administrator'), administratorInstance.id])}"
      redirect(action: "show", id: administratorInstance.id)
    }
    else {
      render(view: "create", model: [administratorInstance: administratorInstance])
    }
  }

  def show = {
    def administratorInstance = Administrator.get(params.id)
    if (!administratorInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrator.label', default: 'Administrator'), params.id])}"
      redirect(action: "list")
    }
    else {
      [administratorInstance: administratorInstance]
    }
  }

  def edit = {
    def administratorInstance = Administrator.get(params.id)
    if (!administratorInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrator.label', default: 'Administrator'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [administratorInstance: administratorInstance]
    }
  }

  def update = {
    def administratorInstance = Administrator.get(params.id)
    if (administratorInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (administratorInstance.version > version) {

          administratorInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'administrator.label', default: 'Administrator')] as Object[], "Another user has updated this Administrator while you were editing")
          render(view: "edit", model: [administratorInstance: administratorInstance])
          return
        }
      }
      administratorInstance.properties = params
      if (!administratorInstance.hasErrors() && administratorInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'administrator.label', default: 'Administrator'), administratorInstance.id])}"
        redirect(action: "show", id: administratorInstance.id)
      }
      else {
        render(view: "edit", model: [administratorInstance: administratorInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrator.label', default: 'Administrator'), params.id])}"
      redirect(action: "list")
    }
  }

  def delete = {
    def administratorInstance = Administrator.get(params.id)
    if (administratorInstance) {
      try {
        administratorInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'administrator.label', default: 'Administrator'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'administrator.label', default: 'Administrator'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrator.label', default: 'Administrator'), params.id])}"
      redirect(action: "list")
    }
  }

  def login = {
    println params
    println request
    def admin = new Administrator(params)
    def administratorInstance = Administrator.findByNameAndPassword(params.name, params.password.encodeAsMD5())
    if (!administratorInstance) {
      flash.login = "fail"
      render(template: "login", model: [admin: admin])
    } else {
      session.name = administratorInstance.name
      session.password = administratorInstance.password
      render(template: "indexAdmin")
    }
  }

  def logout = {
    session.name = ""
    session.password = ""
    render(template: "login")
  }

  def viewUsers = {
    render(template: "viewUsers")
  }

  def viewMachines = {
    render(template: "viewMachines")
  }

  def createMachine = {
    render(template: "createMachine")
  }

  def createUser = {
    render(template: "createUser")
  }

  def listMachines = {
    def machineInstanceList = Machine.list()
    render(template: "listMachines", model: [machineInstanceList: machineInstanceList])
  }



  def showUser = {
    def userInstance = User.get(params.id)
    render(template: "showUser", model: [userInstance: userInstance])
  }

  def showMachine = {
    def machineInstance = Machine.get(params.id)
    render(template: "showMachine", model: [machineInstance: machineInstance])
  }

  def putLogo = {
    render(template: "logo")
  }

  def showAddMachineDiv = {
    def userInstance = User.get(params.id)
    render(template: "addNewMachine", model: [userInstance: userInstance])
  }

  def confirmMachine = {
    def machineInstance = Machine.get(params.id)
    render(template: "confirmMachine", model: [machineInstance: machineInstance])
  }

  def deleteMachine = {
    def machineInstance = Machine.get(params.id)
    if (machineInstance) {
      try {
        machineInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'machine.label', default: 'Machine'), params.id])}"
        redirect(action: "listMachines")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'machine.label', default: 'Machine'), params.id])}"
        redirect(action: "showMachine", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'machine.label', default: 'Machine'), params.id])}"
      redirect(action: "listMachine")
    }
  }

  def saveMachine = {
    def machineInstance = new Machine(params)
    if (machineInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'machine.label', default: 'Machine'), machineInstance.id])}"
      render(template: "showMachine", model: [machineInstance: machineInstance])
    }
    else {
      render(template: "createMachine", model: [machineInstance: machineInstance, misErrores: "Hay errores en el formulario, no est&aacute;n permitidos campos vacios"])
    }
  }

  def editMachine = {
    def machineInstance = Machine.get(params.id)
    render(template: "editMachine", model: [machineInstance: machineInstance])
  }

  def updateMachine = {
    def machineInstance = Machine.get(params.id)
    if (machineInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (machineInstance.version > version) {

          machineInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'machine.label', default: 'Machine')] as Object[], "Another user has updated this Machine while you were editing")
          render(template: "editMachine", model: [machineInstance: machineInstance])
          return
        }
      }
      machineInstance.properties = params
      if (!machineInstance.hasErrors() && machineInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'machine.label', default: 'Machine'), machineInstance.id])}"
        redirect(action: "showMachine", id: machineInstance.id)
      }
      else {
        render(template: "editMachine", model: [machineInstance: machineInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'machine.label', default: 'Machine'), params.id])}"
      redirect(action: "listMachines")
    }
  }

  def confirmUser = {
    def userInstance = User.get(params.id)
    render(template: "confirmUser", model: [userInstance: userInstance])
  }

  def deleteUser = {
    def userInstance = User.get(params.id)
    if (userInstance) {
      try {
        userInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
        redirect(action: "listUsers")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
        redirect(action: "showUser", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
      redirect(action: "listUser")
    }
  }

  def saveUser = {
    def userInstance = new User(params)
    if (userInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
      render(template: "showUser", model: [userInstance: userInstance])
    }
    else {
      render(template: "createUser", model: [userInstance: userInstance, misErrores: "Hay errores en el formulario, no est&aacute;n permitidos campos vacios"])
    }
  }

  def editUser = {
    def userInstance = User.get(params.id)
    render(template: "editUser", model: [userInstance: userInstance])
  }

  def updateUser = {
    def userInstance = User.get(params.id)
    if (userInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (userInstance.version > version) {

          userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
          render(template: "editUser", model: [userInstance: userInstance])
          return
        }
      }
      userInstance.properties = params
      if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
        redirect(action: "showUser", id: userInstance.id)
      }
      else {
        render(template: "editUser", model: [user: userInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
      redirect(action: "listUsers")
    }
  }

  def addMachineToUser = {
    def machineInstance = new Machine(params)
    machineInstance.save(flush: true)
    def userInstance = User.get(params.id)
    redirect(action: "updateUser", params: [id: userInstance.id, name: userInstance.name, password: userInstance.password, machines: machineInstance.id])
  }
}
