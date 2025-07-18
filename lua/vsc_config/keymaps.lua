local keymap = vim.keymap.set
local opts = {
    noremap = true,
    silent = true
}

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag = "-Command"
vim.opt.backupskip = {"/tmp/*", "/private/tmp/*"}
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = {"start", "eol", "indent"}
vim.opt.path:append({"**"}) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({"*/node_modules/*"})
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""
vim.opt.clipboard = "unnamedplus"
-- vim.keymap.del({ "n", "x", "o" }, "s")

keymap({"i"}, "<C-j>", "<cmd>lua require('vscode').action('vscode-neovim.escape')<CR>", opts)
keymap({"i"}, "jj", "<Esc>", opts)
keymap({"n", "v"}, ";;", "<Esc>A;<Esc>", opts)
keymap({"n", "v"}, ",,", "<Esc>A,<Esc>", opts)
keymap({"n", "v"}, "-", "<C-x>", opts)
keymap({"n", "v"}, "_", "<C-a>", opts)
keymap({"n", "v"}, "+", "<C-a>", opts)
keymap({"n", "v"}, "U", "<C-r>", opts)
keymap({"n", "v"}, "H", "^", opts)
keymap({"n", "v"}, "L", "$", opts)
-- keymap({"n", "v"}, "<C-_>", "gc", opts)

-- yank to system clipboard
keymap({"n", "v"}, "<leader>y", '"+y', opts)

-- paste from system clipboard
keymap({"n", "v"}, "<leader>p", '"+p', opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- call vscode commands from neovim
-- general keymaps
keymap({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap({"n", "v"}, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({"n", "v"}, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({"n", "v"}, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({"n", "v"}, "<leader>ss", "<cmd>lua require('vscode').action('outline.focus')<CR>")
keymap({"n", "v"}, "<leader>cl", "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>")
keymap({"n", "v"}, "<leader>sl", "<cmd>lua require('vscode').action('workbench.action.focusSideBar')<CR>")
keymap({"n", "v"}, "<leader>ch", "<cmd>lua require('vscode').action('workbench.action.toggleAuxiliaryBar')<CR>")
keymap({"n", "v"}, "<leader>sh", "<cmd>lua require('vscode').action('workbench.action.focusAuxiliaryBar')<CR>")
keymap({"n", "v"}, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({"n", "v"}, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({"n", "v"}, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({"n", "v"}, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({"n", "v"}, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
keymap({"n", "v"}, "<leader>fc", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>")
keymap({"n", "v"}, "<S-Tab>", "<cmd>Tabprev<CR>")
keymap({"n", "v"}, "<Tab>", "<cmd>Tabnext<CR>")

-- copilot keymaps
keymap({"n", "v"}, "<leader>co", "<cmd>lua require('vscode').action('workbench.panel.chat.view.copilot.focus')<CR>")
keymap({"n", "v"}, "<leader>cc", "<cmd>lua require('vscode').action('github.copilot.toggleCopilot')<CR>")
keymap({"i"}, "<C-i>", "<cmd>lua require('vscode').action('inlineChat.focus')<CR>")

-- harpoon keymaps
keymap({"n", "v"}, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
keymap({"n", "v"}, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
keymap({"n", "v"}, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
keymap({"n", "v"}, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
keymap({"n", "v"}, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
keymap({"n", "v"}, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
keymap({"n", "v"}, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
keymap({"n", "v"}, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
keymap({"n", "v"}, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
keymap({"n", "v"}, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
keymap({"n", "v"}, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
keymap({"n", "v"}, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

-- project manager keymaps
keymap({"n", "v"}, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
keymap({"n", "v"}, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
keymap({"n", "v"}, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")

-- vscode group editor keymaps
keymap({"n", "v"}, "<leader>gh", "<cmd>lua require('vscode').action('workbench.action.focusPreviousGroup')<CR>")
keymap({"n", "v"}, "<leader>gl", "<cmd>lua require('vscode').action('workbench.action.focusNextGroup')<CR>")
keymap({"n", "v"}, "<leader>g1", "<cmd>lua require('vscode').action('workbench.action.focusFirstEditorGroup')<CR>")
keymap({"n", "v"}, "<leader>g2", "<cmd>lua require('vscode').action('workbench.action.focusSecondEditorGroup')<CR>")
keymap({"n", "v"}, "<leader>g3", "<cmd>lua require('vscode').action('workbench.action.focusThirdEditorGroup')<CR>")
keymap({"n", "v"}, "<leader>gc", "<cmd>lua require('vscode').action('workbench.action.closeGroup')<CR>")
keymap({"n", "v"}, "<leader>ga", "<cmd>lua require('vscode').action('workbench.action.joinAllGroups')<CR>")

-- vscode definition and reference nevigation
keymap({"n", "v"}, "ga", "<cmd>lua require('vscode').action('workbench.action.joinAllGroups')<CR>")
keymap({"n", "v"}, "gr", "<cmd>lua require('vscode').action('editor.action.goToReferences')<CR>")

-- vscode zen mode
keymap({"n", "v"}, "<leader>z", "<cmd>lua require('vscode').action('workbench.action.toggleZenMode')<CR>")

-- vscode toggle explorer
keymap({"n", "v"}, "<leader>ge", "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>")

-- vscode show search
keymap({"n", "v"}, "<leader>gs", "<cmd>lua require('vscode').action('workbench.view.search')<CR>")

-- vscode save file
keymap({"n", "v"}, "<leaderss", "<cmd>w<CR>")

-- vscode editor control
keymap({"n", "v"}, "<leader>fo", "<cmd>lua require('vscode').action('workbench.action.closeOtherEditors')<CR>")
-- keymap({ "n", "v" }, "<leader>fa", "<cmd>lua require('vscode').action('workbench.action.closeAllEditors')<CR>")

-- vscode matlab keymaps
keymap({"n", "v"}, "<leader>mr", "<cmd>lua require('vscode').action('matlab.runFile')<CR>")
keymap({"n", "v"}, "<leader>mt", "<cmd>lua require('vscode').action('matlab.openCommandWindow')<CR>")
keymap({"n", "v"}, "<leader>mf", "<cmd>lua require('vscode').action('matlab.addFolderToPath')<CR>")
keymap({"n", "v"}, "<leader>mc", "<cmd>lua require('vscode').action('matlab.changeDirectory')<CR>")

-- vscode panel keymaps
keymap({"n", "v"}, "<leader>pp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")

-- vscode jumpy keymaps

-- -- vscode multi-cursor keymaps
-- if vim.g.vscode then
--     local cursors = require("vscode-multi-cursor")
--     keymap({"n", "x"}, "mc", cursors.create_cursor, {
--         expr = true,
--         desc = "Create cursor"
--     })
--     keymap({"n"}, "mcc", cursors.cancel, {
--         desc = "Cancel/Clear all cursors"
--     })
--     keymap({"n", "x"}, "mi", cursors.start_left, {
--         desc = "Start cursor on the left"
--     })
--     keymap({"n", "x"}, "mI", cursors.start_left_edge, {
--         desc = "Start cursor on the left edge"
--     })
--     keymap({"n", "x"}, "ma", cursors.start_right, {
--         desc = "Start cursor on the right"
--     })
--     keymap({"n", "x"}, "mA", cursors.start_right, {
--         desc = "Start cursor on the right"
--     })
--     keymap({"n"}, "[mc", cursors.prev_cursor, {
--         desc = "Goto previous cursor"
--     })
--     keymap({"n"}, "]mc", cursors.next_cursor, {
--         desc = "Goto next cursor"
--     })
--     keymap({"n"}, "mcs", cursors.flash_char, {
--         desc = "Create cursor using flash"
--     })
--     keymap({"n"}, "mcw", cursors.flash_word, {
--         desc = "Create selection using flash"
--     })
-- end

vim.keymap.set("n", "<leader>bd", function()
    require("telescope.builtin").buffers({
        sort_lastused = true,
        ignore_current_buffer = true,
        mappings = {
            i = {
                ["<c-d>"] = require("telescope.actions").delete_buffer
            },
            n = {
                ["<c-d>"] = require("telescope.actions").delete_buffer
            }
        }
    })
end, {
    desc = "Buffers with delete"
})
