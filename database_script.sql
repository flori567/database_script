create or replace script example() as
    local success, res = pquery([[SELECT * FROM DB_SCRIPT."Infomover"]])

    local case_when = ""
    -- test
    for i=1, #res do
        local line = " CASE WHEN " .. res[i][3] .. "." .. res[i][4] .. " = " .. res[i][5] .. " THEN 'X' END AS " .. res[i][2]
        case_when = case_when .. line
    end
    print(case_when)
    local field = [[user_name,
                   CASE WHEN user_name = 'SYS' THEN 'X' END AS Standarduser]]
    local table = "EXA_ALL_SESSIONS"
    res = query("CREATE OR REPLACE VIEW Test_View AS SELECT " .. field .. " FROM " .. table)

    -- output("Number of rows returned by the SELECT query: ".. #res)   -- e.g., 12
    -- output("Value of the USER_NAME column in the first row: ".. res[1].USER_NAME)  -- e.g., SYS
    -- output("Value of the first column in the first row: ".. res[1][1])  -- e.g., SYS
/
execute script example() with output; 