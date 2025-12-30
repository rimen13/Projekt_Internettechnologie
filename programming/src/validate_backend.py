# import lxml for xml validation
from lxml import etree

# import os for filename handling
import os


# define backend validation logic
def validate_backend(xml_path, xsd_path):
    """
    validate xml against xsd and return boolean result
    """

    try:
        # parse the xml document
        xml_doc = etree.parse(xml_path)

        # parse the xsd schema
        xsd_doc = etree.parse(xsd_path)

        # create the schema validator
        schema = etree.XMLSchema(xsd_doc)

        # extract filenames for readable output
        xml_name = os.path.basename(xml_path)
        xsd_name = os.path.basename(xsd_path)

        # validate the xml document
        if schema.validate(xml_doc):
            print(f"\nVALIDATION RESULT: {xml_name} is valid according to {xsd_name}\n")
            return True
        else:
            print(f"\nVALIDATION RESULT: {xml_name} is NOT valid according to {xsd_name}\n")
            print(schema.error_log)
            return False

    except Exception as e:
        # print unexpected validation errors
        print("Error during validation:", str(e))
        return False
