#ifndef PRESETS_H
#define PRESETS_H

#include <QObject>
#include <QVector>
#include "saves.h"
#include "field.h"

class Presets : public QObject
{
    Q_OBJECT
public:
    Field* fld;
    explicit Presets(QObject *parent = nullptr);
    QVector<Saves> arr;
    Q_INVOKABLE bool add(Field*, QString);
    Q_INVOKABLE bool empty();
    Q_INVOKABLE bool nameAvailable(QString);
    Q_INVOKABLE void idx(int);
signals:
void added();
public slots:
void debug();
};

#endif // PRESETS_H
