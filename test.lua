
local M = {}

--test normal
M.a = 555

function M.b(i, j)
    print('555', i, j)
end

M.d = 'ABCDEF'

M.e = {
A = {
    a = 7,
    b = 7,
    c = {
        7, 7, 7
    }
},

B = {
    a2 = 7,
    b2 = 7,
},

C = 7
}

--test class
local cl = {}
M.cl = cl
cl.__index = cl

function cl.new()
    local self = {}
    self.m_a = 1
    self.m_b = 2
    setmetatable(self, cl)
    return self
end

function cl:test_reloadA(a, b, c, d)
    print(self, 'version4', a, b)
end

function cl.test_reloadB()
    print('version4', a, b, c)
    local a = 99
    print(a)
end

return M

