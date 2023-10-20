local telescope = require("telescope.builtin")
local harpoon = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.g.mapleader = " "
local binds = {
	{ "n", "<leader>pe", vim.cmd.Ex },
	{ "n", "<leader>pr", vim.cmd.Rex },
	{ "n", "<leader>pf", telescope.find_files },
	{ "n", "<leader>pi", telescope.git_files },
	{
		"n",
		"<leader>pg",
		function()
			telescope.grep_string({ search = vim.fn.input("Grep: ") })
		end,
	},

	{ "n", "<leader>m", harpoon.add_file },
	{ "n", "<C-e>", harpoon_ui.toggle_quick_menu },
	{ "n", "<C-j>", harpoon_ui.nav_next },
	{ "n", "<C-k>", harpoon_ui.nav_prev },

	{ "n", "<leader>u", vim.cmd.UndotreeToggle },

	{ "c", "<C-a>", "<Home>" },
	{ "c", "<C-e>", "<End>" },
	{ "c", "<C-b>", "<Left>" },
	{ "c", "<C-f>", "<Right>" },
	{ "c", "<C-d>", "<Delete>" },

	{ "i", "<C-b>", "<Left>" },
	{ "i", "<C-f>", "<Right>" },

	{ "n", "Y", "y$" },
	{ "n", "p", "]p" },
	{ "n", "<C-p>", "p" },
	{ "n", "<C-n>", "" },
}

for _, bind in pairs(binds) do
	vim.keymap.set(bind[1], bind[2], bind[3])
end
