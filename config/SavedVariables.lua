local addonName, addon = ...

local defaults = {
	profile = {
		general = {
			accept = true,
			complete = true,
			share = false,
			skipgossip = true,
			skipgossipwhen = 1,
			paydarkmoonfaire = true,
			pausekey = 'SHIFT',
			pausekeyreverse = false,
			selectreward = true,
			acceptRepeatables = true,
		},
		blocklist = {
			items = {
				-- Inscription weapons
				[79343] = true, -- Inscribed Tiger Staff
				[79340] = true, -- Inscribed Crane Staff
				[79341] = true, -- Inscribed Serpent Staff

				-- Darkmoon Faire artifacts
				[71635] = true, -- Imbued Crystal
				[71636] = true, -- Monstrous Egg
				[71637] = true, -- Mysterious Grimoire
				[71638] = true, -- Ornate Weapon
				[71715] = true, -- A Treatise on Strategy
				[71951] = true, -- Banner of the Fallen
				[71952] = true, -- Captured Insignia
				[71953] = true, -- Fallen Adventurer's Journal
				[71716] = true, -- Soothsayer's Runes

				-- Tiller Gifts
				[79264] = true, -- Ruby Shard
				[79265] = true, -- Blue Feather
				[79266] = true, -- Jade Cat
				[79267] = true, -- Lovely Apple
				[79268] = true, -- Marsh Lily

				-- Garrison scouting missives
				[122424] = true, -- Scouting Missive: Broken Precipice
				[122423] = true, -- Scouting Missive: Broken Precipice
				[122418] = true, -- Scouting Missive: Darktide Roost
				[122417] = true, -- Scouting Missive: Darktide Roost
				[122400] = true, -- Scouting Missive: Everbloom Wilds
				[122404] = true, -- Scouting Missive: Everbloom Wilds
				[122420] = true, -- Scouting Missive: Gorian Proving Grounds
				[122419] = true, -- Scouting Missive: Gorian Proving Grounds
				[122402] = true, -- Scouting Missive: Iron Siegeworks
				[122406] = true, -- Scouting Missive: Iron Siegeworks
				[122413] = true, -- Scouting Missive: Lost Veil Anzu
				[122414] = true, -- Scouting Missive: Lost Veil Anzu
				[122403] = true, -- Scouting Missive: Magnarok
				[122399] = true, -- Scouting Missive: Magnarok
				[122421] = true, -- Scouting Missive: Mok'gol Watchpost
				[122422] = true, -- Scouting Missive: Mok'gol Watchpost
				[122411] = true, -- Scouting Missive: Pillars of Fate
				[122409] = true, -- Scouting Missive: Pillars of Fate
				[122412] = true, -- Scouting Missive: Shattrath Harbor
				[122410] = true, -- Scouting Missive: Shattrath Harbor
				[122408] = true, -- Scouting Missive: Skettis
				[122407] = true, -- Scouting Missive: Skettis
				[122416] = true, -- Scouting Missive: Socrethar's Rise
				[122415] = true, -- Scouting Missive: Socrethar's Rise
				[122405] = true, -- Scouting Missive: Stonefury Cliffs
				[122401] = true, -- Scouting Missive: Stonefury Cliffs

				-- Misc
				[88604] = true, -- Nat's Fishing Journal
			},
			npcs = {
				-- misc
				[103792] = true, -- Griftah (his quests are scams)
				[143925] = true, -- Dark Iron Mole Machine (Dark Iron Dwarf racial)

				-- Bodyguards
				[86945] = true, -- Aeda Brightdawn (Horde)
				[86933] = true, -- Vivianne (Horde)
				[86927] = true, -- Delvar Ironfist (Alliance)
				[86934] = true, -- Defender Illona (Alliance)
				[86682] = true, -- Tormmok
				[86964] = true, -- Leorajh
				[86946] = true, -- Talonpriest Ishaal

				-- Sassy Imps
				[95139] = true,
				[95141] = true,
				[95142] = true,
				[95143] = true,
				[95144] = true,
				[95145] = true,
				[95146] = true,
				[95200] = true,
				[95201] = true,
			},
			quests = {
				-- 6.0 coins
				[36054] = true, -- Sealing Fate: Gold
				[37454] = true, -- Sealing Fate: Piles of Gold
				[37455] = true, -- Sealing Fate: Immense Fortune of Gold
				[36055] = true, -- Sealing Fate: Apexis Crystals
				[37452] = true, -- Sealing Fate: Heap of Apexis Crystals
				[37453] = true, -- Sealing Fate: Mountain of Apexis Crystals
				[36056] = true, -- Sealing Fate: Garrison Resources
				[37456] = true, -- Sealing Fate: Stockpiled Garrison Resources
				[37457] = true, -- Sealing Fate: Tremendous Garrison Resources
				[36057] = true, -- Sealing Fate: Honor

				-- 7.0 coins
				[43892] = true, -- Sealing Fate: Order Resources
				[43893] = true, -- Sealing Fate: Stashed Order Resources
				[43894] = true, -- Sealing Fate: Extraneous Order Resources
				[43895] = true, -- Sealing Fate: Gold
				[43896] = true, -- Sealing Fate: Piles of Gold
				[43897] = true, -- Sealing Fate: Immense Fortune of Gold
				[47851] = true, -- Sealing Fate: Marks of Honor
				[47864] = true, -- Sealing Fate: Additional Marks of Honor
				[47865] = true, -- Sealing Fate: Piles of Marks of Honor

				-- 8.0 coins
				[52834] = true, -- Seal of Wartorn Fate: Gold
				[52838] = true, -- Seal of Wartorn Fate: Piles of Gold
				[52835] = true, -- Seal of Wartorn Fate: Marks of Honor
				[52839] = true, -- Seal of Wartorn Fate: Additional Marks of Honor
				[52837] = true, -- Seal of Wartorn Fate: War Resources
				[52840] = true, -- Seal of Wartorn Fate: Stashed War Resources

				-- 7.0 valuable resources
				[48910] = true, -- Supplying Krokuun
				[48634] = true, -- Further Supplying Krokuun
				[48911] = true, -- Void Inoculation
				[48635] = true, -- More Void Inoculation
				[48799] = true, -- Fuel for a Doomed World

				-- 8.0 emissaries
				[54451] = true, -- Baubles from the Seekers
				[53982] = true, -- Supplies From The Unshackled
				[54453] = true, -- Supplies from Magni
				[54454] = true, -- Supplies from 7th Legion
				[54455] = true, -- Supplies from Honorbound
				[54456] = true, -- Supplies from Order of Embers
				[54457] = true, -- Supplies from Storm Wake
				[54458] = true, -- Supplies from Proudmoore Admiralty
				[54460] = true, -- Supplies from Talanji's Expedition
				[54461] = true, -- Supplies from Voldunai Supplies
				[54462] = true, -- Supplies from Zandalari Empire
				[55348] = true, -- Supplies from the Rustbolt Resistance
				[55976] = true, -- Supplies From the Waveblade Ankoan

				-- 9.0 valuable resources
				[64541] = true, -- The Cost of Death (Ve'nari)

				-- 10.0 valuable resources
				[70183] = true, -- Specialized Secrets: Alchemy (Khadin)
				[70184] = true, -- Specialized Secrets: Blacksmithing (Khadin)
				[70186] = true, -- Specialized Secrets: Enchanting (Khadin)
				[70187] = true, -- Specialized Secrets: Engineering (Khadin)
				[70190] = true, -- Specialized Secrets: Herbalism (Khadin)
				[70188] = true, -- Specialized Secrets: Inscription (Khadin)
				[70189] = true, -- Specialized Secrets: Jewelcrafting (Khadin)
				[70191] = true, -- Specialized Secrets: Leatherworking (Khadin)
				[70192] = true, -- Specialized Secrets: Mining (Khadin)
				[70193] = true, -- Specialized Secrets: Skinning (Khadin)
				[70194] = true, -- Specialized Secrets: Tailoring (Khadin)
				[75164] = true, -- In Need of Primal Foci
				[75165] = true, -- In Need of Concentrated Primal Foci
				[75166] = true, -- In Need of Many Primal Foci
				[75167] = true, -- In Need of Many Concentrated Primal Foci
			},
		},
	},
}

function addon:ADDON_LOADED(name)
	if name == addonName then
		-- initialize database with defaults
		addon.db = LibStub('AceDB-3.0'):New('QuickQuestDB2', defaults, true)

		return true -- unregister self
	end
end
