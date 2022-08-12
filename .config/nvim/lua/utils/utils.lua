local M = {}

---Checks if `property` exists at the top level in `package.json`.
---Depends on `jq`.
--@param utils (table) containing `root_has_file` function
--@param property (string) name of property to search for
--@return (boolean)
function M.propertyExistsInPackageJson(utils, property)
  local file_exists = utils.root_has_file({ "package.json" })
  if not file_exists then
    return false
  end
  local handle = io.popen("jq -j 'has(\"" .. property .. "\")' package.json")
  if handle == nil then
    return false
  end
  local output = handle:read("*a")
  handle:close()
  return output
end

return M
