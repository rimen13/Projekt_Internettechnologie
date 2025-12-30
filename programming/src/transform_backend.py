# import lxml for xml and xslt processing
from lxml import etree

# import os for file handling
import os


# define the backend transformation logic
def transform_backend(xml_path, xslt_path, html_output_path):
    """
    transform xml into html using xslt
    """

    try:
        # parse the xml document
        xml_doc = etree.parse(xml_path)

        # parse the xslt stylesheet
        xslt_doc = etree.parse(xslt_path)

        # create an xslt transformer
        transform = etree.XSLT(xslt_doc)

        # apply the transformation
        result = transform(xml_doc)

        # open the output file in binary write mode
        with open(html_output_path, "wb") as f:
            # write formatted html output
            f.write(etree.tostring(result, pretty_print=True, encoding="utf-8"))

        # inform the user about successful output
        print(f"\nHTML generated: {os.path.basename(html_output_path)}\n")

    except Exception as e:
        # print any transformation errors
        print("Error during transformation:", str(e))
