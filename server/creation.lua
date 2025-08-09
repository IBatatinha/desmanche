batatinha.actions.prepare('desmanche/select_dismantle_user_creations', 'SELECT creations FROM batatinha_dismantle WHERE userId = @userId')

--  variables

local creation = {}

-- code

RegisterCommand(batatinha.settings.command.name, function(src)
  if creation:isCommandExecutedInServer(src) then return end
  if not creation:isPlayerStartedSomeProcess(src) then return end
  if creation:isPlayerHasPermission(src) and creation:isPlayerReachCreation(src) then 
    creation:startPlaterCreationDismantle(src)
  end
end)

function creation:startPlaterCreationDismantle(src)
  self.setPlayerState(src, 'creating', true)
end

function creation:isPlayerReachCreation(src) 
  if batatinha.settings.command.limitCreation then
    if type(batatinha.settings.command.limitCreation) ~= 'number' then return end
    if self.getPlayerLimit(src) >= batatinha.settings.command.limitCreation then 
      TriggerClientEvent(batatinha.settings.notify.event, src, batatinha.settings.notify.types.denied, "You don't create more dismantles, because you reach in creation limit.", batatinha.settings.notify.defaultTime)
      return
    end
  end
  return ''
end


function creation.getPlayerLimit(src)
  local userId = batatinha.actions.getUserId(src)
  local consult = batatinha.actions.query('desmanche/select_dismantle_user_creations', { userId = userId })

  if consult[1] then
    return batatinha.actions.parseInt(consult[1].creations)
  end

  return 0
end

--  functions

function creation:isCommandExecutedInServer(src) 
  return not self.getCommandExecuted(src)
end

function creation.getCommandExecuted(src)
  return src ~= 0
end

function creation.getPlayerState(src, name)
  return Player(src).state[tostring(name)]
end

function creation:isPlayerStartedSomeProcess(src)
  if self.getPlayerState(src, 'creating') then
    TriggerClientEvent(batatinha.settings.notify.event, src, batatinha.settings.notify.types.warning, 'You already have one creation  in process.', batatinha.settings.notify.defaultTime)
    return
  end
  return ''
end

function creation.setPlayerState(src, name, value) 
  if not value then return end
  Player(src).state:set(tostring(name), value, true)
end

function creation:isPlayerHasPermission(src) 
  if batatinha.settings.command.permission then
    if type(batatinha.settings.command.permission) == 'table' then
      for _, permission in pairs(batatinha.settings.command.permission) do
        if self.getPlayerPermission(src, permission) then
          return ''
        end
      end
    end
    return self.getPlayerPermission(src, batatinha.settings.command.permission)
  end
  return ''
end

function creation.getPlayerPermission(src, perm)
  local userId = batatinha.actions.getUserId(src)
  return batatinha.actions.hasPermission(userId, tostring(perm))
end
