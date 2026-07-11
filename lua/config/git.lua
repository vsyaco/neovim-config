local M = {}

local state_version = 1

local defaults = {
    linehl = true,
    numhl = false,
    word_diff = true,
    show_deleted = true,
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
local highlights_enabled = false
local review_enabled = false

local function write_state()
    vim.fn.mkdir(vim.fn.fnamemodify(state_path, ':h'), 'p')
    vim.fn.writefile({ vim.json.encode(vim.tbl_extend('force', state, { version = state_version })) }, state_path)
end

local function load_state()
    local read_ok, lines = pcall(vim.fn.readfile, state_path)
    local ok, saved = false, nil

    if read_ok then
        ok, saved = pcall(vim.json.decode, table.concat(lines, '\n'))
    end

    if ok and type(saved) == 'table' and saved.version == state_version then
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

local function set_highlight(key, enabled)
    require('gitsigns')[actions[key]](enabled)
end

local function apply_review_state()
    for key in pairs(defaults) do
        set_highlight(key, highlights_enabled and state[key])
    end
end

local function toggle_highlight(key)
    state[key] = not state[key]

    if highlights_enabled then
        set_highlight(key, state[key])
    end

    write_state()
end

function M.toggle_highlights()
    highlights_enabled = not highlights_enabled
    apply_review_state()
    vim.notify(('Review highlights: %s'):format(highlights_enabled and 'on' or 'off'))
end

function M.open_menu()
    local items = vim.tbl_map(function(key)
        return {
            key = key,
            label = ('[%s] %s'):format(state[key] and 'x' or ' ', labels[key]),
        }
    end, order)

    vim.ui.select(items, {
        prompt = ('Review highlights (%s)'):format(highlights_enabled and 'on' or 'off'),
        format_item = function(item)
            return item.label
        end,
    }, function(item)
        if not item then
            return
        end

        toggle_highlight(item.key)
        vim.schedule(M.open_menu)
    end)
end

local function git_root()
    local current_file = vim.api.nvim_buf_get_name(0)
    local cwd = current_file ~= '' and vim.fs.dirname(current_file) or (vim.uv or vim.loop).cwd()
    local result = vim.system({ 'git', '-C', cwd, 'rev-parse', '--show-toplevel' }, { text = true }):wait()

    return result.code == 0 and vim.trim(result.stdout) or nil
end

local function git_paths(root, arguments)
    local command = { 'git', '-C', root }
    vim.list_extend(command, arguments)

    local result = vim.system(command, { text = true }):wait()
    return result.code == 0 and vim.split(result.stdout, '\0', { plain = true, trimempty = true }) or {}
end

local function changed_files(root)
    local paths = git_paths(root, { 'diff', '--name-only', '-z', 'HEAD', '--' })
    vim.list_extend(paths, git_paths(root, { 'ls-files', '--others', '--exclude-standard', '-z' }))

    local files = {}
    local seen = {}

    for _, path in ipairs(paths) do
        local file = vim.fs.joinpath(root, path)

        if not seen[file] and vim.fn.filereadable(file) == 1 then
            seen[file] = true
            table.insert(files, file)
        end
    end

    table.sort(files)
    return files
end

local function open_review_list(files)
    local current_file = vim.fs.normalize(vim.api.nvim_buf_get_name(0))
    local current_index
    local items = vim.tbl_map(function(file)
        return {
            filename = file,
            lnum = 1,
            col = 1,
            text = 'Changed file',
        }
    end, files)

    for index, file in ipairs(files) do
        if vim.fs.normalize(file) == current_file then
            current_index = index
            break
        end
    end

    local editor_window = vim.api.nvim_get_current_win()
    vim.fn.setqflist({}, ' ', { title = 'Git Review', items = items })

    if current_index then
        vim.fn.setqflist({}, 'a', { idx = current_index })
    elseif not vim.bo.modified then
        vim.cmd.cfirst()
    end

    vim.cmd('botright copen 12')
    vim.api.nvim_set_current_win(editor_window)
end

function M.toggle_review()
    review_enabled = not review_enabled

    if review_enabled then
        local root = git_root()

        if not root then
            review_enabled = false
            vim.notify('Review mode requires a Git repository', vim.log.levels.WARN)
            return
        end

        local files = changed_files(root)

        if #files == 0 then
            review_enabled = false
            vim.notify('No editable changed files', vim.log.levels.INFO)
            return
        end

        highlights_enabled = true
        apply_review_state()
        open_review_list(files)
    else
        highlights_enabled = false
        apply_review_state()
        vim.cmd.cclose()
    end

    vim.notify(('Review mode: %s'):format(review_enabled and 'on' or 'off'))
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
        linehl = false,
        numhl = false,
        word_diff = false,
        current_line_blame = false,
        on_attach = function(buffer)
            local gitsigns = require('gitsigns')

            local function next_hunk()
                if vim.wo.diff then
                    return ']c'
                end

                vim.schedule(function()
                    gitsigns.nav_hunk('next')
                end)
                return '<Ignore>'
            end

            local function previous_hunk()
                if vim.wo.diff then
                    return '[c'
                end

                vim.schedule(function()
                    gitsigns.nav_hunk('prev')
                end)
                return '<Ignore>'
            end

            for _, key in ipairs({ ']c', '<C-}>', '<C-S-]>', '<C-Ъ>', '<C-S-ъ>' }) do
                vim.keymap.set('n', key, next_hunk, { buffer = buffer, expr = true, desc = 'Next git hunk' })
            end

            for _, key in ipairs({ '[c', '<C-{>', '<C-S-[>', '<C-Х>', '<C-S-х>' }) do
                vim.keymap.set('n', key, previous_hunk,
                    { buffer = buffer, expr = true, desc = 'Previous git hunk' })
            end

            vim.keymap.set('n', '<leader>gi', gitsigns.preview_hunk_inline,
                { buffer = buffer, desc = 'Preview git hunk inline' })
        end,
    })

    require('gitsigns').toggle_deleted(false)
end

return M
