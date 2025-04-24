Config = {}

Config.Discord = {
    active = false,
    webhookavatar = "https://cdn2.iconfinder.com/data/icons/frosted-glass/256/Danger.png",
    webhookname = "Anti Cheat",
    lang = {
        kick = "Kicked for: ",
        warn = "Warning: "
    }
}


-- This is a Role DB check. Alerts if a role has changed. (This is VORP specific, disable if you are not using VORP)
Config.DB = {
    active = true,
    adminpingrate = 50000,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for DB changes
    rolechecks = {
        "admin", "helper", "re", "mod"
    },
    lang = {
        discord = {
            title = "DB Group Change",
            description = "Players group has been changed to admin!",
            playername = "Player name",
            steam = "Steam identifier",
            character = "Character identifier"
        }
    }
}

Config.XSS = {
    active = true,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for XSS attempts
    lang = {
        reason = "XSS Injection Attempt Detected",
        update = "Validating Steam Username",
        kick = "You cant join due to your username"
    }
}

Config.Speed = {
    active = false,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for speed hacks
    lang = {
        reason = "Speed Hacking"
    }
}

Config.ResourceInject = {
    active = true,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for resource injection
    lang = {
        reason = "Cheat Menu Detected"
    }
}

Config.Net = {
    active = false,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for network violations
    allowedoffenses = 2,
    checkinrate = 5000, -- Milisecond
    kickrate = 20000,
    lang = {
        kickreason = "You must be connected to the internet."
    }
}

Config.AFK = {
    active = true,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for AFK violations
    kicktime = 5400, -- Seconds
    warntime = 5100, -- Seconds
    lang = {
        kick = "You will be kicked in ",
        kick2 = " for AFK",
        hours = " hours",
        minutes = " minutes",
        seconds = " seconds",
        kickreason = "AFK",
        whitelist = {
            id = "You must include a user id",
            wladded = "User Added to Whitelist",
            wlremoved = "User Removed from Whitelist",
            err = "An Error has Occurred"
        }
    }
}

Config.SpamClick = {
    active = false,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for spam clicking
    infractions = 0,
    maxspaminfractions = 5,
    spamsensitivity = 250, -- Higher is less sensitive
    lang = {
        kickreason = "Spam Clicking",
        warning = "You are spam clicking! This will lead to being kicked."
    }
}

Config.KickOnResourceStop = {
    active = false,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for resource stopping
    lang = {
        kickreason = "Stop Resource Detected",
        warning = "Stoping resources is not allowed"
    }
}

Config.Objects = { -- Anti Spawn Object
    active = false,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for object spawning
    blacklist = {}
}

-- A check to ensure no one is using Infinite ammo
Config.InfiniteAmmo = {
    active = false,
    action = "kick", -- Options: "kick", "warn"
    webhook = "" -- Discord webhook URL for infinite ammo
}

Config.Weapons = { -- Blacklist Weapon and Anti Infinte Ammo
    active = false,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for weapon violations
    blacklistlist = {}
}

Config.PlayerStatus = { -- Anti Change Health
    active = false,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for health hacks
    health = 600,       -- Default Value (2088 = Golden Core Health)
    lang = {
        kickreason = "Player health hack detected"
    }
}

Config.FX = {
    active = false,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for FX violations
    limit = 5, -- Default Value (5)
    fxWhitelist = {
        -- "EXAMPLE",
        -- Add other fx event names here
    },
    lang = {
        kickreason = 'Player %s caused event %s too many times with data %s', sender, eventName, eventDataString
    }
}

Config.Commands = { -- Blacklisted commands. This can be used to blacklist cheat menu commands
    active = false,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for command violations
    list = {
        "lynx",
        "test:exp",
        "get:playerid",
        "test",
        "bomb",
        "test:aimbot",
        "kms"
    },
    lang = {
        kickreason = "Cheat command detected"
    }
}

Config.Keys = { -- Blacklist certain keys from being pressed. This can be used to blacklist cheat menu keys
    active = true,
    action = "warn", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for key violations
    list = {
        {{47, 21}, "Shift + G Keys"},             -- Known cheat combos
        {{21, 113}, "Shift + F2"},  -- Used for Steam Overlay - Remove if causing issues.
        {{21, 114}, "Shift + F3"},
        {{21, 115}, "Shift + F4"},
        {{21, 119}, "Shift + F8"},
        {{19, 113}, "Ctrl + F2"},
        {{19, 114}, "Ctrl + F3"},
        {{19, 115}, "Ctrl + F4"},
        {{19, 119}, "Ctrl + F8"},
        {{19, 96},  "Ctrl + NumPad 0"},
        {{19, 101}, "Ctrl + NumPad 5"},
        {{19, 36},  "Ctrl + Home"},
        {{19, 45},  "Ctrl + Insert"},
        {{19, 46},  "Ctrl + Delete"},
        {{19, 33},  "Ctrl + PageUp"},
        {{19, 34},  "Ctrl + PageDown"}
    },
    lang = {
        kickreason = "Cheat Menu detected"
    }
}

Config.Textures = {
    active = false,
    action = "kick", -- Options: "kick", "warn"
    webhook = "", -- Discord webhook URL for texture violations
    list = {},
    lang = {
        kickreason = "Cheat texture detected"
    }
}
