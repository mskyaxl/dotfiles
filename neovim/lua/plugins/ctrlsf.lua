return {
  'dyng/ctrlsf.vim',
  config = function()
    -- exclude .git and .gitignore from file search in ctrlp
    vim.g.ctrlp_user_command = { '.git', 'cd %s && git ls-files -co --exclude-standard' }
    vim.g.ctrlp_show_hidden = 1
    vim.g.ctrlsf_default_view_mode = 'compact'
  end
}
