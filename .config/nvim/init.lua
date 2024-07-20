require("config.keymaps")
require("config.options")
require("config.lazy")
require("config.ui")
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})
