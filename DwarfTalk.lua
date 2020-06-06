-- DwarfTalk, translate your mundane manling words into fancy dwarf words.
-- Ported from Baobab's Warhammer addon by wizardfingers
-- Helpers
local DwarfTalk_HasValue
DwarfTalk_HasValue = function (tab, val)
    for key, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end
local DwarfTalk_GetKey
DwarfTalk_GetKey = function (tab, val)
    for key, value in ipairs(tab) do
        if value == val then
            return key
        end
    end
    return nil
end

-- DwarfTalk
DwarfTalk = {
    version = "0.3",
    TomeOfCommon = DwarfTalkTomes.TomeOfCommon,
    TomeOfSlang = DwarfTalkTomes.TomeOfSlang
}

DwarfTalk.LowerCasePattern = function (s)
    s = string.gsub (s, "%a", function (c) return string.format("%s", string.lower(c)) end)
    return s
end
DwarfTalk.UpperCasePattern = function (s)
    s = string.gsub (s, "%a", function (c) return string.format("%s", string.upper(c)) end)
    return s
end

DwarfTalk.Translate = function (original)
    local result = ""
    local translated = original

    for oldword in string.gmatch(translated, "%S+") do
        local loweroldword = DwarfTalk.LowerCasePattern(oldword)
        local upperoldword = DwarfTalk.UpperCasePattern(oldword)
        local dwarfedword = ""

        for key, value in pairs(DwarfTalk.TomeOfCommon) do
            if (key == loweroldword:match("%a+")) then
                dwarfedword = loweroldword:gsub(key, value)
            end
        end

        if (dwarfedword == "") then
            dwarfedword = loweroldword
        end

        for key, value in pairs(DwarfTalk.TomeOfSlang) do
            dwarfedword = dwarfedword:gsub(key, value)
        end

        if (oldword == upperoldword) then
            dwarfedword = DwarfTalk.UpperCasePattern(dwarfedword)
        elseif (oldword:match("%a") == upperoldword:match("%a")) then
            dwarfedword = dwarfedword:gsub("%a", string.upper, 1)
        end

        result = result .. " " .. dwarfedword
    end
    return result;
end

DwarfTalk_OnLoad = function ()
    if not DwarfTalk_Config then
        DwarfTalk_Config = {
            ON = true,
            DISABLEDCHANNELS = {}
        }
    end
    
    SLASH_DWARFTALK1 = "/dt"
    SLASH_DWARFTALK2 = "/dwarftalk"
    SlashCmdList["DWARFTALK"] = function (option)
        local options = {}
        local searchResult = { string.match(option,"^(%S*)%s*(.-)$") }
        for i, v in pairs(searchResult) do
            if (v ~= nil and v ~= "") then
                options[i] = string.lower(v)
            end
        end

        if #options == 0 or options[1] == "help" then
            DwarfTalk_Config.DISABLEDCHANNELS = {}
            local formateddt = "|cFF00FF00/dt|r"
            local status = "|cFF00FF00ON|r"
            if not DwarfTalk_Config.ON then
                status = "|cFFFF0000OFF|r"
            end
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00C8FFDwarfTalk|r - STATUS: "..status.."\n"..formateddt.." |cFFFFEE00on|r - enable DwarfTalk\n"..formateddt.." |cFFFFEE00off|r - disable DwarfTalk\n"..formateddt.." |cFFFFEE00list|r - list disabled channels\n"..formateddt.."|r |cFFFFEE00disable|r |cFFFF0000CHANNEL_NAME|r - disable a channel\n"..formateddt.." |cFFFFEE00enable|r |cFFFF0000CHANNEL_NAME|r - enable a disabled channel.")
        elseif options[1] == "on" then
            DwarfTalk_Config.ON = true
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00C8FFDwarfTalk|r is now |cFF00FF00ON|r.")
        elseif options[1] == "off" then
            DwarfTalk_Config.ON = false
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00C8FFDwarfTalk|r is now |cFFFF0000OFF|r.")
        elseif options[1] == "list" then
            DEFAULT_CHAT_FRAME:AddMessage("Disabled Channels:")
            for key, value in ipairs(DwarfTalk_Config.DISABLEDCHANNELS) do
                DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00>|r|cFFFFEE00"..value.."|r")
            end
        elseif #options == 2 then
            local option2 = string.upper(options[2])
            if options[1] == "disable" then
                if not DwarfTalk_HasValue(DwarfTalk_Config.DISABLEDCHANNELS, option2) then
                    table.insert(DwarfTalk_Config.DISABLEDCHANNELS, option2)
                end
                DEFAULT_CHAT_FRAME:AddMessage("Disabled |cFFFF0000"..option2.."|r")
            elseif options[1] == "enable" then
                local index = DwarfTalk_GetKey(DwarfTalk_Config.DISABLEDCHANNELS, option2)
                
                if index ~= nil then
                    table.remove(DwarfTalk_Config.DISABLEDCHANNELS, index)
                end
                DEFAULT_CHAT_FRAME:AddMessage("Enabled |cFF00FF00"..option2.."|r")
            end
        end
    end
    local status = "|cFF00FF00ON|r"
    if not DwarfTalk_Config.ON then
        status = "|cFFFF0000OFF|r"
    end
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00C8FFDwarfTalk v"..DwarfTalk.version.." |r ready - STATUS: "..status)
end

local DwarfTalk_SendChatMessage
local DwarfTalk_SendChatMessageHook
DwarfTalk_SendChatMessage = function (msg, system, language, channel)
    if DwarfTalk_Config.ON then
        if (not msg) then
            msg = ""
        end
        if (not system) then
            system = "SAY"
        end
        if (not DwarfTalk_HasValue(DwarfTalk_Config.DISABLEDCHANNELS, string.upper(system)) and string.sub(msg, 1,1) ~= "_") then
            msg = DwarfTalk.Translate(msg)
        elseif string.sub(msg, 1,1) == "_" then
            msg = string.sub(msg, 2, #msg)
        end
    end
    DwarfTalk_SendChatMessageHook(msg, system, language, channel)
end

if (SendChatMessage ~= DwarfTalk_SendChatMessage) then
    DwarfTalk_SendChatMessageHook = SendChatMessage
    SendChatMessage = DwarfTalk_SendChatMessage
end