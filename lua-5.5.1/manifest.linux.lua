-- Lua 5.5.1, the release's sources unmodified. Lua has no packages: preconfigure compiles every
-- source but lua.c (the standalone interpreter) into liblua.a, in the build directory.
return {
    muh_build   = "0.1",
    system_libs = { "-lm", "-ldl" },
    exports     = { include_dirs = { "." }, archives = { "liblua.a" } },

    preconfigure = function(infra)
        local host, domain = infra.host, infra.domain
        local lib = domain.path_join(infra.build_dir, "liblua.a")
        if host.stat(lib) then return end
        local objects = {}
        for _, src in ipairs(domain.sorted_keys(host.scan(infra.root))) do
            if src:match("%.c$") and not src:match("/lua%.c$") then
                local obj = domain.path_join(infra.build_dir, "objs", src:match("([^/]+)%.c$") .. ".o")
                host.mkdir_p(domain.parent_dir(obj))
                assert(host.exec({ "cc", "-std=c99", "-O2", "-DLUA_USE_LINUX", "-c", src, "-o", obj }), "compiling " .. src)
                objects[#objects + 1] = obj
            end
        end
        assert(host.exec({ "ar", "rcs", lib, table.unpack(objects) }), "archiving " .. lib)
    end,
}
