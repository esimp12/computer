cmake_minimum_required(VERSION 3.20)
project(COMPUTER)

# Find all project verilog files
file(GLOB_RECURSE verilog_files CONFIGURE_DEPENDS
    "${CMAKE_SOURCE_DIR}/src/**/*.v"
)

# Filter out source files from testbenches
set(source_files "")
set(testbench_files "")
foreach(f ${verilog_files})
    if(f MATCHES "_tb\\.v$")
        list(APPEND testbench_files ${f})
    else()
        list(APPEND source_files ${f})
    endif()
endforeach()

# Function for creating testbench targets dynamically
function(add_verilog_testbench tb_file)
    # Get testbench directory and testbench file
    get_filename_component(tb_name ${tb_file} NAME_WE)

    # Set name of binary
    set(tb_bin ${CMAKE_CURRENT_BINARY_DIR}/${tb_name})

    # TODO: Use yosys to get the exact components needed as dependencies
    # NOTE: We currently pass all verilog *.v files as source files for 
    # synthesization even if a testbench doesn't use that source.
    #
    # Set target for build, custom verilog command to synthesize, and 
    # install final binary into bin directory
    add_custom_target(
        ${tb_name}_target ALL
        DEPENDS ${tb_bin}
    )
    add_custom_command(
        OUTPUT ${tb_bin}
        COMMAND iverilog -o ${tb_bin} ${tb_file} ${source_files}
        DEPENDS ${tb_file} ${source_files}
        COMMENT "Compiling testbench ${tb_name}"
        VERBATIM
    )
    install( 
        FILES ${tb_bin} 
        DESTINATION ${CMAKE_SOURCE_DIR}/bin
        PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE
                    GROUP_READ GROUP_EXECUTE
                    WORLD_READ WORLD_EXECUTE
    )
endfunction()

# Create all testbench targets
foreach(tb_file ${testbench_files})
    add_verilog_testbench(${tb_file})
endforeach()


# TODO: Create targets to generate images of circuit diagrams
