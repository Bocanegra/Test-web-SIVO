class SecurityFilters {

  def filters = {

    loginCheck(controller: 'administrator', action: '*') {
      before = {
        if ((!session.name && actionName != "login") || (actionName == "logout")) {
          redirect(uri: "/administrator/singin.gsp")
          return false
        }
      }
    }

    loginCheck(controller: 'user', action: '*') {
      before = {
        if (!session.name && actionName != "queryUser") {
          redirect(uri: "/administrator/singin.gsp")
          return false
        }
      }
    }

  }

}
