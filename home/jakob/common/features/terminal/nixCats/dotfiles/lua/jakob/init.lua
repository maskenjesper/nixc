-- Load lze library for lazy-loading
require("lze").register_handlers(require("lze.x"))
require("lze").register_handlers(require("nixCatsUtils.lzUtils").for_cat)

-- Load essential modules
require("jakob.core")
require("jakob.colors")

-- Load modules based on categories
if nixCats("general") then
	require("jakob.general")
end

if nixCats("debug") then
	require("jakob.debug")
end

if nixCats("lint") then
	require("jakob.lint")
end

if nixCats("format") then
	require("jakob.format")
end

if nixCats("lsp") then
	require("jakob.lsp")
end
