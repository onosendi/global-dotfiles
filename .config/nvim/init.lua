require("config.keymaps")
require("config.options")
require("config.lazy")
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})
