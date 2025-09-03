cmake_minimum_required(VERSION 3.20)
project(COMPUTER)

# Local directories
set(scripts_dir "${CMAKE_SOURCE_DIR}/scripts")
set(bin_dir "${CMAKE_SOURCE_DIR}/bin")
set(svg_dir "${CMAKE_SOURCE_DIR}/svgs")
set(src_dir "${CMAKE_SOURCE_DIR}/src")

# Find all project verilog files
file(GLOB_RECURSE verilog_files CONFIGURE_DEPENDS
    "${src_dir}/**/*.v"
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
    # Get testbench file
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
        DESTINATION ${bin_dir}
        PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE
                    GROUP_READ GROUP_EXECUTE
                    WORLD_READ WORLD_EXECUTE
    )
endfunction()

# Create all testbench targets
foreach(tb_file ${testbench_files})
    add_verilog_testbench(${tb_file})
endforeach()

# Set build circuit diagram script
set(build_img_script "${scripts_dir}/build-img")

# Create targets to generate images of circuit diagrams
function(add_verilog_svg vl_file)
    # Get verilog file
    get_filename_component(vl_name ${vl_file} NAME_WE)

    # Set name of output svg
    set(vl_svg ${CMAKE_CURRENT_BINARY_DIR}/${vl_name}.svg)
    # Set source files string to pass to script correctly
    string(REPLACE ";" " " source_files_str "${source_files}")

    # Set target for build, custom script to create circuit diagram, and 
    # install final svg into svgs directory
    add_custom_target(
        ${vl_name}_target ALL
        DEPENDS ${vl_svg}
    )
    add_custom_command(
        OUTPUT ${vl_svg}
        COMMAND ${build_img_script} "${source_files_str}" "${vl_name}" "${CMAKE_CURRENT_BINARY_DIR}" 
        DEPENDS ${build_img_script} ${source_files}
        COMMENT "Generating circuit diagram for module ${vl_name}"
        VERBATIM
    )
    install( 
        FILES ${vl_svg} 
        DESTINATION ${svg_dir}
        PERMISSIONS OWNER_READ OWNER_WRITE 
                    GROUP_READ 
                    WORLD_READ 
    )
endfunction()

# Create all circuit diagrams
foreach(vl_file ${source_files})
    add_verilog_svg(${vl_file})
endforeach()
