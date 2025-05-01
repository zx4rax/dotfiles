return {
  {
    dir = vim.fn.stdpath 'config',
    config = function()
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.json',
        callback = function()
          vim.cmd '%!jq .'
        end,
        desc = 'Format JSON with jq on save',
      })
    end,
  },
}
