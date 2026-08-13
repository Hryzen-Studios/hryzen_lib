local config = require 'config'

--- Resolves config.Framework to a concrete framework name ('qbx', 'qbcore',
--- 'esx'). If config.Framework is 'auto', detects it via GetResourceState —
--- safe to call from either the client or the server, unlike the Framework
--- module itself, which stays server-only to keep player data authoritative.
local function detectFramework()
    if config.Framework ~= 'auto' then
        return config.Framework
    end

    if GetResourceState('qbx_core') == 'started' then
        return 'qbx'
    elseif GetResourceState('qb-core') == 'started' then
        return 'qbcore'
    elseif GetResourceState('es_extended') == 'started' then
        return 'esx'
    end

    error('hryzen_lib: could not auto-detect a supported framework (qbx_core, qb-core, es_extended not running). Set Framework explicitly in config.lua.')
end

return detectFramework()
