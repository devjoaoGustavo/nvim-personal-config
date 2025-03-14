local function test_command()
  if vim.fn.expand('%:p'):match('/e2e/.*_test.exs') then
    local path = vim.fn.expand('%:p'):match('/integration/e2e/.*'):match('integration/e2e/.*')
    return 'make e2e args=' .. path
  elseif vim.fn.expand('%:p'):match('/integration/.*_test.exs') then
    local path = vim.fn.expand('%:p'):match('/integration/.*'):match('integration/.*')
    return 'make integration args=' .. path
  elseif vim.fn.expand('%:p'):match('.*_test.exs') then
    return 'mix test ' .. vim.fn.expand('%:p')
  elseif vim.fn.expand('%:p'):match('.*_spec.rb') then
    return 'bundle exec rspec ' .. vim.fn.expand('%:p')
  else
    return 'echo no_test_command_for_this_file_yet'
  end
end

local function copy_test_command_with_line() vim.fn.setreg('+', test_command() .. ':' .. vim.fn.line('.')) end

local function copy_test_command() vim.fn.setreg('+', test_command()) end

local opts = { silent = true, noremap = true }

vim.keymap.set('n', 'gt', copy_test_command, opts)
vim.keymap.set('n', 'gl', copy_test_command_with_line, opts)
