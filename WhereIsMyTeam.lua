hooksecurefunc("CompactUnitFrame_UpdateName", function(frame)

-- remove icon for non-party members
if frame.icon and not UnitInParty(frame.unit) then
	frame.icon:SetTexture(nil)
	frame.icon:ClearAllPoints()
	frame.icon = nil
	frame.healthBar:SetAlpha(1)
	frame.optionTable.displaySelectionHighlight = true
end

if not UnitIsPlayer(frame.displayedUnit) then return end

if ( GetNumGroupMembers() > 5) then return end

if frame:IsForbidden() then return end
        
if not UnitInParty(frame.unit) then return end 

if frame:GetName() then return end	-- skip CompactRaidFrame. party nameplate has no name
		
if not frame.icon then
	frame.optionTable.displaySelectionHighlight = false
	frame.icon = frame:CreateTexture(nil, "OVERLAY")
	local t = CLASS_ICON_TCOORDS[select(2, UnitClass(frame.unit))]
	frame.icon:SetTexture("Interface\\GLUES\\CHARACTERCREATE\\UI-CHARACTERCREATE-CLASSES")
	frame.icon:SetTexCoord(unpack(t))
	frame.icon:SetSize(64, 64)
	frame.icon:SetPoint("CENTER", frame, "CENTER", 0, 0)
	
	frame.healthBar:SetAlpha(0)
	

end

end)
