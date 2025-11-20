local list_extend = vim.list_extend

local fmt_haiku = function(haiku)
	local formatted = { "" }
	for _, line in ipairs(haiku) do
		formatted = list_extend(formatted, { string.format("%-40s", line) })
	end
	return formatted
end

local get_haiku = function(haiku_list)
	math.randomseed(os.time())
	local n = math.random(1, #haiku_list)
	return haiku_list[n]
end

-- NOTE: Does not work on Japanese text.
-- Mostly from:
-- -> the book "Lips too chilled" from Pinguin
-- -> https://www.bopsecrets.org/gateway/passages/basho-frog.htm
-- -> https://www.poetryfoundation.org/poets/kobayashi-issa
local haiku_list = {
	{ lines = { "Cherry blossoms —", "lights", "of years past." }, author = "Matsuo Basho", translator = "Lucien Stryk" },
	{ lines = { "Lips too chilled", "for prattle —", "autumn wind." }, author = "Matsuo Basho", translator = "Lucien Stryk" },
	{ lines = { "Old pond", "  and a frog-jump-in", "    water-sound" }, author = "Matsuo Basho", translator = "Harold G. Henderson" },
	{ lines = { "The old pond —", "A frog leaps in,", "And a splash." }, author = "Matsuo Basho", translator = "Makoto Ueda" },
	{ lines = { "old pond", "a frog in-leaping", "water-note" }, author = "Matsuo Basho", translator = "Cana Maeda" },
	{ lines = { "Old pond", "leap-splash —", "a frog." }, author = "Matsuo Basho", translator = "Lucien Stryk" },
	{ lines = { "dark old pond", ":", "a frog plunks in" }, author = "Matsuo Basho", translator = "Dick Bakken" },
	{ lines = { "pond", "  frog", "    plop!" }, author = "Matsuo Basho", translator = "James Kirkup" },
	{ lines = { "There once was a curious frog", "Who sat by a pond on a log", "And, to see what resulted,", "In the pond catapulted", "With a water-noise heard round the bog." }, author = "Matsuo Basho", translator = "Alfred H. Marks" },
	{ lines = { "Within aging pond", "frogs jumping vibrate the calm", "water’s resonance" }, author = "Matsuo Basho", translator = "Sarah Isbell" },
	{ lines = { "The old pond;", "a frog jumps in —", "the sound of the water." }, author = "Matsuo Basho", translator = "Robert Aitken" },
	{ lines = { "On a branch", "Floating downriver", "a cricket, singing." }, author = "Kobayashi Issa", translator = "Jane Hirshfield" },
	{ lines = { "The snow is melting", "and the village is floooded", "    with children." }, author = "Kobayashi Issa", translator = "Robert Hass" },
	{ lines = { "All the time I pray to Buddha", "I keep on", "   killing mosquitos." }, author = "Kobayashi Issa", translator = "Robert Hass" },
	{ lines = { "Even with insects—", "some can sing,", "  some can’t." }, author = "Kobayashi Issa", translator = "Robert Hass" },
	{ lines = { "Goes out,", "comes back—", "      the love life of a cat." }, author = "Kobayashi Issa", translator = "Robert Hass" },
	{ lines = { "Wake, butterfly—", "it's late, we've miles", "to go together." }, author = "Matsuo Basho", translator = "Lucien Stryk" },
}


local main = function()
	local haiku = get_haiku(haiku_list)

	local fmt = {
		{
			type = "text",
			val = fmt_haiku(haiku.lines),
			opts = { hl = "Type", position = "center" }
		}, { type = "padding", val = 1 },
	}

	if haiku["author"] ~= nil then
		table.insert(fmt, {
			type = "text",
			val = string.format("      %-34s", haiku.author),
			opts = { hl = "Number", position = "center" }
		})
	end

	if haiku["translator"] ~= nil then
		table.insert(fmt, {
			type = "text",
			val = string.format("      %-34s", haiku.translator),
			opts = { hl = "String", position = "center" }
		})
	end

	return fmt
end

return main
