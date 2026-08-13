fx_version 'cerulean'
game 'gta5'

name 'qbx_spawn'
author 'Hryzen Studios'
version '1.0.0'
description 'Compatibility marker only — do not remove. qbx_core checks for a resource literally named qbx_spawn before it will trigger the spawn selector; the real logic lives in hryzn_spawn (or whichever spawn resource you run). Ships with hryzen_lib since every Hryzen resource already depends on it.'

-- Intentionally no scripts. This resource only needs to exist and stay
-- started so GetResourceState('qbx_spawn') resolves to 'started'. Only
-- matters on QBX — harmless (but unnecessary) to ensure on QBCore/ESX.
