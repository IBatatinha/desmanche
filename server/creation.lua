local creation = {}

local function registerPlayerCreationDismantleCommand(src) 
  if not creation.getPlayerCommandExecuted(src) then return end
  if creation:getPlayerAlreadyStartedDismantleCreation(src) then 
    if creation:getPlayerPermission(src) then 
      print('passou?')
    end
  end
end

function creation:getPlayerPermission(src)
  if not self.getPlayerCommandAllowPermission() then
    if self.getPlayerCommandPermissions() then 
      for _, permissions in pairs(_config.settings.command.permission) do 
        if self.isPlayerHasPermission(src, permissions) then 
          return ''
        end
      end
    end
    return self.isPlayerHasPermission(src, tostring(_config.settings.command.permission))
  end
  return ''
end

function creation:getPlayerCommandAllowPermission() 
  return type(_config.settings.command.permission) == 'boolean'
end

function creation:getPlayerCommandPermissions() 
  return type(_config.settings.command.permission) == 'table'
end

function creation:isPlayerHasPermission(src, perm) 
  local userId = _config.actions.getUserId(src);
  return _config.actions.hasPermission(userId, perm)
end

function creation:getPlayerAlreadyStartedDismantleCreation(src) 
  if self.isPlayerAlreadyCreatingDismantle(src) then
    TriggerClientEvent(_config.settings.notify.event, src, _config.settings.notify.types.denied, 'You already have one creation in process.', _config.settings.notify.time)
    return
  end
  return ''
end

function creation.isPlayerAlreadyCreatingDismantle(src) 
  return Player(src).state.creatingStarted
end

function creation.getPlayerCommandExecuted(src)
  return src ~= 0
end

RegisterCommand(_config.settings.command.name, registerPlayerCreationDismantleCommand)