local M = {}

local defaults = {
    linehl = false,
    numhl = false,
    word_diff = false,
    show_deleted = false,
    current_line_blame = false,
}

local labels = {
    linehl = 'Line highlight',
    numhl = 'Number highlight',
    word_diff = 'Word diff',
    show_deleted = 'Deleted lines',
    current_line_blame = 'Current line blame',
}

local order = {
    'linehl',
    'numhl',
    'word_diff',
    'show_deleted',
    'current_line_blame',
}

local actions = {
    linehl = 'toggle_linehl',
    numhl = 'toggle_numhl',
    word_diff = 'toggle_word_diff',
    show_deleted = 'toggle_deleted',
    current_line_blame = 'toggle_current_line_blame',
}

local state_path = vim.fn.stdpath('state') .. '/git-highlights.json'
local state = vim.deepcopy(defaults)

local function write_state()
    vim.fn.mkdir(vim.fn.fnamemodify(state_path, ':h'), 'p')
    vim.fn.writefile({ vim.json.encode(state) }, state_path)
end

local function load_state()
    local read_ok, lines = pcall(vim.fn.readfile, state_path)
    local ok, saved = false, nil

    if read_ok then
        ok, saved = pcall(vim.json.decode, table.concat(lines, '\n'))
    end

    if ok and type(saved) == 'table' then
        for key in pairs(defaults) do
            if type(saved[key]) ~= 'boolean' then
                ok = false
                break
            end
        end
    else
        ok = false
    end

    state = ok and saved or vim.deepcopy(defaults)

    if not ok then
        write_state()
    end
end

local function toggle(key)
    state[key] = not state[key]
    require('gitsigns')[actions[key]](state[key])
    write_state()
end

function M.open_menu()
    local items = vim.tbl_map(function(key)
        return {
            key = key,
            label = ('[%s] %s'):format(state[key] and 'x' or ' ', labels[key]),
        }
    end, order)

    vim.ui.select(items, {
        prompt = 'Git Highlights',
        format_item = function(item)
            return item.label
        end,
    }, function(item)
        if not item then
            return
        end

        toggle(item.key)
        vim.schedule(M.open_menu)
    end)
end

function M.setup()
    load_state()

    require('gitsigns').setup({
        signs = {
            add = { text = '▎' },
            change = { text = '▎' },
            delete = { text = '' },
            topdelete = { text = '' },
            changedelete = { text = '▎' },
            untracked = { text = '┆' },
        },
        signs_staged = {
            add = { text = '▎' },
            change = { text = '▎' },
            delete = { text = '' },
            topdelete = { text = '' },
            changedelete = { text = '▎' },
            untracked = { text = '┆' },
        },
        linehl = state.linehl,
        numhl = state.numhl,
        word_diff = state.word_diff,
        current_line_blame = state.current_line_blame,
        on_attach = function(buffer)
            local gitsigns = require('gitsigns')

            vim.keymap.set('n', ']c', function()
                if vim.wo.diff then
                    return ']c'
                end

                vim.schedule(function()
                    gitsigns.nav_hunk('next')
                end)
                return '<Ignore>'
            end, { buffer = buffer, expr = true, desc = 'Next git hunk' })

            vim.keymap.set('n', '[c', function()
                if vim.wo.diff then
                    return '[c'
                end

                vim.schedule(function()
                    gitsigns.nav_hunk('prev')
                end)
                return '<Ignore>'
            end, { buffer = buffer, expr = true, desc = 'Previous git hunk' })

            vim.keymap.set('n', '<leader>gi', gitsigns.preview_hunk_inline,
                { buffer = buffer, desc = 'Preview git hunk inline' })
        end,
    })

    require('gitsigns').toggle_deleted(state.show_deleted)
end

return M
