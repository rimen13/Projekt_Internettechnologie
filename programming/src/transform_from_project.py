# import os for path handling
import os

# import backend transformation logic
from transform_backend import transform_backend


# define the project-based transformation entry point
def transform_from_project():
    """
    use predefined project xml and xslt files
    """

    # determine the directory of this file
    base_dir = os.path.dirname(os.path.abspath(__file__))

    # move up to the project root directory
    project_root = os.path.abspath(os.path.join(base_dir, "..", ".."))

    # define the output directory
    output_dir = os.path.join(project_root, "programming", "output")

    # define the xml input path
    xml_path = os.path.join(project_root, "assets", "src", "products.xml")

    # define the xslt input path
    xslt_path = os.path.join(project_root, "assets", "src", "products-to-html.xslt")

    # define the html output path
    html_output_path = os.path.join(output_dir, "products.html")

    # execute backend transformation
    transform_backend(xml_path, xslt_path, html_output_path)


# execute only when this file is run directly
if __name__ == "__main__":
    # run project-based transformation
    transform_from_project()
