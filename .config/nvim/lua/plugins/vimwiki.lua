return {
  "vimwiki/vimwiki",
  branch = "dev",
  init = function()
    print("Setting up vimwiki!")
    vim.g.vimwiki_list = {
      {
        template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/",
        syntax = "markdown",
        ext = ".wiki",
        path = "~/Documents/Vimwiki/", -- does not work?=!?!?
      },
    }
    vim.g.vimwiki_global_ext = 0
  end,
}
