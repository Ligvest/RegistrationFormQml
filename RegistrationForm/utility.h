#pragma once

#include <QString>
#include <iostream>

namespace utility {

void error(QString message) {
    //    QMessageBox::warning(0, "Problem!", message);
    //    throw std::runtime_error(message.toStdString());
    std::cout << message.toStdString() << std::endl;
}
}  // namespace utility
