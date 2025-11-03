local list_extend = vim.list_extend

local fmt_haiku = function(haiku)
	local formatted = { "" }
	local max = 0
	for _, line in ipairs(haiku) do
		local l = string.len(line)
		max = l > max and l or max
		formatted = list_extend(formatted, { line })
	end
	return formatted
end

local get_haiku = function(haiku_list)
	math.randomseed(os.time())
	local n = math.random(1, #haiku_list)
	return haiku_list[n]
end

-- Example of how a haiku should look like:
-- [[Cherry blossoms —            ]]
-- [[lights                       ]]
-- [[of years past.               ]]
-- [[                             ]]
-- [[— Matsuo Bashō (Lucien Stryk)]]
-- between the brackets is the translator,
-- if there is no translator, then the
-- brackets aren't present.
-- Mostly from:
-- -> the book "Lips too chilled" from Pinguin
-- -> https://www.bopsecrets.org/gateway/passages/basho-frog.htm
-- -> https://en.wikipedia.org/wiki/Matsuo_Bash%C5%8D
-- -> https://www.poetryfoundation.org/poets/kobayashi-issa
local haiku_list = {
	{ lines = { "Cherry blossoms —", "lights", "of years past." }, author = "Matsuo Bashō", translator = "Lucien Stryk" },
	{ lines = { "Lips too chilled", "for prattle —", "autumn wind." }, author = "Matsuo Bashō", translator = "Lucien Stryk" },
	{ lines = { "Old pond", "  and a frog-jump-in", "    water-sound" }, author = "Matsuo Bashō", translator = "Harold G. Henderson" },
	{ lines = { "The old pond —", "A frog leaps in,", "And a splash." }, author = "Matsuo Bashō", translator = "Makoto Ueda" },
	{ lines = { "old pond", "a frog in-leaping", "water-note" }, author = "Matsuo Bashō", translator = "Cana Maeda" },
	{ lines = { "Old pond", "leap-splash —", "a frog." }, author = "Matsuo Bashō", translator = "Lucien Stryk" },
	{ lines = { "dark old pond", ":", "a frog plunks in" }, author = "Matsuo Bashō", translator = "Dick Bakken" },
	{ lines = { "pond", "  frog", "    plop!" }, author = "Matsuo Bashō", translator = "James Kirkup" },
	{ lines = { "There once was a curious frog", "Who sat by a pond on a log", "And, to see what resulted,", "In the pond catapulted", "With a water-noise heard round the bog." }, author = "Matsuo Bashō", translator = "Alfred H. Marks" },
	{ lines = { "Within aging pond", "frogs jumping vibrate the calm", "water’s resonance" }, author = "Matsuo Bashō", translator = "Sarah Isbell" },
	{ lines = { "The old pond;", "a frog jumps in —", "the sound of the water." }, author = "Matsuo Bashō", translator = "Robert Aitken" },
	{ lines = { "On a branch", "Floating downriver", "a cricket, singing." }, author = "Kobayashi Issa", translator = " Jane Hirshfield" },
	{ lines = { "甲比丹もつくばはせけり君が春" }, author = "松尾 芭蕉" },
	{ lines = { "ばしょう植ゑてまづ憎む荻の二葉哉" }, author = "松尾 芭蕉" },
	{ lines = { "馬をさへながむる雪の朝哉" }, author = "松尾 芭蕉" },
	{ lines = { "年暮ぬ笠きて草鞋はきながら" }, author = "松尾 芭蕉" },
	{ lines = { "古池や蛙飛びこむ水の音" }, author = "松尾 芭蕉" },
	{ lines = { "いざさらば雪見にころぶ所迄" }, author = "松尾 芭蕉" },
	{ lines = { "荒海や佐渡によこたふ天の川" }, author = "松尾 芭蕉" },
	{ lines = { "旅に病んで夢は枯野をかけ廻る" }, author = "松尾 芭蕉" },
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
			val = haiku.author,
			opts = { hl = "Number", position = "center" }
		})
	end

	if haiku["translator"] ~= nil then
		table.insert(fmt, {
			type = "text",
			val = haiku.translator,
			opts = { hl = "String", position = "center" }
		})
	end

	return fmt
end

return main
