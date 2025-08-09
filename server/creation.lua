local creation = {}
local tmp = {}

function creation:registerPlayerCreationDismantleCommand(src) 
  if not self:getPlayerCommandExecuted(src) then return end
  print('não passa')
end

function creation:isPlayerAlreadyCreatingDismantle(src) 
  return 
end

function creation:getPlayerCommandExecuted(src)
  return src ~= 0
end

RegisterCommand(_config.settings.command.name, creation.registerPlayerCreationDismantleCommand)