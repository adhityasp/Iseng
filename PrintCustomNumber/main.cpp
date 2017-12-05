/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: AH
 *
 * Created on August 27, 2016, 1:43 PM
 */

#include <iostream>
#include <string>
using namespace std;

/*
 * 
 */

int main() {
    int count_number = 0;
    string num[999];
    int col = 0;
    int max = 0;
    cin >> count_number;
    cin >> col;
    
    
    for(int i = 0 ; i < count_number ; i++){
        cin >> num[i];
        if(i>0){
            if(num[max].length() < num[i].length()){
                max = i;
            }
        }
    }
    
    for(int k = 0  ; k < count_number+col ;){
        if(k%2==0){
            for(int i = 0 ; i <= num[max].length()*col ; i++){
                if(i==0 || (i % num[max].length()==0)){
                    cout << "+";
                }
                if(i != num[max].length()*col)
                cout << "-";
            }
        }else{
            cout << "|";
            for(int i = 0 ; i < col ; i++){
                if(num[k]!= ""){
                    cout << num[k];
                    if(num[k].length() < num[max].length()){
                        for(int z = 0 ; z < num[max].length() - num[k].length() ; z++){
                            cout << " ";
                        }
                    }
                    cout << "|";
                }
            }
        }
        k++;
        cout << endl;
    }
    return 0;
}

