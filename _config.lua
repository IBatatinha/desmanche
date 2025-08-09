-- framework

local Proxy = module('vrp', 'lib/Proxy')
local vRP = Proxy.getInterface('vRP')

-- tables

batatinha = {}
batatinha.settings = {}
batatinha.actions = {}

-- settings 

batatinha.settings.command = {
  name = 'dismantle',
  permission = 'manager.permissao', -- comment this line, case you want disable the permission, but you want to put more permissions change the '' to {}.
  limitCreation = 3
}

batatinha.settings.notify = {
  event = 'Notify',
  defaultTime = 5e3, 
  types = { 
    success = 'sucesso',
    denied = 'negado',
    warning = 'aviso'
  }
}

-- framework functions 

batatinha.actions.hasPermission = vRP.hasPermission
batatinha.actions.getUserId = vRP.getUserId
batatinha.actions.prompt = vRP.prompt
batatinha.actions.request = vRP.request
batatinha.actions.prepare = vRP._prepare
batatinha.actions.query = vRP.query
batatinha.actions.execute = vRP._execute

batatinha.actions.parseInt = function(value)
  local number = tonumber(value)
  if number then 
    return math.floor(number)
  end
  return 0
end