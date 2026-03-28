-- lua/zero_path.lua - Core functionality (Neovim Lua version)
-- Maintainer:   Phong Nguyen
-- Version:      1.0.0

local M = {}

-- ============================================================================
-- Setup
-- ============================================================================

function M.setup()
  -- Nothing to configure yet; placeholder for future g:zero_path_* options.
  -- Called by plugin/zero_path.lua before any command is registered so that
  -- user-set values are never overwritten.
end

-- ============================================================================
-- Helper Functions
-- ============================================================================

local function copy(path)
  vim.fn.setreg('"', path)
  if vim.fn.has("clipboard") == 1 then
    vim.fn.setreg("*", path)
    vim.fn.setreg("+", path)
  end
  vim.api.nvim_echo({ { "Copied: " .. path } }, false, {})
end

local function expand_path(path, line_number)
  local result = vim.fn.expand(path)
  if line_number then
    result = result .. ":" .. vim.fn.line(".")
  end
  return result
end

local function do_copy_path(path, line_number)
  copy(expand_path(path, line_number))
end

local function do_copy_dir_path(path)
  local result = expand_path(path, false)
  if result == "." then
    result = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  end
  copy(result)
end

-- ============================================================================
-- Public Functions
-- ============================================================================

function M.copy_path(line_number)
  do_copy_path("%:~:.", line_number)
end

function M.copy_full_path(line_number)
  do_copy_path("%:p:~", line_number)
end

function M.copy_absolute_path(line_number)
  do_copy_path("%:p", line_number)
end

function M.copy_dir_path()
  do_copy_dir_path("%:p:.:h")
end

function M.copy_full_dir_path()
  do_copy_dir_path("%:p:~:h")
end

function M.copy_absolute_dir_path()
  do_copy_dir_path("%:p:h")
end

return M
