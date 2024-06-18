local bikeModel = "africat" -- CHANGE MOTOR HERE


local function spawnBike()
  
    local playerPed = PlayerPedId()
    
    
    local playerCoords = GetEntityCoords(playerPed)
    
   
    RequestModel(bikeModel)
    while not HasModelLoaded(bikeModel) do
        Wait(500) 
    end
    
    -- Voertuig spawnen
    local vehicle = CreateVehicle(
        GetHashKey(bikeModel), -- Model hash van de motor
        playerCoords.x,        -- X-coördinaat
        playerCoords.y,        -- Y-coördinaat
        playerCoords.z,        -- Z-coördinaat
        GetEntityHeading(playerPed), -- Heading van de speler
        true, -- Netwerkbeheer inschakelen
        false -- Dit voertuig is niet mission-critical
    )
    
    
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    
   
    SetModelAsNoLongerNeeded(bikeModel)
    
    
    TriggerEvent('chat:addMessage', {
        args = { 'Motorfiets gespawnd!' }
    })
end


RegisterCommand('motor', function()
    spawnBike()
end, false)
