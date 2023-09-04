local projectName = "imgui_test_engine"
project(projectName)
	kind "StaticLib"
	warnings "Off"

	-- If the project location function is defined, then set the
	-- location
	-- targetdir
	-- objdir
	if project_location then
		project_location()
	end
	
	-- Define the following
	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	-- If the IncludeDirs is defines, add this project to the list
	if IncludeDirs then	
		IncludeDirs[projectName] = path.join(os.getcwd(), '.')
	end
	
	-- Include directories
	includedirs
	{
		"imgui_test_engine",
	}

	-- Files that should be included into this project
	files
	{
        -- Test Engine
        "imgui_test_engine/imgui_te*.h",
        "imgui_test_engine/imgui_te*.cpp",
        "imgui_test_engine/thirdparty/Str/Str.h",

        -- Test Suite
        "imgui_test_suite/imgui_test_suite.h",
        "imgui_test_suite/imgui_test_suite.cpp",
        "imgui_test_suite/imgui_tests*.cpp",

        -- App Minimal
        "app_minimal/app_minimal_imconfig.h",
        "app_minimal/app_minimal_main.cpp",
        "app_minimal/app_minimal_tests.cpp",
	}

    filter { 'action:vs*' }
        files
        {
            "imgui_test_engine/thirdparty/Str/Str.natvis"
        }

    filter {}
