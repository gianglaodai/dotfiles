local function bind(op, outer_opts)
	outer_opts = outer_opts or { noremap = true, silent = true }
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", outer_opts, {})
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

local nmap = bind("n")
local vmap = bind("v")
local xmap = bind("x")
local tmap = bind("t", { silent = true })
local smap = bind("")

smap("<Space>", "<Nop>")
nmap("s", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Open explorer
nmap("<leader>e", "<cmd>NvimTreeToggle<CR>")

-- Navigate buffers
nmap("<C-l>", "<cmd>bnext<CR>")
nmap("<C-h>", "<cmd>bprevious<CR>")

-- Better window navigation
nmap("<S-l>", "<C-w>l")
nmap("<S-h>", "<C-w>h")
nmap("<S-k>", "<C-w>k")
nmap("<S-j>", "<C-w>j")

-- Split window
nmap("<leader>sh", "<cmd>split<CR>")
nmap("<leader>sv", "<cmd>vsplit<CR>")

-- Resize window
nmap("<C-Up>", ":resize +2<CR>")
nmap("<C-Down>", ":resize -2<CR>")
nmap("<C-Left>", ":vertical resize -2<CR>")
nmap("<C-Right>", ":vertical resize +2<CR>")

-- Move text up and down
nmap("<A-j>", ":m .+1<CR>==")
nmap("<A-k>", ":m .-2<CR>==")

-- Telescope --
--nmap("ff", "<cmd>Telescope find_files<CR>")
nmap("ff", "<cmd>lua require'telescope.builtin'.find_files()<CR>")
nmap("fe", "<cmd>Telescope live_grep<CR>")

-- Alpha --
nmap("<leader>a", "<cmd>Alpha<CR>")

-- Clear highlight
nmap("<leader>cl", "<cmd>noh<CR>")

-- BBype
nmap("<leader>q", "<cmd>Bdelete!<CR>")

-- Undotree
nmap("<leader>u", "<cmd>UndotreeToggle<CR>")

-- Git
nmap("<leader>gi", "<cmd>Git<CR>")

-- Move text from cursor to new line
nmap("<CR>", "i<CR><ESC>")

-- Visual --
-- Stay in indent mode
vmap("<", "<gv")
vmap(">", ">gv")

-- Move text up and down
vmap("<A-j>", ":m '>+1<CR>gv=gv")
vmap("<A-k>", ":m '<-2<CR>gv=gv")

-- Keep previous yank
vmap("p", '"_dP')

-- Visual Block --
-- Move text up and down
xmap("<A-j>", ":move '>+1<CR>gv-gv")
xmap("<A-k>", ":move '<-2<CR>gv-gv")

-- Insert --
-- Move text up and down
xmap("<A-j>", "<Esc>:m .+1<CR>==gi")
xmap("<A-k>", "<Esc>:m .-2<CR>==gi")

-- Terminal --
-- Better terminal navigation
tmap("<C-h>", "<C-\\><C-N><C-w>h")
tmap("<C-l>", "<C-\\><C-N><C-w>l")
tmap("<C-k>", "<C-\\><C-N><C-w>k")
tmap("<C-j>", "<C-\\><C-N><C-w>j")
