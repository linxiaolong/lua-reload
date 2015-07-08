
local M = {}

local function _replace(old, new, repeat_tbl)
    if repeat_tbl[old] then
        return
    end
    repeat_tbl[old] = true

    --收集该删除的
    local dellist = {}
    for k, v in pairs(old) do
        if not new[k] then
            table.insert(dellist, k)
        end
    end
    for _, v in ipairs(dellist) do
        old[v] = nil
    end

    --增加和替换
    for k, v in pairs(new) do
        if not old[k] then
            old[k] = new[k]
        else
            if type(old[k]) ~= type(new[k]) then
                print(string.format('warning: attr %s old type no equal new type!!!', k))
                old[k] = new[k]

            else
                if type(old[k]) == 'table' then
                    _replace(old[k], new[k], repeat_tbl)
                else
                    old[k] = new[k]
                end

            end
        end
    end
end

function M.reload(mod)
    if not package.loaded[mod] then
        local m = require(mod)
        return m
    end
    print('begin reload!!!')

    local old = package.loaded[mod]
    package.loaded[mod] = nil
    local new = require(mod)

    if type(old) == 'table' and type(new) == 'table' then
        print('pick object in new module to old module!!!')
        local repeat_tbl = {}
        _replace(old, new, repeat_tbl)
    end

    package.loaded[mod] = old
    print('finish reload!!!')
    return old
end

return M

