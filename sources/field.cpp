#include "field.h"
#include <QDebug>
#include <fstream>

Field::Field(QObject *parent) : QObject(parent)
{
    for(int i = 0; i < 100; ++i){
        for(int j = 0; j < 100; ++j){
            a[i][j] = 0;
        }
    }
}

Field::Field(Field* f){
    for(int i = 0; i < 100; ++i){
        for(int j = 0; j < 100; ++j){
            a[i][j] = f->a[i][j];
        }
    }
}

int Field::get(int i, int j){
    return a[i][j];
}

void Field::set(int i, int j, int val){
    a[i][j] = val;
    //qDebug() << "a[" << i << "][" << j << "] = " << val;
}

void Field::clr(){
    for(int i = 0; i < 100; ++i){
        for(int j = 0; j < 100; ++j){
            a[i][j] = 0;
        }
    }
}

void Field::setField(Field *f){
    for(int i = 0; i < 100; ++i){
        for(int j = 0; j < 100; ++j){
            a[i][j] = f->a[i][j];
        }
    }
}

void Field::print(){
    std::ofstream out("output.txt");
    for(int i = 0; i < 30; ++i){
        for(int j = 0; j < 30; ++j){
            out << a[i][j];
        }
        out << std::endl;
    }
}
