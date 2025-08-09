local Proxy = module('vrp', 'lib/Proxy')
local vRP = Proxy.getInterface('vRP')

_config = {}

-- global settings 

_config.settings = {
  command = { 
    name = 'dismantle',
    permission = {},
  },
  notify = { 
    event = "Notify",
    time = 5e3,
    types = { 
      success = "sucesso",
      warning = "aviso",
      denied = "negado",
    }
  }
}

-- functions

_config.actions = {
  hasPermission = vRP.hasPermission,
  getUserId = vRP.getUserId
}