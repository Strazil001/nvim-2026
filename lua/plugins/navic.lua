return {
  "SmiteshP/nvim-navic",
  lazy = true,
  opts = {
    depth_limit = 3,
    separator = " ",
    depth_limit_indicator = "…",
    safe_output = true,
    format_text = function(text)
      if #text > 10 then
        return text:sub(1, 10) .. "…"
      end
      return text
    end,
  },
}
