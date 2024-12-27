-- Load lze library for lazy-loading
require("lze").register_handlers(require("lze.x"))
require("lze").register_handlers(require("nixCatsUtils.lzUtils").for_cat)

-- Load essential modules
require("jakob.core")
require("jakob.colors")

-- Load modules based on categories
require("jakob.general")

require("jakob.debug")

require("jakob.lint")

require("jakob.format")

require("jakob.lsp")
