-- WRITEFILE TEST
-- ==============
-- just in case
-- if script
-- doesnt work
-- ==============
print("=== capabilities ===")
print("writefile: " .. tostring(type(writefile) == "function"))
print("readfile: " .. tostring(type(readfile) == "function"))
print("isfile: " .. tostring(type(isfile) == "function"))
print("getcustomasset: " .. tostring(type(getcustomasset) == "function"))
print("makefolder: " .. tostring(type(makefolder) == "function"))


if writefile then
    print("✅ can save files")
    writefile("test.txt", "hello")
    if readfile then
        print("📄 file content: " .. readfile("test.txt"))
    end
else
    print("❒ no file system access")
end
