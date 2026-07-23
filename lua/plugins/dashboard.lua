return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = vim.split(
					[[


                                        _.oo. 
                 _.u[[/;:,.         .odMMMMMM'
              .o888UU[[[/;:-.  .o@P^    MMM^  
             oN88888UU[[[/;::-.        dP^    
            dNMMNN888UU[[[/;:--.   .o@P^      
           ,MMMMMMN888UU[[/;::-. o@^          
           NNMMMNN888UU[[[/~.o@P^             
           888888888UU[[[/o@^-..              
          oI8888UU[[[/o@P^:--..               
       .@^  YUU[[[/o@^;::---..                
     oMP     ^/o@P^;:::---..                  
  .dMMM    .o@^ ^;::---...                    
 dMMMMMMM@^`       `^^^^                      
YMMMUP^                                       
 ^^                                           

]],
					"\n"
				),
				center = {
					{ desc = "Update  ", desc_hl = "DashboardCenterItem", action = "Lazy update", key = "u" },
					{ desc = "Files   ", desc_hl = "DashboardCenterItem", action = "Telescope find_files", key = "f" },
					{
						desc = "Config  ",
						desc_hl = "DashboardCenterItem",
						action = "cd ~/.config/nvim | Neotree left toggle reveal",
						key = "c",
					},
					{ desc = "Quit    ", desc_hl = "DashboardCenterItem", action = "qa", key = "q" },
				},
				footer = {},
			},
		})

		vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#48B0BD" })
		vim.api.nvim_set_hl(0, "DashboardCenterItem", { fg = "#48B0BD" })
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
