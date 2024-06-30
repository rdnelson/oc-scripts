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
        x, y = devs[i].getAspectRatio()
        if x > 1 and y > 1 then
            return devs[i]
        end
    end

    return nil
end

function progress_bar(gpu, x, y, current, max)

end
