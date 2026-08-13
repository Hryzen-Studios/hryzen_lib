local log = require 'utils/logger'

if IsDuplicityVersion() then
    if not lib.checkDependency('ox_lib', '3.20.0', true) then
        error('ox_lib v3.20.0 or higher is required for hryzen_lib to function properly.')
    end

    log.info('hryzen_lib - Initialized')
else
    return
end
