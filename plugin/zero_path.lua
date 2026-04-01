-- plugin/require("zero_path").lua - Copy path commands (Neovim Lua)
-- Maintainer:   Phong Nguyen
-- Version:      1.0.0

if vim.g.loaded_zero_path then
  return
end
vim.g.loaded_zero_path = 1

-- Commands
vim.api.nvim_create_user_command("CopyPath", function(opts)
  require("zero_path").copy_path(opts.bang)
end, { bang = true })

vim.api.nvim_create_user_command("CopyFullPath", function(opts)
  require("zero_path").copy_full_path(opts.bang)
end, { bang = true })

vim.api.nvim_create_user_command("CopyAbsolutePath", function(opts)
  require("zero_path").copy_absolute_path(opts.bang)
end, { bang = true })

vim.api.nvim_create_user_command("CopyDirPath", function(_)
  require("zero_path").copy_dir_path()
end, {})

vim.api.nvim_create_user_command("CopyFullDirPath", function(_)
  require("zero_path").copy_full_dir_path()
end, {})

vim.api.nvim_create_user_command("CopyAbsoluteDirPath", function(_)
  require("zero_path").copy_absolute_dir_path()
end, {})

-- Mappings
if vim.g.zero_path_mappings == nil or vim.g.zero_path_mappings == 1 then
  local map = vim.keymap.set
  map("n", "yc", "<Cmd>CopyPath<CR>", { silent = true })
  map("n", "yC", "<Cmd>CopyPath!<CR>", { silent = true })
  map("n", "yp", "<Cmd>CopyFullPath<CR>", { silent = true })
  map("n", "yP", "<Cmd>CopyFullPath!<CR>", { silent = true })
  map("n", "yu", "<Cmd>CopyAbsolutePath<CR>", { silent = true })
  map("n", "yU", "<Cmd>CopyAbsolutePath!<CR>", { silent = true })
  map("n", "y.", "<Cmd>CopyDirPath<CR>", { silent = true })
  map("n", "yd", "<Cmd>CopyFullDirPath<CR>", { silent = true })
  map("n", "yD", "<Cmd>CopyAbsoluteDirPath<CR>", { silent = true })
end
