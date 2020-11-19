create or replace script example() as
    local success, res = pquery([[SELECT * FROM DB_SCRIPT."Infomover" ORDER BY "Kennzahl"]])

    local case_when = ""
    -- test
    for i=1, #res do
        if res[i][2] == "Lieferungen" then
            local line = " CASE WHEN " .. res[i][3] .. "." .. res[i][4] .. " = " .. res[i][5] .. " THEN 'X' END AS " .. res[i][2]
            print(line)
        else
            print(" CASE WHEN TEST = 'A' THEN 'X' END AS TEST")
        end
    end

    local field = [[user_name,
                   CASE WHEN user_name = 'SYS' THEN 'X' END AS Standarduser]]
    local table = "EXA_ALL_SESSIONS"
    res = query("CREATE OR REPLACE VIEW Test_View AS SELECT " .. field .. " FROM " .. table)

/
execute script example() with output; 