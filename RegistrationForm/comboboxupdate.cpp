#include "comboboxupdate.h"

ComboboxUpdate::ComboboxUpdate(QObject *parent) : QObject(parent) {}

QStringList ComboboxUpdate::comboList() { return xmlParser_.getNames(); }
