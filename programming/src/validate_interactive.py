# import tkinter for file dialogs
import tkinter as tk

# import file dialog utilities
from tkinter import filedialog

# import backend validation logic
from validate_backend import validate_backend


# define the interactive validation entry point
def validate_interactive():
    """
    let the user select xml and xsd files interactively
    """

    # create a hidden tkinter root window
    root = tk.Tk()

    # hide the main window
    root.withdraw()

    # let the user select xml and xsd files
    file_paths = filedialog.askopenfilenames(
        title="Select XML and XSD files",
        filetypes=[("XML or XSD files", "*.xml *.xsd")]
    )

    # abort if not enough files were selected
    if not file_paths or len(file_paths) < 2:
        print("You must select both XML and XSD files. Validation canceled.")
        return

    # filter xml files
    xml_files = [f for f in file_paths if f.lower().endswith(".xml")]

    # filter xsd files
    xsd_files = [f for f in file_paths if f.lower().endswith(".xsd")]

    # ensure valid selection
    if not xml_files or not xsd_files:
        print("Selection must include at least one XML and one XSD file.")
        return

    # select the first xml file
    xml_path = xml_files[0]

    # select the first xsd file
    xsd_path = xsd_files[0]

    # execute backend validation
    validate_backend(xml_path, xsd_path)


# execute only when this file is run directly
if __name__ == "__main__":
    # start interactive validation mode
    validate_interactive()
