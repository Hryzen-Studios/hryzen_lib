local framework = require 'modules/framework'

if framework.Name == 'qbx' or framework.Name == 'qbcore' then
    AddEventHandler('QBCore:Server:PlayerLoaded', function(player)
        TriggerEvent('hryzen_lib:framework:playerLoaded', player.PlayerData.source)
        TriggerClientEvent('hryzen_lib:framework:playerLoaded', player.PlayerData.source)
    end)

    AddEventHandler('QBCore:Server:OnPlayerUnload', function(source)
        TriggerEvent('hryzen_lib:framework:playerUnloaded', source)
        TriggerClientEvent('hryzen_lib:framework:playerUnloaded', source)
    end)
elseif framework.Name == 'esx' then
    AddEventHandler('esx:playerLoaded', function(playerId)
        TriggerEvent('hryzen_lib:framework:playerLoaded', playerId)
        TriggerClientEvent('hryzen_lib:framework:playerLoaded', playerId)
    end)

    AddEventHandler('esx:playerLogout', function(playerId)
        TriggerEvent('hryzen_lib:framework:playerUnloaded', playerId)
        TriggerClientEvent('hryzen_lib:framework:playerUnloaded', playerId)
    end)
else
    CreateThread(function()
        while true do
            error('Missing Framework Runtime setup for framework: ' .. tostring(framework.Name))
            Wait(5000)
        end
    end)
end
