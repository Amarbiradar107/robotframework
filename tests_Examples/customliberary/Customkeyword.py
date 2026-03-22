from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Customkeyword:
    def __init__(self):
            self.SeleniumLibrary = BuiltIn.get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("hello world")
    @keyword
    def min_enrollments(self, enrolement):

        self.SeleniumLibrary.click_element("${Enrollments_dropdown}")




