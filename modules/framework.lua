if IsDuplicityVersion() then
    local frameworkName = require 'utils/detect'
    local bridge = require('bridge.framework.' .. frameworkName .. '.server')

    return bridge
else
    local logger = require 'utils/logger'
    logger.warn('The Framework module is server side only. Importing on client will have no effect.')

    return
end
