Config = {}
Config.Group = 'superadmin'
Config.Discord = 'https://discordapp.com/api/webhooks/687064852585250945/EWsYC4pJ9tqfyp1oNK9ocrVZN1sdPRO6X_XjpPROt1O3SabOMgLMGQFgmzDYdaprkvQJ'

Config.JailPositions = {
	["Cell"] = { ["x"] = 1799.8345947266, ["y"] = 2489.1350097656, ["z"] = -119.02998352051, ["h"] = 179.03021240234 }
}

Config.Cutscene = {
	["PhotoPosition"] = { ["x"] = 402.91567993164, ["y"] = -996.75970458984, ["z"] = -99.000259399414, ["h"] = 186.22499084473 },

	["CameraPos"] = { ["x"] = 402.88830566406, ["y"] = -1003.8851318359, ["z"] = -97.419647216797, ["rotationX"] = -15.433070763946, ["rotationY"] = 0.0, ["rotationZ"] = -0.31496068835258, ["cameraId"] = 0 },

	["PolicePosition"] = { ["x"] = 402.91702270508, ["y"] = -1000.6376953125, ["z"] = -99.004028320313, ["h"] = 356.88052368164 }
}

Config.PrisonWork = {
	["DeliverPackage"] = { ["x"] = 0, ["y"] = 0, ["z"] = 0, ["h"] = 267.89135742188 },

	["Packages"] = {
		[1] = { ["x"] = 0, ["y"] = 0, ["z"] = 0, ["state"] = true },
		[2] = { ["x"] = 0, ["y"] = 0, ["z"] = 0, ["state"] = true },
		[3] = { ["x"] = 0, ["y"] = 0, ["z"] = 0, ["state"] = true },
		[4] = { ["x"] = 0, ["y"] = 0, ["z"] = 0, ["state"] = true },
		[5] = { ["x"] = 0, ["y"] = 0, ["z"] = 0, ["state"] = true },
		[6] = { ["x"] = 0, ["y"] = 0, ["z"] = 0, ["state"] = true },
		[7] = { ["x"] = 0, ["y"] = 0, ["z"] = 0, ["state"] = true },
		[8] = { ["x"] = 0, ["y"] = 0, ["z"] = 0, ["state"] = true },
		[9]= { ["x"] = 0, ["y"] = 0, ["z"] = 0, ["state"] = true },
		[10] = { ["x"] = 0, ["y"] = 0, ["z"] = 0, ["state"] = true },
	}
}

Config.Teleports = {
	["Prison Work"] = { 
		["x"] = 0, 
		["y"] = 0, 
		["z"] = 0, 
		["h"] = 0, 
		["goal"] = { 
			"Jail" 
		} 
	},

	["Boiling Broke"] = { 
		["x"] = 0, 
		["y"] = 0, 
		["z"] = 0, 
		["h"] = 0, 
		["goal"] = { 
			"Security" 
		} 
	},

	["Jail"] = { 
		["x"] = 0, 
		["y"] = 0, 
		["z"] = 0, 
		["h"] = 0, 
		["goal"] = { 
			"Prison Work", 
			"Security", 
			"Visitor" 
		} 
	},

	["Security"] = { 
		["x"] = 0, 
		["y"] = 0, 
		["z"] = 0, 
		["h"] = 0, 
		["goal"] = { 
			"Jail",
			"Boiling Broke"
		} 
	},

	["Visitor"] = {
		["x"] = 0, 
		["y"] = 0, 
		["z"] = 0, 
		["h"] = 0, 
		["goal"] = { 
			"Jail" 
		} 
	}
}