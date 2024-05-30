--  You can configure plugins using the `config` key.
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({{ import = 'dieal.plugins' }, { import = 'dieal.plugins.lsp' }}, {})
