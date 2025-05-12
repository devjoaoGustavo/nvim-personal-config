vim.g.run_test_last_command = nil
vim.g.run_test_split_orientation = 'split'
vim.g.run_test_split_size = 10

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

local function delete_term_buf()
  local windows = vim.api.nvim_list_wins()
  local term_buf
  for _, win in ipairs(windows) do
    local buf_id = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf_id)
    if buf_name:match('^term.*') then
      term_buf = buf_id
    else
      term_buf = nil
    end
  end

  if term_buf ~= nil then
    vim.api.nvim_buf_delete(term_buf, { force = true })
  end
end

local function copy_test_command_with_line() vim.fn.setreg('+', test_command() .. ':' .. vim.fn.line('.')) end

local function copy_test_command() vim.fn.setreg('+', test_command()) end

local opts = { silent = true, noremap = true }

vim.keymap.set('n', 'gt', copy_test_command, opts)
vim.keymap.set('n', 'gl', copy_test_command_with_line, opts)

function term(opts)
  -- Get the current window ID
  local current_win = vim.api.nvim_get_current_win()

  local split = opts.split


  local split_size
  if split == 'vsplit' then
    -- Parse width argument or use default 100
    if opts.split_size ~= nil then
      split_size = tonumber(opts.split_size)
    else
      split_size = 100
    end
  else
    -- Parse height argument or use default 10
    if opts.split_size ~= nil then
      split_size = tonumber(opts.split_size)
    else
      split_size = 10
    end
  end

  -- Open terminal at the bottom with specified height
  vim.cmd('botright ' .. split_size .. split .. ' term://' .. opts.command .. ' | ' .. 'normal G')

  -- Optionally set terminal options
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false

  -- Return to the original window
  vim.api.nvim_set_current_win(current_win)
end

vim.api.nvim_create_user_command(
  'TestCommand',
  function(opts)
    delete_term_buf()
    vim.g.run_test_last_command = test_command()

    term({ command = vim.g.run_test_last_command, split = opts.fargs[1], split_size = opts.fargs[2] })
  end,
  { nargs = '+' }
)

vim.api.nvim_create_user_command(
  'LastTestCommand',
  function(opts)
    delete_term_buf()
    term({ command = vim.g.run_test_last_command or test_command(), split = opts.fargs[1], split_size = opts.fargs[2] })
  end,
  { nargs = '+' }
)

vim.api.nvim_create_user_command(
  'TestCommandLine',
  function(opts)
    delete_term_buf()
    vim.g.run_test_last_command = test_command() .. ':' .. vim.fn.line('.')

    term({ command = vim.g.run_test_last_command, split = opts.fargs[1], split_size = opts.fargs[2] })
  end,
  { nargs = '+' }
)

vim.api.nvim_create_user_command(
  'FullTestCommand',
  function(opts)
    delete_term_buf()
    vim.g.run_test_last_command = 'make full-test'

    term({ command = vim.g.run_test_last_command, split = opts.fargs[1], split_size = opts.fargs[2] })
  end,
  { nargs = '+' }
)

vim.keymap.set('n', '<m-,>', delete_term_buf, opts)
vim.keymap.set('n', '<m-f>',
  function() vim.cmd.FullTestCommand(vim.g.run_test_split_orientation, vim.g.run_test_split_size) end, opts)
vim.keymap.set('n', '<m-l>',
  function() vim.cmd.TestCommandLine(vim.g.run_test_split_orientation, vim.g.run_test_split_size) end, opts)
vim.keymap.set('n', '<m-r>',
  function() vim.cmd.LastTestCommand(vim.g.run_test_split_orientation, vim.g.run_test_split_size) end, opts)
vim.keymap.set('n', '<m-t>',
  function() vim.cmd.TestCommand(vim.g.run_test_split_orientation, vim.g.run_test_split_size) end, opts)
