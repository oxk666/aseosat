  
local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local PlayerData = nil
local UsedAccessories = {}
local debug = true -- F8

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

function GetCountItem(itemname)
	local inventory = ESX.GetPlayerData().inventory
	for i=1, #inventory, 1 do
	  	if inventory[i].name == itemname then
			return inventory[i].count
	  	end
	end
	return 0
end

-- Piippusarja

function AvaaPiippusarjat()
	local elements = {
		{label = "Äänenvaimennin", value = "Vaimennin"},
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'esx_aseosat',
        {
            title    = 'Piippusarja',
            align    = 'top-left',
            elements = elements,
           
        },
       
        function(data, menu)
        	if data.current.value == "Vaimennin" then
        		TriggerEvent("esx_aseosat:Silukiinni")
        	end
        end,
        function(data, menu)  
            menu.close()
        end
    )
end

-- Lamppusarja

function Avaalamppusarjat()
	local elements = {
		{label = "Taskulammpu", value = "Lamppu"},
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'esx_aseosat',
        {
            title    = 'Lamppusarja',
            align    = 'top-left',
            elements = elements,
           
        },
       
        function(data, menu)
        	if data.current.value == "Lamppu" then
        		TriggerEvent("esx_aseosat:Lamppukiinni")
        	end
        end,
        function(data, menu)  
            menu.close()
        end
    )
end

--luotiliivi
ESX          = nil
luotiliivi = false


Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx_luotiliivi:pue')
AddEventHandler('esx_luotiliivi:pue', function()
luottari = true
TriggerEvent('esx_luotiliivi:pukee') exports['progressBars']:startUI(5000, "Puetaan luotiliivejä")
Citizen.Wait(3000)
TriggerEvent('esx_luotiliivi:pukee')
 Citizen.Wait(2500)
ESX.ShowNotification('Käytit luotiliivit')
 luottari = false
  if GetPedArmour(GetPlayerPed(-1)) == 100 then
  else
    SetPedArmour(GetPlayerPed(-1), 0)
    ClearPedBloodDamage(GetPlayerPed(-1))
    ResetPedVisibleDamage(GetPlayerPed(-1))
    ClearPedLastWeaponDamage(GetPlayerPed(-1))
    ResetPedMovementClipset(GetPlayerPed(-1), 0)


    TriggerServerEvent('esx_luotiliivi:poista')
    TriggerEvent('skinchanger:getSkin', function(skin)

      if skin.sex == 0 then
       TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 27,  ['bproof_2'] = 5})
        SetPedArmour(GetPlayerPed(-1), 100)
      else
        TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 27,  ['bproof_2'] = 5})
        SetPedArmour(GetPlayerPed(-1), 100)

      end

    end)
  end

end)








Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if luottari then
			DisableControlAction(1, 32, true )
			DisableControlAction(1, 30, true )
			DisableControlAction(1, 31, true )
			DisableControlAction(1, 34, true )
			DisableControlAction(1, 25, true )
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(1, 73, true)
			DisableControlAction(1, 23, true)
			DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
			DisablePlayerFiring(ped, true) -- Disable weapon firing

		else
			Citizen.Wait(500)
		end
	end
end)


RegisterNetEvent('esx_luotiliivi:pukee')
AddEventHandler('esx_luotiliivi:pukee', function()
    local ped = PlayerPedId()
    local giveAnim = "move_f@hiking"
    RequestAnimDict(giveAnim)
    while not HasAnimDictLoaded(giveAnim) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(ped, giveAnim, "idle_intro", 8.0, 8.0, -1, 50, 0, false, false, false)
    Citizen.Wait(6090)
    ClearPedTasks(ped)
end)

--sukelluskamppeet

RegisterNetEvent('esx_aseosat:sukelluskamppeet')
AddEventHandler('esx_aseosat:sukelluskamppeet', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 12844)
	local boneIndex2 = GetPedBoneIndex(playerPed, 24818)
	
	ESX.Game.SpawnObject('p_s_scuba_mask_s', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		ESX.Game.SpawnObject('p_s_scuba_tank_s', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object2)
			AttachEntityToEntity(object2, playerPed, boneIndex2, -0.30, -0.22, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			AttachEntityToEntity(object, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			SetPedDiesInWater(playerPed, false)
			
			ESX.ShowNotification(_U('dive_suit_on') .. '%.')
			Citizen.Wait(50000)
			ESX.ShowNotification(_U('oxygen_notify', '~y~', '50') .. '%.')
			Citizen.Wait(25000)
			ESX.ShowNotification(_U('oxygen_notify', '~o~', '25') .. '%.')
			Citizen.Wait(25000)
			ESX.ShowNotification(_U('oxygen_notify', '~r~', '0') .. '%.')
			
			SetPedDiesInWater(playerPed, true)
			DeleteObject(object)
			DeleteObject(object2)
			ClearPedSecondaryTask(playerPed)
		end)
	end)
end)


-- Kahvasarjat

function Avaakahvasarjat()
	local elements = {
		{label = "Kahva", value = "Kahva"},
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'esx_aseosat',
        {
            title    = 'Kahvasarja',
            align    = 'top-left',
            elements = elements,
           
        },
       
        function(data, menu)
        	if data.current.value == "Kahva" then
        		TriggerEvent("esx_aseosat:Kahvakiinni")
        	end
        end,
        function(data, menu)  
            menu.close()
        end
    )
end

-- Lipas-sarjat

function Avaalipassarjat()
	local elements = {
		{label = "Laajennettu lipas", value = "ilipas"},
		--{label = "Valtava lipas", vlaue = "vlipas"},
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'esx_aseosat',
        {
            title    = 'Lipas-sarja',
            align    = 'top-left',
            elements = elements,
           
        },
       
        function(data, menu)
        	if data.current.value == "ilipas" then
				TriggerEvent("esx_aseosat:iLipaskiinni")
			--[[elseif data.current.value == "vlipas" In case tämä jos tulee rulla lippaat
				TriggerEvent("esx_aseosat:vLipaskiinni")]]
        	end
        end,
        function(data, menu)  
            menu.close()
        end
    )
end

function Avaatahtainsarjat()
	local elements = {
		{label = "Tähtäin", value = "tahtain"},
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'esx_aseosat',
        {
            title    = 'Tähtäinsarja',
            align    = 'top-left',
            elements = elements,
           
        },
       
        function(data, menu)
        	if data.current.value == "tahtain" then
				TriggerEvent("esx_aseosat:Tahtainkiinni")
			end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

RegisterNetEvent('esx_aseosat:Silukiinni')
AddEventHandler('esx_aseosat:Silukiinni', function()
	local PlayerPed = GetPlayerPed(-1)
	local CurrentWeaponHash = GetSelectedPedWeapon(PlayerPed)
	local EquipableWeapon = false

	if UsedAccessories.piippu == nil or UsedAccessories.Piippu < GetCountItem("piippu") then
		if UsedAccessories.Piippu == nil then
			UsedAccessories.Piippu = 0
		end
		for k, v in pairs(Config.SilentWeapons) do
			if GetHashKey(k) == CurrentWeaponHash then
				GiveWeaponComponentToPed(PlayerPed, GetHashKey(k), GetHashKey(v))
				EquipableWeapon = true
				UsedAccessories.Piippu = UsedAccessories.Piippu + 1
				ESX.ShowNotification('Äänenvaimennin kiinnitetty.')
			end
		end

		if not EquipableWeapon then
			ESX.ShowNotification('Tähän aseeseen ei saa äänenvaimenninta!')
		end
	else
		ESX.ShowNotification('Eihän noita piippusarjoja voi moneen aseeseen pistää!')
	end
end)



RegisterNetEvent('esx_aseosat:Lamppukiinni')
AddEventHandler('esx_aseosat:Lamppukiinni', function()
	local PlayerPed = GetPlayerPed(-1)
	local CurrentWeaponHash = GetSelectedPedWeapon(PlayerPed)
	local EquipableWeapon = false

	if UsedAccessories.lamppu == nil or UsedAccessories.lamppu < GetCountItem("lamppu") then
		if UsedAccessories.lamppu == nil then
			UsedAccessories.lamppu = 0
		end
		for k, v in pairs(Config.FlashLightWeapons) do
			if GetHashKey(k) == CurrentWeaponHash then
				GiveWeaponComponentToPed(PlayerPed, GetHashKey(k), GetHashKey(v))
				EquipableWeapon = true
				UsedAccessories.lamppu = UsedAccessories.lamppu + 1
				ESX.ShowNotification('Taskulamppu kiinnitetty.')
			end
		end

		if not EquipableWeapon then
			ESX.ShowNotification('Tähän aseeseen ei saa taskulamppua!')
		end
	else
		ESX.ShowNotification('Eihän noita lamppusarjoja voi moneen aseeseen pistää!')
	end
end)

RegisterNetEvent('esx_aseosat:Kahvakiinni')
AddEventHandler('esx_aseosat:Kahvakiinni', function()
	local PlayerPed = GetPlayerPed(-1)
	local CurrentWeaponHash = GetSelectedPedWeapon(PlayerPed)
	local EquipableWeapon = false

	if UsedAccessories.kahva == nil or UsedAccessories.kahva < GetCountItem("kahva") then
		if UsedAccessories.kahva == nil then
			UsedAccessories.kahva = 0
		end
		for k, v in pairs(Config.GripWeapons) do
			if GetHashKey(k) == CurrentWeaponHash then
				GiveWeaponComponentToPed(PlayerPed, GetHashKey(k), GetHashKey(v))
				EquipableWeapon = true
				UsedAccessories.kahva = UsedAccessories.kahva + 1
				ESX.ShowNotification('Kahva kiinnitetty.')
			end
		end

		if not EquipableWeapon then
			ESX.ShowNotification('Tähän aseeseen ei saa kahvaa!')
		end
	else
		ESX.ShowNotification('Eihän noita kahvasarjoja voi moneen aseeseen pistää!')
	end
end)



RegisterNetEvent('esx_aseosat:iLipaskiinni')
AddEventHandler('esx_aseosat:iLipaskiinni', function()
	local PlayerPed = GetPlayerPed(-1)
	local CurrentWeaponHash = GetSelectedPedWeapon(PlayerPed)
	local EquipableWeapon = false

	if UsedAccessories.lipas2 == nil or UsedAccessories.lipas2 < GetCountItem("lipas2") then
		if UsedAccessories.lipas2 == nil then
			UsedAccessories.lipas2 = 0
		end
		for k, v in pairs(Config.ExtendedMagazineWeapons) do
			if GetHashKey(k) == CurrentWeaponHash then
				GiveWeaponComponentToPed(PlayerPed, GetHashKey(k), GetHashKey(v))
				EquipableWeapon = true
				UsedAccessories.lipas2 = UsedAccessories.lipas2 + 1
				ESX.ShowNotification('Laajennettu lipas kiinnitetty.')
			end
		end

		if not EquipableWeapon then
			ESX.ShowNotification('Ohhoh lipas-sarjasta ei löydy tähän aseeseen lippaita!')
		end
	else
		ESX.ShowNotification('Eihän noita lipas-sarjoja voi moneen aseeseen pistää!')
	end
end)

RegisterNetEvent('esx_aseosat:Tahtainkiinni')
AddEventHandler('esx_aseosat:Tahtainkiinni', function()
	local PlayerPed = GetPlayerPed(-1)
	local CurrentWeaponHash = GetSelectedPedWeapon(PlayerPed)
	local EquipableWeapon = false

	if UsedAccessories.tahtain == nil or UsedAccessories.tahtain < GetCountItem("tahtain") then
		if UsedAccessories.tahtain == nil then
			UsedAccessories.tahtain = 0
		end
		for k, v in pairs(Config.ScopeWeapons) do
			if GetHashKey(k) == CurrentWeaponHash then
				GiveWeaponComponentToPed(PlayerPed, GetHashKey(k), GetHashKey(v))
				EquipableWeapon = true
				UsedAccessories.tahtain = UsedAccessories.tahtain + 1
				ESX.ShowNotification('Tähtäin kiinnitetty.')
			end
		end

		if not EquipableWeapon then
			ESX.ShowNotification('Ohhoh tähtäintä ei löydy tähän aseeseen!')
		end
	else
		ESX.ShowNotification('Eihän noita tähtäin-sarjoja voi moneen aseeseen pistää!')
	end
end)

RegisterNetEvent('esx_aseosat:Lippaat')
AddEventHandler('esx_aseosat:Lippaat', function(source)
	local ase = GetSelectedPedWeapon(GetPlayerPed(-1))
	for k, v in pairs(Config.Aseet) do
		if GetHashKey(k) == ase then
			print(k.. " ".. v)
			TriggerServerEvent('esx_aseosat:Lippaanpoisto')
			AddAmmoToPed(GetPlayerPed(-1), GetHashKey(k),tonumber(v)) -- annetaan ammuksia aseeseen k summa v
			ESX.ShowNotification('Käytit lippaan josta sait panoksia '.. v) -- Kerrotaan panosten määrä joka annettiin
		end
	end
end)

RegisterNetEvent('esx_aseosat:Piippusarjak')
AddEventHandler('esx_aseosat:Piippusarjak', function(source)
	AvaaPiippusarjat()
end)

RegisterNetEvent('esx_aseosat:Tahtainsarjak')
AddEventHandler('esx_aseosat:Tahtainsarjak', function(source)
	Avaatahtainsarjat()
end)

RegisterNetEvent('esx_aseosat:Lamppusarjak')
AddEventHandler('esx_aseosat:Lamppusarjak', function(source)
	Avaalamppusarjat()
end)

RegisterNetEvent('esx_aseosat:Kahvasarjak')
AddEventHandler('esx_aseosat:Kahvasarjak', function(source)
	Avaakahvasarjat()
end)

RegisterNetEvent('esx_aseosat:Lipassarjak')
AddEventHandler('esx_aseosat:Lipassarjak', function(source)
	Avaalipassarjat()
end)



--[[ Debugiin CT
Citizen.CreateThread(function()
	while true do
		print('moi')
		Citizen.Wait(5000)
		local ase = GetSelectedPedWeapon(GetPlayerPed(-1))
		for k, v in pairs(Config.Aseet) do
			if GetHashKey(k) == ase then
				print(k.. " ".. v)
				-- annetaan ammuksia aseeseen k summa v
				--ESX.ShowNotification('Käytit lippaan josta sait panoksia '.. v) 
			end
		end
	end
end)	]]