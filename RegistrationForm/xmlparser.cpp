#include "xmlparser.h"

#include "utility.h"

XmlParser::XmlParser(QString xmlFilename, QObject* parent)
    : QObject(parent), xmlFilename_(xmlFilename), document_("xmlDoc"), file_(xmlFilename_) {
    if (!file_.open(QIODevice::ReadOnly)) {
        utility::error("file " + xmlFilename_ + " wasn't opened!");
    }

    if (!document_.setContent(&file_)) {
        file_.close();
        utility::error("setContent() failed!");
    }

    file_.close();
}

QStringList XmlParser::getNames(QString rootName) {
    QStringList countries;

    QDomElement root = document_.documentElement();
    if (root.tagName() != rootName) {
        utility::error("root element \"" + rootName + "\" wasn't found!");
    }

    // iterate through all country nodes
    QDomNode countryNode = root.firstChild();
    while (!countryNode.isNull()) {
        // iterate through all childs of country ( code, name )
        QDomNode curNode = countryNode.firstChild();
        while (!curNode.isNull()) {
            // if name is found then add it to container
            QDomElement element = curNode.toElement();
            if (!element.isNull() && (element.tagName() == "name")) {
                countries.push_back(element.text());
            }
            curNode = curNode.nextSibling();
        }
        countryNode = countryNode.nextSibling();
    }

    return countries;
}
