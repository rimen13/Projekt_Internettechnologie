# import tkinter for file dialogs
import tkinter as tk

# import file dialog utilities
from tkinter import filedialog

# import os for path handling
import os

# import backend query logic
from query_backend import query_backend

# import backend validation logic
from validate_backend import validate_backend


# define the interactive query entry point
def query_interactive():
    """
    let the user select an xml file and validate it before querying
    """

    # determine the directory of this file
    base_dir = os.path.dirname(os.path.abspath(__file__))

    # move up to the project root directory
    project_root = os.path.abspath(os.path.join(base_dir, "..", ".."))

    # build the absolute path to the xsd schema
    xsd_path = os.path.join(project_root, "assets", "src", "products.xsd")

    # create a hidden tkinter root window
    root = tk.Tk()

    # hide the main window
    root.withdraw()

    # open a file dialog to select an xml file
    xml_path = filedialog.askopenfilename(
        title="Select XML file to query",
        filetypes=[("XML files", "*.xml")]
    )

    # abort if no file was selected
    if not xml_path:
        print("No XML file selected. Query canceled.")
        return

    # inform the user that validation starts
    print("\nValidating selected XML file...")

    # validate the selected xml file
    if not validate_backend(xml_path, xsd_path):
        print("Query aborted due to validation errors.\n")
        return

    # inform the user that validation succeeded
    print("Validation successful. Executing queries...")

    # execute backend queries
    query_backend(xml_path)


# execute only when this file is run directly
if __name__ == "__main__":
    # start interactive query mode
    query_interactive()
