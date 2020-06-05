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
    version = "0.2",
    TomeOfDwarven = {
        ["a glass of"] = "a pint o'",
        ["a man"] = "a manling",
        ["a mount"] = "a mountable thin'",
        ["about"] = "abou'",
        ["acknowledge"] = "be recognizin'",
        ["actually"] = "rather",
        ["ago"] = "'go",
        ["agreed."] = "aye.",
        ["agriculture"] = "farmin'",
        ["almost"] = "almos'",
        ["alright"] = "awright",
        ["an elf"] = "a pointy-eared tree-'ugger",
        ["an orc"] = "a big greenskin",
        ["and like it or"] = "an' like it or",
        ["and like"] = "an'",
        ["and"] = "an'",
        ["annihilate"] = "anni'ilate",
        ["anyone"] = "any'un",
        ["appropriate"] = "a'right",
        ["are you"] = "be ye",
        ["are"] = "'re",
        ["aren't"] = "ain't",
        ["arent"] = "ain't",
        ["around"] = "'roun'",
        ["ass"] = "arse",
        ["asses"] = "arses",
        ["available"] = "free",
        ["awesome"] = "great",

        ["because"] = "'cause",
        ["be quiet"] = "hold yer tongue",
        ["been"] = "bin",
        ["before"] = "'fore",
        ["beginning"] = "startin'",
        ["being"] = "bein'",
        ["beside"] = "aside",
        ["between"] = "'tween",
        ["bitch"] = "wench",
        ["bitchy"] = "wenchy",
        ["bitching"] = "belly achin'",
        ["black orc"] = "big shield-carryin' greenskin",
        ["boy"] = "lad",
        ["boys"] = "lads",
        ["brawling"] = "fightin'",
        ["brb"] = "'old on a moment",
        ["breakfast"] = "ale",
        ["brilliant"] = "smart",
        ["buddies"] = "lads",
        ["buddy"] = "lad",
        ["butt"] = "arse",
        ["butts"] = "arses",

        ["can't"] = "canno'",
        ["cannot"] = "canno'",
        ["cant"] = "canno'",
        ["catapult"] = "rock throwin' contraption",
        ["chat"] = "chatter",
        ["child"] = "wee lad",
        ["combat"] = "fightin",
        ["combination"] = "mix",
        ["commence"] = "start",
        ["commander"] = "boss",
        ["communication"] = "talkin'",
        ["communicated"] = "told",
        ["compensation"] = "payback",
        ["complicated"] = "tough",
        ["conflict"] = "fight",
        ["congrats"] = "cheers",
        ["congratz"] = "cheers",
        ["connect"] = "join",
        ["converse"] = "yak",
        ["conversation"] = "blether",
        ["cool in"] = "cool in",
        ["cool out"] = "cool out",
        ["cool"] = "great",
        ["correct me"] = "say elsewise",
        ["correct"] = "aye",
        ["cowards"] = "pansies",
        ["cowardly"] = "yellow-bellied",
        ["coward"] = "pansy",
        ["crap"] = "rubbish",
        ["crazy"] = "daft",
        ["created"] = "made",
        ["create"] = "make",
        ["cute"] = "fine",

        ["deceptive"] = "shady",
        ["derived"] = "got",
        ["derive"] = "get",
        ["deriving"] = "gettin'",
        ["device"] = "contraption",
        ["didn't"] = "di'n't",
        ["didnt"] = "di'n't",
        ["diff"] = "diff'ren'",
        ["difficultly"] = "toughness",
        ["difficult"] = "tough",
        ["dinner"] = "ale",
        ["discontinue"] = "stop",
        ["discontinuing"] = "stoppin",
        ["dishonest"] = "dis'onest",
        ["dishonorable"] = "dis'onerable",
        ["disgusting"] = "fousome",
        ["doh"] = "ach!",
        ["dude"] = "lad",
        ["dudes"] = "lads",
        ["dwarf mount"] = "dwarfen choice o' ridin' contraption",
        ["dwarven"] = "dwarfen",
        ["dwarves"] = "dwarfs",

        ["elastic"] = "strechy",
        ["elves"] = "pointy-eared tree-'uggers",
        ["embark"] = "settin' off",
        ["enough"] = "'nuff",
        ["especially"] = "'specially",
        ["evening"] = "e'enin'",
        ["ever"] = "e'er",
        ["every"] = "e'ery",
        ["everything"] = "e'erythin'",
        ["exactly"] = "'zactly",
        ["except"] = "'cept",
        ["existence"] = "bein",
        ["explode"] = "'splode",
        ["extended"] = "long",
        ["extensively"] = "of'en",

        ["female"] = "lass",                              
        ["ferment"] = "brew",
        ["finally"] = "fine'ly",
        ["flee"] = "leg it",
        ["fleeing"] = "leggin' it",
        ["food"] = "ale",
        ["foolish"] = "daftlike",
        ["fool"] = "mutton-head",
        ["for"] = "fer",
        ["formulation"] = "mix",
        ["formula"] = "mix",
        ["foundation"] = "base",
        ["frequently"] = "of'n",
        ["friend"] = "lad",
        ["friends"] = "lads",
        ["friggin"] = "chuffin'",
        ["fuckin"] = "chuffin'",
        ["fuckin'"] = "chuffin'",
        ["fucking"] = "chuffin'",
        ["fundamental"] = "basic",

        ["gah"] = "ach!",
        ["genius"] = "smart lad",
        ["geniuses"] = "smart lads",
        ["gentlemen"] = "lads",
        ["get"] = "be gettin'",
        ["girl"] = "lass",
        ["go away"] = "off with ye",
        ["goblin"] = "small greenskin",
        ["goblins"] = "small greenskins",
        ["god"] = "Grungni",
        ["going to"] = "gonna",
        ["gotcha"] = "aye, I be understandin'",
        ["grats"] = "cheers",
        ["gratz"] = "cheers",
        ["grinding"] = "mine'lessly bashin' through",
        ["gross"] = "fousome",
        ["gun"] = "blunderbuss",
        ["guns"] = "boomsticks",
        ["guy"] = "lad",
        ["guys"] = "lads",

        ["habit"] = "'abit",
        ["habitat"] = "'abitat",
        ["handy"] = "'andy",
        ["harbor"] = "'arbor",
        ["hard"] = "'ard",
        ["has"] = "'as",
        ["have"] = "'ave",
        ["hate"] = "'ate",
        ["hated"] = "'ated",
        ["hates"] = "'ates",
        ["head"] = "'ed",
        ["healer"] = "'ealer",
        ["healers"] = "'ealers",
        ["hello"] = "oi",
        ["helmet"] = "'elmet",
        ["help"] = "'elp",
        ["helped"] = "'elped",
        ["helping"] = "'elpin'",
        ["her"] = "'er",
        ["herbalist"] = "'erbalist",
        ["herbalism"] = "flower stuff",
        ["here"] = "'ere",
        ["hey"] = "oi",
        ["he"] = "'e",
        ["hi"] = "oi",
        ["high elf"] = "pointy-eared tree-'ugger",
        ["high elves"] = "pointy-eared tree-'uggers",
        ["highelf"] = "pointy-eared tree-'ugger",
        ["highelves"] = "pointy-eared tree-'uggers",
        ["him"] = "'im",
        ["himself"] = "'isself",
        ["his self"] = "'isself",
        ["his"] = "'is",
        ["hit"] = "'it",
        ["hold"] = "'old",
        ["holds"] = "'olds",
        ["honor"] = "'onor",
        ["honorable"] = "'onorable",
        ["honorably"] = "'onorably",
        ["hopefully"] = "'opefully",
        ["horsemanship"] = "'orse ridin'",
        ["how"] = "'ow",
        ["human"] = "manling",
        ["humans"] = "manlings",
        ["human paladin"] = "manling 'ealer",
        ["human priest"] = "manling 'ealer",
        ["hunter"] = "'unter",
        ["hunters"] = "'unters",
        ["hurt"] = "'urt",
        ["hurts"] = "'urts",

        ["i agree"] = "aye",
        ["i am"] = "I be",
        ["i can buy"] = "I be buyin'",
        ["i can find"] = "I be findin'",
        ["i don't care"] = "I ain't care none",
        ["i dont care"] = "I ain't care none",
        ["i'm back"] = "I've returned",
        ["i'm"] = "I be",
        ["idiot"] = "mutton-head",
        ["if"] = "if'n",
        ["im back"] = "I've returned",
        ["im"] = "I be",
        ["imagine"] = "'magine",
        ["immediately"] = "firs'",
        ["indeed"] = "aye",
        ["inf"] = "influence",
        ["intellectual"] = "smart",
        ["intelligence"] = "brains",
        ["intelligent"] = "smart",
        ["into"] = "inta",
        ["is"] = "be",
        ["isn't it"] = "innit",
        ["isn't"] = "ain't",
        ["is not"] = "ain't",
        ["it will"] = "it'll",
        ["it's like"] = "it be abou'",
        ["it's only human"] = "tha' be manlin' thinkin'",
        ["it's"] = "it be",
        ["its like"] = "it be abou'",
        ["its"] = "it be",

        ["just"] = "jus'",

        ["k"] = "awright",
        ["kid"] = "wee lad",
        ["kids"] = "wee lads",
        ["kill"] = "be killin'",
        ["kk"] = "a'right",
        ["know"] = "be knowin'",

        ["little"] = "li'l",
        ["leader"] = "boss",
        ["listen"] = "lis'n",
        ["little"] = "wee",
        ["lmao"] = "hahaha",
        ["locate"] = "find",
        ["lol"] = "haha",
        ["lots"] = "heaps",
        ["lovely"] = "fine",

        ["malevolent"] = "bad",
        ["man"] = "lad",
        ["mankind"] = "manlings",
        ["material"] = "stuff",
        ["maybe"] = "per'aps",
        ["mhm"] = "aye",
        ["mmhmm"] = "aye",
        ["money"] = "gold",
        ["morning"] = "morn",
        ["mouth"] = "yaphole",
        ["my"] = "me",
        ["myself"] = "meself",

        ["necessary"] = "needed",
        ["never"] = "ne'er",
        ["nightelf"] = "tree-'ugger",
        ["nelf"] = "tree-'ugger",
        ["nightelves"] = "tree-'uggers",
        ["numerous"] = "many",

        ["of"] = "o'",
        ["ok"] = "a'right",
        ["okay"] = "a'right",
        ["old"] = "ol'",
        ["on top of"] = "atop",
        ["one"] = "'un",
        ["ones"] = "'uns",
        ["op"] = "priv'liged",
        ["opaque"] = "clowdy",
        ["opponent"] = "enemy",
        ["or like"] = "or",
        ["orcs"] = "big greenskins",
        ["orc"] = "big greenskin",
        ["otherwise"] = "elsewise",
        ["out of"] = "outta",
        ["outrageous"] = "ova da top",

        ["pal"] = "lad",
        ["pals"] = "lads",
        ["peeps"] = "lads",
        ["peepz"] = "lads",
        ["people"] = "folk",
        ["peoples"] = "lads",
        ["peoplez"] = "lads",
        ["personally"] = "meself",
        ["person's"] = "one's",
        ["pq"] = "public quest",
        ["pqs"] = "public quests",
        ["precisely"] = "'zactly",
        ["presume"] = "s'pose",
        ["pretty much"] = "mor'or less",
        ["pretty"] = "fine",
        ["probably"] = "likely",
        ["problems"] = "woes",
        ["produce"] = "make",
        ["production"] = "makin'",
        ["puzzled"] = "confused",
        ["pvp"] = "combat situations",

        ["quite"] = "mighty",

        ["ran"] = "legged it",
        ["repaired"] = "fix'd",
        ["repair"] = "fix",
        ["requirements"] = "needs",
        ["requirement"] = "need",
        ["requires"] = "needs",
        ["required"] = "needed",
        ["require"] = "need",
        ["restored"] = "fix'd",
        ["restore"] = "fix",
        ["rofl"] = "hahaha",
        ["ruler"] = "boss",

        ["second"] = "secon'",
        ["seconds"] = "secon's",
        ["several"] = "many",
        ["shouldn't"] = "shou'nt",
        ["should"] = "shou'd",
        ["shut up"] = "shut th' yaphole",
        ["skag"] = "skagrotho",
        ["small"] = "wee",
        ["sneaky"] = "picky-fingered",
        ["soda"] = "ale",
        ["some more"] = "some'ore",
        ["some"] = "som'",
        ["something"] = "somethin'",
        ["stackin"] = "focusin' on",
        ["stacking"] = "focusin' on",
        ["static"] = "whistlin' an' cracklin'",
        ["strategy"] = "plan",
        ["stupid"] = "daftlike",
        ["sup"] = "oi",
        ["suppose"] = "s'pose",
        ["sub-par"] = "lackin'",
        ["subpar"] = "lackin'",
        ["substantial"] = "mighty",
        ["supposed"] = "s'posed",
        ["symptoms"] = "signs",
        ["symptom"] = "sign",

        ["talking"] = "chatterin'",
        ["thank god"] = "thank goodness",
        ["thank you"] = "awful kind o' ye",
        ["thanks"] = "thank ye",
        ["than"] = "'n",
        ["that's"] = "tha's",
        ["that"] = "tha'",
        ["them"] = "'em",
        ["then"] = "'n",
        ["the"] = "th'",
        ["thing"] = "thin'",
        ["think"] = "be thinkin'",
        ["those"] = "them",
        ["thus"] = "so",
        ["to"] = "t'",
        ["to correct"] = "t' correct",
        ["to dinner"] = "t' th' ale 'ouse",
        ["together"] = "t'gether",
        ["ton"] = "lot",
        ["tons"] = "lots",
        ["tournament"] = "tourn'y",
        ["toward"] = "t'ward",
        ["troops"] = "lads",
        ["ty"] = "thank ye",
        ["type"] = "sort",

        ["ugly"] = "foul",
        ["umm"] = "uhh",
        ["um"] = "uh",
        ["underneath"] = "'neath",
        ["understanding"] = "'nderstan'",
        ["understands"] = "'nderstan's",
        ["understand"] = "'nderstan'",
        ["unless"] = "lest",
        ["until"] = "'til",
        ["up for grabs"] = "up fer takin'",
        ["up for sale"] = "up fer buyin'",
        ["up for"] = "dwarf 'nuff t'",
        ["useless"] = "feckless",

        ["very next"] = "next",
        ["very"] = "mighty",
        ["via"] = "by",

        ["want"] = "be wantin'",
        ["wb"] = "welcome back",
        ["weaknesses"] = "weak points",
        ["we're"] = "we'er",
        ["were"] = "'er",
        ["we are"] = "we'er",
        ["what's up with"] = "wha's botherin'",
        ["what's up to"] = "wha's up t'",
        ["what's up"] = "oi",
        ["what's"] = "wha's",
        ["whatever"] = "wha'e'er",
        ["what"] = "wha'",
        ["whats up with"] = "wha's botherin'",
        ["whats up to"] = "wha's up t'",
        ["whats up"] = "oi",
        ["whats"] = "wha's",
        ["will"] = "'ll",
        ["withdrawal"] = "wi'drawal",
        ["without"] = "wi'out",
        ["with"] = "wi'",
        ["woman"] = "lass",
        ["women"] = "lasses",
        ["woot"] = "cheers!",
        ["worthless"] = "feckless",
        ["wouldn't"] = "wou'nt",
        ["would"] = "wou'd",
        ["wtf"] = "what in the name of Azeroth",

        ["yah"] = "aye",
        ["yeah"] = "aye",
        ["yes"] = "aye",
        ["you"] = "ye",
        ["you are"] = "ye'er",
        ["you level up"] = "ye rank up",
        ["you level"] = "ye rank up",
        ["you'd"] = "ye'd",
        ["you're"] = "ye'er",
        ["your"] = "yer",
        ["yourself"] = "yerself",
    },
    TomeOfDwarvenSlang = {
        ["([^n ])en%f[%A]"] = "%1'n",
        ["([^n ])hood%f[%A]"] = "%1'ood",
        ["([^n ])ing%f[%A]"] = "%1in'",
    }
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

        for key, value in pairs(DwarfTalk.TomeOfDwarven) do
            if (key == loweroldword:match("%a+")) then
                dwarfedword = loweroldword:gsub(key, value)
            end
        end

        if (dwarfedword == "") then
            dwarfedword = loweroldword
        end

        for key, value in pairs(DwarfTalk.TomeOfDwarvenSlang) do
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
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00C8FFDwarfTalk v"..DwarfTalk.version.."\n|r"..formateddt.." |cFFFFEE00on|r - enable DwarfTalk\n"..formateddt.." |cFFFFEE00off|r - disable DwarfTalk\n"..formateddt.." |cFFFFEE00list|r - list disabled channels\n"..formateddt.."|r |cFFFFEE00disable|r |cFFFF0000CHANNEL_NAME|r - disable a channel\n"..formateddt.." |cFFFFEE00enable|r |cFFFF0000CHANNEL_NAME|r - enable a disabled channel.")
        elseif options[1] == "on" then
            DEFAULT_CHAT_FRAME:AddMessage("DwarfTalk is now ACTIVE.")
        elseif options[1] == "off" then
            DEFAULT_CHAT_FRAME:AddMessage("DwarfTalk is now INACTIVE.")
        elseif options[1] == "list" then
            DEFAULT_CHAT_FRAME:AddMessage("Disabled Channels:")
            for key, value in ipairs(DwarfTalk_Config.DISABLEDCHANNELS) do
                DEFAULT_CHAT_FRAME:AddMessage(">"..value)
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
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00C8FFDwarfTalk v"..DwarfTalk.version.." |r loaded -- status:"..status);
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
        if (not DwarfTalk_HasValue(DwarfTalk_Config.DISABLEDCHANNELS, string.upper(system))) then
            msg = DwarfTalk.Translate(msg)
        end
    end
    DwarfTalk_SendChatMessageHook(msg, system, language, channel)
end

if (SendChatMessage ~= DwarfTalk_SendChatMessage) then
    DwarfTalk_SendChatMessageHook = SendChatMessage
    SendChatMessage = DwarfTalk_SendChatMessage
end