local colorschemeName = nixCats("colorscheme")
if not require("nixCatsUtils").isNixCats then
	colorschemeName = "onedark"
end

vim.cmd.colorscheme(colorschemeName)
