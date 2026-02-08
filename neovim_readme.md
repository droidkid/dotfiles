# Neovim Configuration

## Key Mappings

Leader key: `<Space>`

### File Navigation
| Key | Action |
|-----|--------|
| `<C-p>` | Git file search (Telescope) |
| `<Space>ff` | Find all files |
| `<Space>fg` | Live grep |
| `<Space>fb` | Buffers |
| `<Space>e` | Toggle file explorer |

### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover docs |
| `gr` | References |
| `<Space>rn` | Rename |
| `<Space>ca` | Code action |

### Editing
| Key | Action |
|-----|--------|
| `<Space>f` | Format buffer |
| `<Space>z` | Zen mode |

## LSP Setup

On first launch, run `:Mason` to open the LSP server manager. `clangd` (C/C++) and `lua_ls` (Lua) are configured to auto-install. To add more servers, install them via Mason and add their setup call in `.config/nvim/lua/plugins/lsp.lua`.
