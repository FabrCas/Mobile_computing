--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:09181e4e6a8200896e62452d1cce34a7:16b058180b59befe777a8acce6521387:26c5741f71857e186fb2fbf9f3507265$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- c0
            x=1,
            y=1,
            width=320,
            height=480,

        },
        {
            -- c1
            x=323,
            y=1,
            width=320,
            height=480,

        },
        {
            -- c2
            x=645,
            y=1,
            width=320,
            height=480,

        },
        {
            -- c3
            x=967,
            y=1,
            width=320,
            height=480,

        },
        {
            -- c4
            x=1289,
            y=1,
            width=320,
            height=480,

        },
        {
            -- c5
            x=1,
            y=483,
            width=320,
            height=480,

        },
        {
            -- c6
            x=323,
            y=483,
            width=320,
            height=480,

        },
        {
            -- c7
            x=645,
            y=483,
            width=320,
            height=480,

        },
        {
            -- c8
            x=967,
            y=483,
            width=320,
            height=480,

        },
        {
            -- c9
            x=1289,
            y=483,
            width=320,
            height=480,

        },
        {
            -- c10
            x=1,
            y=965,
            width=320,
            height=480,

        },
        {
            -- c11
            x=323,
            y=965,
            width=320,
            height=480,

        },
        {
            -- c12
            x=645,
            y=965,
            width=320,
            height=480,

        },
        {
            -- c14
            x=967,
            y=965,
            width=320,
            height=480,

        },
    },

    sheetContentWidth = 1610,
    sheetContentHeight = 1446
}

SheetInfo.frameIndex =
{

    ["c0"] = 1,
    ["c1"] = 2,
    ["c2"] = 3,
    ["c3"] = 4,
    ["c4"] = 5,
    ["c5"] = 6,
    ["c6"] = 7,
    ["c7"] = 8,
    ["c8"] = 9,
    ["c9"] = 10,
    ["c10"] = 11,
    ["c11"] = 12,
    ["c12"] = 13,
    ["c14"] = 14,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
