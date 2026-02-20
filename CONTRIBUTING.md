# 🛠 Гайд по поддержке Neovim конфигурации

Краткая инструкция как добавлять и изменять настройки.

---

## ⌨️ Добавление новой команды

### Single Source of Truth

**Описания команд живут в `desc` параметре**, which-key находит их автоматически!

```lua
-- В lua/config/keymappings.lua
vim.keymap.set("n", "<leader>x", ":Command<CR>", {
    desc = "Short description"  -- ← Единственное место!
})
```

**That's it!** Which-key покажет автоматически при нажатии `Space`.

### Где добавлять команды

| Тип команды | Файл | Пример |
|-------------|------|--------|
| Leader команды | `lua/config/keymappings.lua` | `<leader>gp`, `<leader>lf` |
| Telescope | `after/plugin/telescope.lua` | `<C-f>`, `<leader>f` |
| Harpoon | `after/plugin/harpoon.lua` | `<C-a>`, `<C-e>` |
| Плагин-специфичные | `after/plugin/<plugin>.lua` | Создать новый файл |

### Новая группа команд

Если добавляете много команд с новым префиксом (например `<leader>t`):

```lua
-- В lua/plugins.lua, which-key setup
wk.add({
    { "<leader>g", group = "Git" },
    { "<leader>l", group = "LSP" },
    { "<leader>t", group = "Tests" },  -- ← Новая группа
})
```

### Обновить документацию

Для важных команд обновите `README.md` в этой директории:

```markdown
### Tests

| Key | Action | Mode |
|-----|--------|------|
| `<leader>tr` | Run tests | n |
```

---

## 📝 Checklist

При добавлении команды:
- [ ] Добавил с параметром `desc`
- [ ] Если новая группа → добавил в which-key
- [ ] Если важная → обновил README.md
- [ ] Протестировал: `Space` и подождать

**НЕ нужно:**
- ❌ Дублировать в `plugins.lua` (which-key найдет сам)
- ❌ Явно регистрировать в `wk.add()` (кроме групп)

---

## 🗂 Структура файлов

```
~/.config/nvim/
├── init.lua                   # Entry point
├── lua/
│   ├── config/
│   │   ├── keymappings.lua   # ← Основные команды (desc здесь!)
│   │   ├── settings.lua      # Vim settings
│   │   └── lsp.lua           # LSP config
│   └── plugins.lua           # Плагины + which-key groups
└── after/plugin/
    ├── telescope.lua          # Telescope bindings
    ├── harpoon.lua            # Harpoon bindings
    └── ...
```

---

## 💡 Принципы

### DRY (Don't Repeat Yourself)
- Описание команды → **только в `desc`**
- Which-key подхватывает автоматически
- README.md → для пользовательской документации

### Консистентность
- Используйте существующие паттерны
- Leader = Space
- Git команды → `<leader>g*`
- LSP команды → `<leader>l*`

### Документация
- Код должен быть самодокументируемым
- Комментарии для неочевидных вещей
- README для важных фич

---

## 🔧 Примеры

### Простая команда
```lua
vim.keymap.set("n", "<leader>x", ":Cmd<CR>", { desc = "Do something" })
```

### С функцией
```lua
vim.keymap.set("n", "<leader>y", function()
    print("Hello!")
end, { desc = "Say hello" })
```

### Telescope picker
```lua
-- В after/plugin/telescope.lua
vim.keymap.set("n", "<leader>t", builtin.some_picker, { desc = "Pick something" })
```

---

## 📚 См. также

- **README.md** - основная документация по плагинам и командам
- **lua/config/keymappings.lua** - все основные команды с описаниями
- **after/plugin/*.lua** - плагин-специфичные команды
