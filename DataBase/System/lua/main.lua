package.loaded["init"] = nil
require "init"

function reload()
	package.loaded["main.lua"] = nil
end
