return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    opts.options.always_show_bufferline = false
    opts.options.tab_size = 10
    opts.options.color_icons = false
    opts.options.show_buffer_icons = false
    opts.options.show_buffer_close_icons = false
    opts.options.show_close_icon = false
    opts.options.separator_style = { "/", "/" }
    opts.options.indicator = {
      style = "underline",
    }
    opts.highlights = opts.highlights or {}
  end,
}
