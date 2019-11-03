#ifndef SAVES_H
#define SAVES_H

#include <QObject>
#include "field.h"

class Saves
{
public:
    explicit Saves(Field*, QString);
    explicit Saves();
    QString key;
    Field* f;
signals:

public slots:
};

#endif // SAVES_H
