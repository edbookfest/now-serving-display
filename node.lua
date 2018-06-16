util.init_hosted()

gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

node.alias("now-serving")

local font
local logo_asset_name
local logo
local queue_on = true
local serving = ''

node.event("content_update", function(filename, file)
    if filename == "config.json" then
        if CONFIG.auto_resolution then
            gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)
        else
            gl.setup(CONFIG.width, CONFIG.height)
        end
        font = CONFIG.font
        if CONFIG.logo.asset_name ~= logo_asset_name then
            logo_asset_name = CONFIG.logo.asset_name
            logo = resource.load_image(logo_asset_name, TRUE)
        end
    end
end)

util.data_mapper {
    ["serving"] = function(value)
        serving = value
    end;
    ["queue"] = function(value)
        if value == "true" then
            queue_on = true
        else
            queue_on = false
        end
    end
}

local function centerText(text, size, y)
    local width = font:width(text, size)
    local x = (WIDTH / 2) - (width / 2);
    font:write(x, y, text, size, CONFIG.font_colour.rgba())
end

function node.render()
    CONFIG.background_colour.clear()
    local margin = 50
    local logo_height = 100
    local logo_w, logo_h = logo:size()
    local logo_ratio = logo_w / logo_h
    util.draw_correct(logo, WIDTH - (margin + (logo_ratio * logo_height)), margin, WIDTH - margin, margin + logo_height)

    if queue_on then
        centerText(CONFIG.queue_on_text, 150, 250)
        centerText(serving, 400, 460)
    else
        centerText(CONFIG.queue_off_text, 100, 350)
    end
end
