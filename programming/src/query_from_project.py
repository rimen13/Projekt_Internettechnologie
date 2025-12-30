# import os for path handling
import os

# import backend query logic
from query_backend import query_backend


# define the project-based query entry point
def query_from_project():
    """
    execute queries using the predefined project xml file
    """

    # determine the directory of this file
    base_dir = os.path.dirname(os.path.abspath(__file__))

    # move up to the project root directory
    project_root = os.path.abspath(os.path.join(base_dir, "..", ".."))

    # build the absolute path to the xml file
    xml_path = os.path.join(project_root, "assets", "src", "products.xml")

    # execute the backend query logic
    query_backend(xml_path)


# execute only when this file is run directly
if __name__ == "__main__":
    # run the project-based query
    query_from_project()
