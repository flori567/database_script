create or replace script example() as
    local success, res = pquery([[SELECT * FROM DB_SCRIPT."Infomover" ORDER BY "Kennzahl"]])

    local kpis = {"Lieferungen", "Transportaufträge"}
    local filter_string = "CASE WHEN "
    for k=1, #kpis do
        for i=1, #res do
            if res[i][2] == kpis[k] then
                filter_string = filter_string .. res[i][3] .. "." .. res[i][4] .. " = " .. res[i][5] .. " AND "

            end
        end
        filter_string = filter_string .. "THEN 'X' END AS " .. kpis[k] .. " CASE WHEN "
    end
    print(filter_string)
    -- local field = [[user_name,
    --               CASE WHEN user_name = 'SYS' THEN 'X' END AS Standarduser]]
    -- local table = "EXA_ALL_SESSIONS"
    -- res = query("CREATE OR REPLACE VIEW Test_View AS SELECT " .. field .. " FROM " .. table)

/
execute script example() with output; 