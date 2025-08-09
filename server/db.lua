batatinha.actions.prepare('desmanche/create_batatinha_dismantle', 'CREATE TABLE IF NOT EXISTS `batatinha_dismantle` (`id` INT(11) NOT NULL, `userId` INT(11) NOT NULL, `creations` tinyint(4) NOT NULL DEFAULT "0", PRIMARY KEY (`id`, `userId`)) ENGINE=InnoDB DEFAULT CHARSET=latin1;')

CreateThread(function()
  Wait(500)
  batatinha.actions.execute('desmanche/create_batatinha_dismantle')
end)