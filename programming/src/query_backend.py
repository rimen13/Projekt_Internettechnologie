# import lxml for xml parsing and xpath support
from lxml import etree


# define the backend function that contains only query logic
def query_backend(xml_path):
    """
    execute predefined xpath queries on a validated xml document
    """

    # define the namespace mapping used inside the xml
    NS = {"p": "http://www.electronics.com/products"}

    # parse the xml document from disk
    doc = etree.parse(xml_path)

    # print a label for the first query
    print("\nQuery 1: Retrieve all product IDs.")

    # execute xpath to extract all product id attributes
    ids = doc.xpath("//p:product/@id", namespaces=NS)

    # output the query result
    print("Result:", ids)

    # print a label for the second query
    print("\nQuery 2: Retrieve unique manufacturer names.")

    # extract all manufacturer text values
    manufacturers = doc.xpath(
        "//p:product/p:manufacturer/text()", namespaces=NS
    )

    # remove duplicates and sort results
    unique_manufacturers = sorted(set(manufacturers))

    # output the query result
    print("Result:", unique_manufacturers)

    # print a label for the third query
    print("\nQuery 3: Calculate the total number of resistors in stock.")

    # extract amount values only for resistor products
    amounts = doc.xpath(
        "//p:product[@type='resistor']/p:amount/text()",
        namespaces=NS
    )

    # sum up all resistor amounts
    total_resistors = sum(int(a) for a in amounts)

    # output the calculated total
    print("Result:", total_resistors)

    # print an empty line for clean output formatting
    print()
