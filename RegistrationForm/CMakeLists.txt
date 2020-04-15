cmake_minimum_required(VERSION 3.5)

project(RegistrationForm LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(Qt5 COMPONENTS Core Quick Widgets QuickWidgets Xml REQUIRED)

    add_executable(RegistrationForm
      main.cpp
      utility.h
      xmlparser.cpp
      xmlparser.h
      comboboxupdate.cpp
      comboboxupdate.h
      qml.qrc
    )

target_compile_definitions(RegistrationForm
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(RegistrationForm
  PRIVATE Qt5::Core Qt5::Quick Qt5::Widgets Qt5::QuickWidgets Qt5::Xml)
