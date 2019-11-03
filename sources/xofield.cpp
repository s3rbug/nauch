#include "xofield.h"

Xofield::Xofield(QObject *parent) : QObject(parent)
{
    for(int i = 0; i < 3; ++i)
        for(int j = 0; j < 3; ++j)
            a[i][j] = 0;
}

void Xofield::set(int i, int j, int val){
    a[i][j] = val;
}

bool Xofield::check(){
    for(int i = 0; i < 3; ++i)
        if(a[i][0] == a[i][1] && a[i][1] == a[i][2] && a[i][0] != 0)
            return true;
    for(int i = 0; i < 3; ++i)
        if(a[0][i] == a[1][i] && a[1][i] == a[2][i] && a[0][i] != 0)
            return true;
    if(a[0][0] == a[1][1] && a[1][1] == a[2][2] && a[0][0] != 0)
        return true;
    if(a[2][0] == a[1][1] && a[1][1] == a[0][2] && a[2][0] != 0)
        return true;
    return false;
}

void Xofield::clear(){
    for(int i = 0; i < 3; ++i)
        for(int j = 0; j < 3; ++j)
            a[i][j] = 0;
}
