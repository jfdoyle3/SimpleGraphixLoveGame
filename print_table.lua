
-- Prints a table to console
function printTable(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. printTable(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end



	-- outputs to screen
	print(printTable(table))