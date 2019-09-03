include(vcpkg_common_functions)

if (NOT VCPKG_TARGET_IS_WINDOWS)
    message(FATAL_ERROR "${PORT} only supports windows")
endif()

vcpkg_download_distfile(SDK_ARCHIVE
    URLS "https://download.microsoft.com/download/A/E/7/AE743F1F-632B-4809-87A9-AA1BB3458E31/DXSDK_Jun10.exe"
    FILENAME "DXSDK_Jun10.exe"
    SHA512  4869ac947a35cd0d6949fbda17547256ea806fef36f48474dda63651f751583e9902641087250b6e8ccabaab85e51effccd9235dc6cdf64e21ec2b298227fe19
)

vcpkg_extract_source_archive_ex(
    ARCHIVE ${SDK_ARCHIVE}
    OUT_SOURCE_PATH SOURCE_PATH
)

FILE(INSTALL ${SOURCE_PATH}/Include DESTINATION ${CURRENT_PACKAGES_DIR}/Include/${PORT})
file(INSTALL "${SOURCE_PATH}/Documentation/License Agreements/DirectX SDK EULA.txt" DESTINATION ${CURRENT_PACKAGES_DIR}/share/directxsdk RENAME copyright)
