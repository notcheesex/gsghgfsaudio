local inputChest = peripheral.wrap("left")
local badItemsChest = peripheral.wrap("top")
local goodItemsChest = peripheral.wrap("right")
badlist = {'relics:infinity_ham', 'minecraft:enchanted_book'}

function table_contains(tbl, x)
  found = false
  for _, v in pairs(tbl) do
      if v == x then 
          found = true 
      end
  end
  return found
end

while true do
  for slot, item in pairs(inputChest.list()) do

    local itemDetails = inputChest.getItemDetail(slot)
    if not table_contains(badlist, itemDetails.name) then
      if itemDetails.nbt then
        inputChest.pushItems(peripheral.getName(badItemsChest), slot)
      else
        inputChest.pushItems(peripheral.getName(goodItemsChest), slot)
      end
    end
  end
end
