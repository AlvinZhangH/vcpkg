include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO hughperkins/Jinja2CppLight
    REF 04196b080adf6edb86184824a1cf948ace310d19 #Commits on May 8, 2018 
    SHA512 30415da5ebc4fb805953cc9ff7e5fcd357d6fa1818c1ff2570b795252de6215562cd0f2f0418a1fa60e9d74b88339a3fea7166b898f54cface6ab1cfe3581bb5
    HEAD_REF master
    PATCHES
        fix-cmakelists.patch	
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)