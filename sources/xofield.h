#ifndef XOFIELD_H
#define XOFIELD_H

#include <QObject>

class Xofield : public QObject
{
    Q_OBJECT
public:
    explicit Xofield(QObject *parent = nullptr);
    int a[9][9];
    Q_INVOKABLE void set(int, int, int);
    Q_INVOKABLE bool check();
    Q_INVOKABLE void clear();
signals:

public slots:
};

#endif // XOFIELD_H
