-- Read licence key from file
local licence_key = nil
local licence_file = vim.fn.expand("~/intelephense/licence.txt")
if vim.fn.filereadable(licence_file) == 1 then
    local lines = vim.fn.readfile(licence_file)
    if #lines > 0 then
        licence_key = vim.trim(lines[1])
    end
end

return {
    cmd = { "intelephense", "--stdio" },
    filetypes = { 'php' },
    init_options = {
        storagePath = os.getenv("HOME") .. "/intelephense",
        licenceKey = licence_key,
    },
    on_attach = function(client, bufnr)
        -- Enable formatting for intelephense premium
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
    end,
    settings = {
        intelephense = {
            files = {
                maxSize = 104857600,
            },
            format = {
                enable = true,
                braces = "psr12",
            },
        },
    }
}
