-- if vim.g.vscode then
-- 	require("vsc.lazy")
-- 	require("vsc.keymaps")
-- 	require("vsc.flash")
-- else
-- 	if vim.loader then
-- 		vim.loader.enable()
-- 	end

-- 	_G.dd = function(...)
-- 		require("util.debug").dump(...)
-- 	end
-- 	vim.print = _G.dd

-- 	require("config.lazy")
-- end

require("vsc_config.lazy")
require("vsc_config.keymaps")
