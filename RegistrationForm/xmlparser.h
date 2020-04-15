#pragma once

#include <QDomDocument>
#include <QFile>
#include <QMessageBox>
#include <QObject>
#include <QStringList>
#include <stdexcept>

class XmlParser : public QObject {
    Q_OBJECT
public:
    explicit XmlParser(QString xmlFilename, QObject *parent = nullptr);
    QStringList getNames(QString rootName = "countries");

signals:

    // variables
private:
    QString xmlFilename_;
    QDomDocument document_;
    QFile file_;
};
