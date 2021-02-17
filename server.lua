ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



ESX.RegisterUsableItem('piippu',function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    print("esx_aseosat: Änkkäsarja Käytetty") -- Consoleen tieto että lipas on poistettu onnistuneesti
    xPlayer.removeInventoryItem('piippu', 1)
    TriggerClientEvent('esx_aseosat:Piippusarjak', src)
end)

ESX.RegisterUsableItem('tahtain',function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    print("esx_aseosat: Tähtäinsarja Käytetty") -- Consoleen tieto että lipas on poistettu onnistuneesti
    xPlayer.removeInventoryItem('tahtain', 1)
    TriggerClientEvent('esx_aseosat:Tahtainsarjak', src)
end)

ESX.RegisterUsableItem('lipas2',function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    print("esx_aseosat: Lipas-sarja Käytetty") -- Consoleen tieto että lipas on poistettu onnistuneesti
    xPlayer.removeInventoryItem('lipas2', 1)
    TriggerClientEvent('esx_aseosat:Lipassarjak', src)
end)

ESX.RegisterUsableItem('kahva',function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    print("esx_aseosat: Kahvasarja Käytetty") -- Consoleen tieto että lipas on poistettu onnistuneesti
    xPlayer.removeInventoryItem('kahva', 1)
    TriggerClientEvent('esx_aseosat:Kahvasarjak', src)
end)

ESX.RegisterUsableItem('lamppu',function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    print("esx_aseosat: lamppusarja Käytetty") -- Consoleen tieto että lipas on poistettu onnistuneesti
    xPlayer.removeInventoryItem('lamppu', 1)
    TriggerClientEvent('esx_aseosat:Lamppusarjak', src)
end)

ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('luotiliivi', function(luottari)
    TriggerClientEvent('esx_luotiliivi:pue', luottari)
    local xPlayer = ESX.GetPlayerFromId(luottari)
    local drill = xPlayer.getInventoryItem('luotiliivi')

    xPlayer.removeInventoryItem('luotiliivi', 1)
    TriggerClientEvent('esx_luotiliivi:pukee', luottari)
end)

ESX.RegisterUsableItem('sukelluskamppeet',function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    print("esx_aseosat: Sukellusvehkeet käytetty") -- Consoleen tieto että luotiliivi on poistettu onnistuneesti
    xPlayer.removeInventoryItem('sukelluskamppeet', 1)
    TriggerClientEvent('esx_aseosat:sukelluskamppeet', src)
end)




--[[
RegisterServerEvent('esx_aseosat:Lippaanpoisto')
AddEventHandler('esx_aseosat:Lippaanpoisto', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
end)]]

