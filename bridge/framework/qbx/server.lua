local bridge = {}

local types = require 'utils/types'
local QBX = exports.qbx_core

--- Structure the central character object
local function structureResponse(data)
    return types.character({
        identifier = data.PlayerData.citizenid,
        source = data.PlayerData.source,
        firstname = data.PlayerData.charinfo.firstname,
        lastname = data.PlayerData.charinfo.lastname,
        jobName = data.PlayerData.job.name,
        jobLabel = data.PlayerData.job.label,
        jobGrade = data.PlayerData.job.grade,
        jobs = data.PlayerData.jobs, -- QBX supports holding multiple jobs at once
        metadata = data.PlayerData.metadata,
    })
end

bridge.Name = 'qbx'

function bridge.GetPlayer(source)
    local player = QBX:GetPlayer(source)
    if not player then return false end

    return structureResponse(player)
end

function bridge.GetPlayerFromIdentifier(identifier)
    local player = QBX:GetPlayerByCitizenId(identifier)
    if not player then return false end

    return structureResponse(player)
end

function bridge.GetPlayers()
    local data = {}
    local players = QBX:GetQBPlayers()

    for _, player in pairs(players) do
        data[#data + 1] = structureResponse(player)
    end

    return data
end

function bridge.HasJob(source, jobName)
    local player = QBX:GetPlayer(source)
    if not player then return false end

    if player.PlayerData.job.name == jobName then return true end

    return (player.PlayerData.jobs or {})[jobName] ~= nil
end

function bridge.GetMetaDataValue(source, key)
    return QBX:GetMetadata(source, key)
end

function bridge.SetMetaDataValue(source, key, value)
    return QBX:SetMetadata(source, key, value)
end

return bridge
