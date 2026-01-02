# import tkinter for file dialogs
import tkinter as tk

# import file dialog utilities
from tkinter import filedialog

# import backend transformation logic
from transform_backend import transform_backend


# define the interactive transformation entry point
def transform_interactive():
    """
    let the user select xml, xslt and output file interactively
    """

    # create a hidden tkinter root window
    root = tk.Tk()

    # hide the main window
    root.withdraw()

    # let the user select xml and xslt files
    file_paths = filedialog.askopenfilenames(
        title="Select XML and XSLT files",
        filetypes=[("XML or XSLT files", "*.xml *.xslt")]
    )

    # abort if not enough files were selected
    if not file_paths or len(file_paths) < 2:
        print("You must select both XML and XSLT files. Transformation canceled.")
        return

    # filter xml files
    xml_files = [f for f in file_paths if f.lower().endswith(".xml")]

    # filter xslt files
    xslt_files = [f for f in file_paths if f.lower().endswith((".xslt"))]

    # ensure valid selection
    if not xml_files or not xslt_files:
        print("Selection must include at least one XML and one XSLT file.")
        return

    # select the first xml file
    xml_path = xml_files[0]

    # select the first xslt file
    xslt_path = xslt_files[0]

    # ask for output html file path
    html_output_path = filedialog.asksaveasfilename(
        title="Save HTML file as",
        defaultextension=".html",
        filetypes=[("HTML files", "*.html")]
    )

    # abort if no output file was chosen
    if not html_output_path:
        print("No HTML output file selected. Transformation canceled.")
        return

    # execute backend transformation
    transform_backend(xml_path, xslt_path, html_output_path)


# execute only when this file is run directly
if __name__ == "__main__":
    # start interactive transformation mode
    transform_interactive()
