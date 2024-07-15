require("config.keymaps")
require("config.settings")
require("config.lazy")
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})
