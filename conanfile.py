from conans import ConanFile, CMake, tools


class RecipeConan(ConanFile):
    name = "MyLibrary"
    version = "1.0.0"
    license = "<Put the package license here>"
    author = "<Put your name here> <And your email here>"
    url = "<Package recipe repository url here, for issues about the package>"
    description = "<Description of MyLibrary here>"
    topics = ("<Put some tag here>", "<here>", "<and here>")
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False], "fPIC": [True, False]}
    default_options = {"shared": False, "fPIC": True}
    generators = "cmake_paths","cmake"

    def config_options(self):
        if self.settings.os == "Windows":
            del self.options.fPIC

    def export_sources(self):
        self.copy("src/*")
        self.copy("include/*")
        self.copy("tools/*")
        self.copy("CMakeLists.txt")
        self.copy("test/*")
        
    def _configure_cmake(self):
        cmake = CMake(self)
        cmake.definitions["CMAKE_INSTALL_PREFIX"]=self.package_folder
        cmake.configure()
        return cmake

    def build(self):
        cmake = self._configure_cmake()
        cmake.build()
        cmake.test()

    def package(self):
        cmake = self._configure_cmake()
        cmake.install()


    def package_info(self):
        self.cpp_info.libs = ["MyLibrary"]

