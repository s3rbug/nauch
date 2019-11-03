#ifndef FIELD_H
#define FIELD_H

#include <QObject>

class Field : public QObject
{
    Q_OBJECT
public:
    explicit Field(QObject *parent = nullptr);
    explicit Field(Field*);
    int a[100][100];
    Q_INVOKABLE void set(int, int, int);
    Q_INVOKABLE int get(int, int);
    Q_INVOKABLE void clr();
    Q_INVOKABLE void setField(Field*);
    Q_INVOKABLE void print();
signals:

public slots:
};

#endif // FIELD_H
