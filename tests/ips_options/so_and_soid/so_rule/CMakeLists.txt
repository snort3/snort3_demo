cmake_minimum_required ( VERSION 3.4.3 )
project (sorule_id_3_13 C CXX)

set (CMAKE_CXX_STANDARD 14)
set (CMAKE_CXX_STANDARD_REQUIRED ON)
set (CMAKE_CXX_EXTENSIONS OFF)

include ( FindPkgConfig )
pkg_search_module ( SNORT3 REQUIRED snort>=3 )

add_library (
    so_rule
    MODULE
    sid_3_13.cc
    sid_3_13.h
)

target_compile_options (
    so_rule
    PRIVATE
        -fno-rtti
)

set_target_properties (
    so_rule
    PROPERTIES
        PREFIX ""
)

target_include_directories (
    so_rule PUBLIC
    ${SNORT3_INCLUDE_DIRS}
)

install (
    TARGETS so_rule
    LIBRARY
    DESTINATION "${CMAKE_SOURCE_DIR}/install"
)
