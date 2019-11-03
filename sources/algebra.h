#ifndef ALGEBRA_H
#define ALGEBRA_H

#include <QObject>

class Algebra : public QObject
{
    Q_OBJECT
public:
    explicit Algebra(QObject *parent = nullptr);
    QString problem, sol1, sol2, s;
    bool fCorrect;
    quint32 level;
    quint32 Random(quint32, quint32);
    quint32 prob1, prob2;

    Q_INVOKABLE void shuffle();
    Q_INVOKABLE void setLevel(quint32);
    Q_INVOKABLE QString prob();
    Q_INVOKABLE QString sl1();
    Q_INVOKABLE QString sl2();
    Q_INVOKABLE bool fCor();
    Q_INVOKABLE quint32 pr1();
    Q_INVOKABLE quint32 pr2();
    Q_INVOKABLE quint32 probl1();
    Q_INVOKABLE quint32 probl2();
    Q_INVOKABLE QString sym();
    quint32 pow10[4];
signals:

public slots:
};

#endif // ALGEBRA_H
