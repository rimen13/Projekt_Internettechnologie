# import os for path handling
import os

# import backend validation logic
from validate_backend import validate_backend


# define the project-based validation entry point
def validate_from_project():
    """
    validate predefined project xml against project xsd
    """

    # determine the directory of this file
    base_dir = os.path.dirname(os.path.abspath(__file__))

    # move up to the project root directory
    project_root = os.path.abspath(os.path.join(base_dir, "..", ".."))

    # define the xml input path
    xml_path = os.path.join(project_root, "assets", "src", "products.xml")

    # define the xsd input path
    xsd_path = os.path.join(project_root, "assets", "src", "products.xsd")

    # execute backend validation
    validate_backend(xml_path, xsd_path)


# execute only when this file is run directly
if __name__ == "__main__":
    # run project-based validation
    validate_from_project()
