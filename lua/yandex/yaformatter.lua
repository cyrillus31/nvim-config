-- Yandex yaformatter configuration for conform.nvim
-- Defines the yaformatter formatter using Yandex's 'ya tool'
return {
	command = "ya",
	args = { "tool", "tt", "format", "$FILENAME", "2&>/dev/null" },
}