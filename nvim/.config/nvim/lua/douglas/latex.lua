local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- There is probably a much better way to do this, but
-- I'm going to use this approach for the moment. I'll
-- write a better Latex snippet system later
local function latex_settings()
    keymap("i", "<F1>", [[
\begin{equation}

\end{equation}
]], opts)

    keymap("i", "<F2>", [[
\begin{align}

\end{align}
]], opts)

    keymap("i", "<F3>", [[
\begin{enumerate}
    \item
\end{enumerate}
]], opts)

    keymap("i", "<F4>", [[
\begin{itemize}
    \item
\end{itemize}
]], opts)


end


vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.tex" }, callback = latex_settings }
)




