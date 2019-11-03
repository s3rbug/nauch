#include "saves.h"
#include "field.h"

Saves::Saves(Field* field, QString s){
    f = new Field(field);
    //f->setParent(field->parent());
    key = s;
}

Saves::Saves(){
    f = new Field;
    //f->setParent(this);
    key = "";
}

/*Saves::~Saves(){
    delete f;
}*/
