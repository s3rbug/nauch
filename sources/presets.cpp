#include "presets.h"
#include "field.h"
#include <QDebug>
#include <fstream>

Presets::Presets(QObject *parent) : QObject(parent)
{
    QObject::connect(this, SIGNAL(added()), SLOT(debug()));
    fld = new Field;
}

bool Presets::nameAvailable(QString s){
    for(auto &i : arr)
        if(i.key == s)
            return false;
    return (s != "");
}


bool Presets::add(Field* f, QString s){
    if(!nameAvailable(s))
        return false;
    arr.push_back(std::move(Saves(f, s)));
    emit added();
    return true;
}

bool Presets::empty(){
    return arr.empty();
}

void Presets::debug(){
}

void Presets::idx(int ind){
    for(int i = 0; i < 30; ++i){
        for(int j = 0; j < 30; ++j){
            fld->a[i][j] = arr[ind].f->a[i][j];
        }
    }
}


/*Presets::~Presets(){
    delete fld;
}*/

