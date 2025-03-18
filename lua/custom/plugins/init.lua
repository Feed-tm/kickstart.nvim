-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
function formatter42()
  vim.cmd 'CFormatter42'
end

function header42()
  vim.cmd 'Stdheader'
end

vim.cmd [[autocmd BufNewFile *.c,*.h lua header42()]]
vim.cmd [[autocmd BufWritePre *.c,*.h lua formatter42()]]

vim.keymap.set('n', '<leader>e', '<cmd>Explore<CR>')
return {
  '42Paris/42header',
  'cacharle/c_formatter_42.vim',
}
