local component = require("component")
local device_names = {
    "9921336b-0214-402a-85be-f03eaa864f13" = "Energy Bank 1",
    "fccf9042-b8a6-45d6-850c-4b2502a32081" = "Energy Bank 2",
    "b54ccde6-9895-4992-a7a8-0988cc979b28" = "Energy Bank 3",
    "ef28db82-3c9d-4d23-a70b-a30ac65e47d5" = "Energy Bank 4",
}

function dev_by_type(type)
    devs = {}
    for k, v in component.list() do
        if v == type then
            table.insert(devs, k)
        end
    end
    return devs
end

function get_display_screen_id()
    devs = dev_by_type("screen")
    for i=1,#devs do
        screen = component.proxy(devs[i])
        x, y = screen.getAspectRatio()
        if x > 1 and y > 1 then
            return devs[i]
        end
    end

    return nil
end

function progress_bar(gpu, x, y, current, max)

end

for k, v in pairs(dev_by_type("energy_device")) do
    print(device_names[v])
    print(v)
end