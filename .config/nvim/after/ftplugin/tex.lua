vim.keymap.set("n", "<leader>r", function()
  vim.cmd("w")
  local file = vim.fn.expand("%:p")
  local dir = vim.fn.expand("%:p:h")
  local pdf = dir .. "/" .. vim.fn.expand("%:t:r") .. ".pdf"

  if file:match("%.tex$") then
    -- open terminal, compile
    vim.cmd("botright split | resize 10")
    vim.cmd("term pdflatex -interaction=nonstopmode -output-directory=" .. dir .. " " .. file)
    vim.cmd("startinsert")

    -- close terminal after a short delay
    vim.defer_fn(function()
      vim.cmd("bd!") -- close the terminal buffer
      -- open or refresh PDF
      local handle = io.popen("pgrep -a zathura | grep '" .. pdf .. "'")
      local result = handle:read("*a")
      handle:close()
      if result == "" then
        os.execute("zathura '" .. pdf .. "' &")
      end
    end, 1000) -- wait for pdflatex to finish
  else
    print("Not a .tex file!")
  end
end, { desc = "Compile LaTeX to PDF and open/refresh viewer" })
