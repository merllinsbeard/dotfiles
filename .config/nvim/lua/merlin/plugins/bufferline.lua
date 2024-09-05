return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "buffers",
      separator_style = "thin",
      offsets = {
        {
          filetype = "NvimTree",
          text = "NvimTree",
          highlight = "Directory",
          separator = true
        }
      },
      show_buffer_close_icons = true,
      show_close_icon = false,
      color_icons = true,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count) return "("..count..")" end,
    }
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    
    local function close_current_buffer()
      local current_buf = vim.api.nvim_get_current_buf()
      
      -- Проверяем, не находимся ли мы в NvimTree
      if vim.bo[current_buf].filetype == "NvimTree" then
        print("Cannot close NvimTree buffer")
        return
      end
      
      -- Проверяем, есть ли несохраненные изменения
      if vim.bo[current_buf].modified then
        local choice = vim.fn.confirm("Save changes?", "&Yes\n&No\n&Cancel", 1)
        if choice == 1 then -- Yes
          vim.cmd("write")
        elseif choice == 2 then -- No
          vim.cmd("set nomodified")
        else -- Cancel or any other input
          return
        end
      end
      
      local buffers = vim.tbl_filter(function(buf)
        return vim.api.nvim_buf_is_valid(buf) 
               and vim.bo[buf].buflisted
               and vim.bo[buf].filetype ~= "NvimTree"
      end, vim.api.nvim_list_bufs())
      
      if #buffers > 1 then
        vim.cmd("BufferLineCyclePrev")
      else
        vim.cmd("enew")
      end
      
      vim.cmd("bdelete! " .. current_buf)
    end
    
    vim.keymap.set("n", "<Leader>bc", close_current_buffer, { desc = "Close current buffer" })
    vim.keymap.set("n", "<Leader>bn", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<Leader>bp", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
    vim.keymap.set("n", "<Leader>ba", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close all other buffers" })
  end,
}
