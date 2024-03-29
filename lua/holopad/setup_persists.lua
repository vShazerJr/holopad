/**
   	 _    _       _                       _ 
	| |  | |     | |                     | |
	| |__| | ___ | | ___  _ __   __ _  __| |
	|  __  |/ _ \| |/ _ \| '_ \ / _` |/ _` |
	| |  | | (_) | | (_) | |_) | (_| | (_| |
	|_|  |_|\___/|_|\___/| .__/ \__,_|\__,_|
	By Bubbus			 | | Persisted variables
	splambob@gmail.com	 |_| 20/08/2012               

	Persistence is very cool.
	
//*/


// TODO: this in table form


if Holopad.Persist then

	Holopad.Persist.Retrieve()
	
	// Camera inversions
	if !Holopad.Persist.IsRegistered("Holopad.InvertCameraX") then
		Holopad.Persist.RegisterGlobal("Holopad.InvertCameraX")
	end

	if !Holopad.Persist.IsRegistered("Holopad.InvertCameraY") then
		Holopad.Persist.RegisterGlobal("Holopad.InvertCameraY")
	end


	// Panning inversions
	if !Holopad.Persist.IsRegistered("Holopad.InvertPanningX") then
		Holopad.Persist.RegisterGlobal("Holopad.InvertPanningX")
	end

	if !Holopad.Persist.IsRegistered("Holopad.InvertPanningY") then
		Holopad.Persist.RegisterGlobal("Holopad.InvertPanningY")
	end


	// Autosave settings
	if !Holopad.Persist.IsRegistered("Holopad.AutosaveCurrent") then
		Holopad.Persist.RegisterGlobal("Holopad.AutosaveCurrent")
	end
	
	if !Holopad.Persist.IsRegistered("Holopad.AutosaveOnClose") then
		Holopad.Persist.RegisterGlobal("Holopad.AutosaveOnClose")
	end
	
	if !Holopad.Persist.IsRegistered("Holopad.AutosaveMax") then
		Holopad.Persist.RegisterGlobal("Holopad.AutosaveMax")
	end
	
	
	// Grid settings
	if !Holopad.Persist.IsRegistered("Holopad.GridAutoCenter") then
		Holopad.Persist.RegisterGlobal("Holopad.GridAutoCenter")
	end
	
	if !Holopad.Persist.IsRegistered("Holopad.GridAutoOrient") then
		Holopad.Persist.RegisterGlobal("Holopad.GridAutoOrient")
	end
	
	if !Holopad.Persist.IsRegistered("Holopad.GridMaterial") then
		Holopad.Persist.RegisterGlobal("Holopad.GridMaterial")
	end
	
	
	// Snap settings
	if !Holopad.Persist.IsRegistered("Holopad.AngleSnap") then
		Holopad.Persist.RegisterGlobal("Holopad.AngleSnap")
	end
	
	if !Holopad.Persist.IsRegistered("Holopad.ScaleSnap") then
		Holopad.Persist.RegisterGlobal("Holopad.ScaleSnap")
	end
	
	
	// Viewport lighting
	if !Holopad.Persist.IsRegistered("Holopad.ViewportLighting") then
		Holopad.Persist.RegisterGlobal("Holopad.ViewportLighting")
	end
	
	if !Holopad.Persist.IsRegistered("Holopad.BACKGROUND_COLOUR") then
		Holopad.Persist.RegisterGlobal("Holopad.BACKGROUND_COLOUR")
	end

end