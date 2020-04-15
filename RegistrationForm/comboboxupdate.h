#pragma once

#include <QObject>

#include "xmlparser.h"

class ComboboxUpdate : public QObject {
    Q_OBJECT
    Q_PROPERTY(QStringList comboList READ comboList CONSTANT)
public:
    explicit ComboboxUpdate(QObject *parent = nullptr);

    XmlParser xmlParser_{"countries.xml"};

    QStringList comboList();

signals:
};
