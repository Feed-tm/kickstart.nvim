-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
vim.keymap.set('n', '<leader>e', '<cmd>Explore<CR>', { desc = 'go to NETRW file tree explorer' })
vim.keymap.set('n', '<F1>', '<cmd>Stdheader<CR>', { desc = 'run the header creation for c and header files' })
function putHeader()
  vim.cmd 'Stdheader'
end
function run42Formatter()
  vim.cmd 'CFormatter42'
end

vim.cmd [[autocmd BufNewFile *.c,*.h lua putHeader()]]
vim.cmd [[autocmd BufWritePre *.c,*.h lua run42Formatter()]]
-- See the kickstart.nvim README for more information
return {
  { '42Paris/42header' },
  { 'cacharle/c_formatter_42.vim' },
}
