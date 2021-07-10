require('neogit').setup{}

require("todo-comments").setup {}

require('orgmode').setup({
	org_agenda_files = {'~/.config/nvim/org-files/**/*'},
	org_default_notes_file = '~/.config/nvim/org-files/refile.org',
	mappings = { global = {
		org_agenda = 'gA',
		org_capture = 'gC'
	} },
})
