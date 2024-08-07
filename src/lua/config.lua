local yaml = require "lyaml"

local function load_config()
    local config_file = io.open("config.yaml", "r")
    if not config_file then error("Could not open config.yaml") end
    local config_content = config_file:read("*all")
    config_file:close()
    return yaml.load(config_content)
end

local config = load_config()

-- Ensure all required fields are present
local required_fields = {
    "writings_dir", "naox_projects_file", "waozi_projects_file",
    "templates_dir", "static_dir", "assets_dir", "dist_dir",
    "writing_template", "writings_index_template", "projects_index_template", "site_description",
    "max_writings", "max_projects_display", "index_file", "site_title", "site_url", "author_name"
}

for _, field in ipairs(required_fields) do
    if not config[field] then
        error("Missing required field in config.yaml: " .. field)
    end
end

return config
