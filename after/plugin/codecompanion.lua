local builtin = require("codecompanion")

local default_model = "google/gemini-2.5-flash-preview"
local available_models = {
    "google/gemini-2.5-flash-preview",
    "google/gemini-2.5-pro-preview-03-25",
    "openai/gpt-4.1",
    "anthropic/claude-3.7-sonnet",
    "anthropic/claude-3.5-sonnet",
}
local current_model = default_model

local function select_model()
    vim.ui.select(available_models, {
        prompt = "Select  Model:",
    }, function(choice)
        if choice then
            current_model = choice
            vim.notify("Selected model: " .. current_model)
        end
    end)
end

-- REQUIRED
builtin.setup({
    strategies = {
        chat = {
            adapter = "openrouter",
        },
        inline = {
            adapter = "openrouter",
        },
    },
    adapters = {
        openrouter = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
                env = {
                    url = "https://openrouter.ai/api",
                    api_key = vim.env.OPENROUTER_API_KEY,
                    chat_url = "/v1/chat/completions",
                },
                schema = {
                    model = {
                        default = current_model,
                    },
                },
            })
        end,
    },
})

vim.keymap.set({ "n", "v" }, "<leader>aia", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set(
    { "n", "v" },
    "<leader>aic",
    "<cmd>CodeCompanionChat Toggle<cr>",
    { noremap = true, silent = true }
)
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>aim", select_model, { desc = "Select Gemini Model" })
-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
