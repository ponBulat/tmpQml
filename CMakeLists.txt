cmake_minimum_required(VERSION 3.20)

project(tmpQml VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 COMPONENTS Quick REQUIRED)

qt_add_executable(apptmpQml
    main.cpp
)

qt_add_qml_module(apptmpQml
    URI tmpQml
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(apptmpQml PROPERTIES
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptmpQml
    PRIVATE Qt6::Quick)
