local wk, k = require("which-key"), vim.keymap.set

k('i', 'jk', '<Esc>')
k({ 'n', 'i', 'v' }, '<C-s>', '<Esc>:w<CR>')
k('n', 'H', '<cmd>bprev<cr>')
k('n', 'L', '<cmd>bnext<cr>')
k('n', '<Esc>', '<cmd>noh<cr>')

k('n', '<A-j>', '<cmd>m .+1<cr>==')
k('n', '<A-k>', '<cmd>m .-2<cr>==')
k('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi')
k('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi')
k('v', '<A-j>', ":m '>+1<cr>gv=gv")
k('v', '<A-k>', ":m '<-2<cr>gv=gv")

k({ 'n', 'v' }, 'x', '"_x')
k('v', 'p', '"_dP')

k('n', '<C-o>', '<C-o>zz')
k('n', '<C-i>', '<C-i>zz')

wk.add({
    { "<leader><leader>", function() Snacks.picker.buffers() end,     desc = "Switch Buffers" },
    { "<leader>f",        group = "find" },
    { "<leader>ff",       function() Snacks.picker.files() end,       desc = "Files" },
    { "<leader>fg",       function() Snacks.picker.grep() end,        desc = "Grep" },
    { "<leader>fw",       function() Snacks.picker.grep_word() end,   desc = "Word" },
    { "<leader>fs",       function() Snacks.picker.lsp_symbols() end, desc = "Symbols" },
    { "<leader>fr",       function() Snacks.picker.recent() end,      desc = "Recent" },
    { "<leader>c",        group = "code" },
    { "<leader>cd",       vim.lsp.buf.definition,                     desc = "Definition" },
    { "<leader>cr",       vim.lsp.buf.rename,                         desc = "Rename" },
    { "<leader>ca",       vim.lsp.buf.code_action,                    desc = "Action" },
    { "<leader>cf",       function() require("conform").format() end, desc = "Format" },
    { "<leader>cl",       vim.diagnostic.setqflist,                   desc = "Diagnostics" },
    { "<leader>b",        group = "buffer" },
    { "<leader>bd",       "<cmd>bd<cr>",                              desc = "Delete" },
    { "<leader>bo",       "<cmd>%bd|e#|bd#<cr>",                      desc = "Only" },
    { "<leader>t",        group = "terminal/test" },
    { "<leader>tt",       function() Snacks.terminal.toggle() end,    desc = "Terminal" },
    { "<leader>q",        "<cmd>q<cr>",                               desc = "Quit" },
    { "<leader>s",        group = "sql" },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql",
    callback = function()
        k("n", "<leader>se", "<cmd>SqlsExecuteQuery<cr>", { buffer = true, desc = "Execute Query" })
        k("v", "<leader>se", ":SqlsExecuteQuery<cr>", { buffer = true, desc = "Execute Selection" })
        k("n", "<leader>sl", "<cmd>SqlsShowDatabases<cr>", { buffer = true, desc = "List Databases" })
        k("n", "<leader>st", "<cmd>SqlsShowTables<cr>", { buffer = true, desc = "List Tables" })
        k("n", "<leader>sc", "<cmd>SqlsSwitchConnection<cr>", { buffer = true, desc = "Switch Connection" })
    end,
})

k({ 'n', 'i' }, "<C-p>", function() Snacks.picker.files() end)
k({ 'n', 'i' }, "<C-\\>", function() Snacks.terminal.toggle() end)
k("t", "<C-\\>", [[<C-\><C-n><cmd>lua Snacks.terminal.toggle()<CR>]])
