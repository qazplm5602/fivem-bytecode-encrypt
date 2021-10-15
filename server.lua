RegisterCommand('encrypt', function(source,args)
    if source == 0 then -- only console
        if args[2] == nil or args[2] == "" or args[1] == nil or args[1] == "" then
            print("Unknown Command!")
            return
        end
        if args[1] == "@" then
            args[1] = GetCurrentResourceName()
        end

        local code = LoadResourceFile(args[1], args[2]..".lua")
        if code == nil then
            print("Unknown File!")
            return
        end

        print("encrypting...")
        local buff = 'load("'
        for v=1,string.len(code) do
            buff=buff..'\\'..string.byte(code,v)
            if string.len(code) == v then
                buff=buff..'")()'
            end
        end
        Citizen.Wait(1000)
        SaveResourceFile(args[1], args[2]..".lua", buff, -1)
        print("done!")
    end
end, false)