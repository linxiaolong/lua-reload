
local Test = require 'test'
local Imp = require 'imp'

local M = {}

--test reference

--cant update example
M.r1 = Test.a
M.r2 = Test.b

--update example
M.r3 = Imp.functor.new('a', Test)
M.r4 = Imp.functor.new('b', Test)
M.r5 = Imp.functor.new('b', Test, 77)

--outside get or call functor
--print(M.r3:get())
--print(M.r4:call(2, 2))
--print(M.r5:call(3))

return M

