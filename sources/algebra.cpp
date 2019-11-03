#include "algebra.h"
#include <QDebug>
#include <QRandomGenerator>
Algebra::Algebra(QObject *parent) : QObject(parent)
{
    pow10[0] = 1;
    pow10[1] = 10;
    pow10[2] = 100;
    pow10[3] = 1000;
}

quint32 Algebra::Random(quint32 from, quint32 to){
    return QRandomGenerator::global()->bounded(from, to);
}

void Algebra::shuffle(){
    quint32 b1 = Random(1, pow10[level] + 1);
    prob1 = b1;
    if(Random(1, 3) % 2 == 0){ // Operation +
        s = "+";
        quint32 b2 = Random(1, pow10[level] + 1);
        prob2 = b2;
        problem = QString::number(b1) + " + " +  QString::number(b2) + " = ";
        sol1 = QString::number(b1 + b2);
        sol2 = QString::number(b1 + b2 + Random(1, 11));
        if(Random(1, 3) % 2 == 0){ // First correct
            fCorrect = true;
        }
        else{
            swap(sol1, sol2);
            fCorrect = false;
        }
    }
    else{ // Operation -
        s = "-";
        quint32 b2 = Random(1, b1 + 1);
        prob2 = b2;
        problem = QString::number(b1) + " - " +  QString::number(b2) + " = ";
        sol1 = QString::number(b1 - b2);
        sol2 = QString::number(b1 - b2 + Random(1, 11));
        if(Random(1, 3) % 2 == 0){ // First correct
            fCorrect = true;
        }
        else{
            swap(sol1, sol2);
            fCorrect = false;
        }
    }
}

void Algebra::setLevel(quint32 a){
    level = a;
}

quint32 Algebra::pr1(){
    return prob1;
}

quint32 Algebra::pr2(){
    return prob2;
}

QString Algebra::sl1(){
    return sol1;
}

QString Algebra::sl2(){
    return sol2;
}

QString Algebra::prob(){
    return problem;
}
quint32 Algebra::probl1(){
    return prob1;
}
quint32 Algebra::probl2(){
    return prob2;
}

QString Algebra::sym(){
    return s;
}

bool Algebra::fCor(){
    return fCorrect;
}



