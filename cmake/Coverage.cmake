find_library(CLANG_RT_LIB clang_rt.profile-x86_64 REQUIRED
    HINTS "C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/Llvm/x64/lib/clang/13.0.1/lib/windows")

function(AddCoverage target)
    find_program(LCOV_PATH lcov llvm-cov REQUIRED)
    find_program(PROFDATA_PATH profdata llvm-profdata REQUIRED)
    find_program(GCOVR_PATH gcovr REQUIRED)
    # find_program(GENHTML_PATH genhtml REQUIRED)

    add_custom_target(${target}-coverage
        COMMENT "Running coverage for ${target}..."
        COMMAND ${CMAKE_COMMAND} -E env LLVM_PROFILE_FILE=${target}.profraw $<TARGET_FILE:${target}>
        COMMAND ${PROFDATA_PATH} merge --sparse ${target}.profraw --output ${target}.profdata
        # COMMAND ${LCOV_PATH} report $<TARGET_FILE:${target}> --instr-profile=${target}.profdata
        COMMAND ${LCOV_PATH} report $<TARGET_FILE:${target}> -instr-profile=${target}.profraw
        COMMAND ${GCOVR_PATH} --cobertura-pretty ${target}-coverage.xml -r ${CMAKE_SOURCE_DIR}
        # COMMAND rm -rf ${target}.profraw ${target}.profdata
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    )
    target_compile_options(${target}
        PUBLIC
            $<$<CXX_COMPILER_ID:Clang>:-fprofile-instr-generate;-fcoverage-mapping>)
            # $<$<AND:$<CXX_COMPILER_ID:Clang>,$<STREQUAL:${CMAKE_CXX_COMPILER_FRONTEND_VARIANT},GNU>>:-fprofile-instr-generate;-fcoverage-mapping>)
endfunction()
