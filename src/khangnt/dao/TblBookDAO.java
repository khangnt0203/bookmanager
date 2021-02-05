/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangnt.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import khangnt.dto.TblBookDTO;

/**
 *
 * @author khang
 */
public class TblBookDAO {
    public static int FindByID(String bookID, ArrayList<TblBookDTO> list){
        for (int i = 0; i <list.size() ; i++){
            if(list.get(i).getBookID().equals(bookID)){
                return i;
            }
        }
        return -1;
    }
    
    public static int FindByName(String bookName, ArrayList<TblBookDTO> list){
        for (int i = 0; i <list.size() ; i++){
            if(list.get(i).getBookName().equals(bookName)){
                return i;
            }
        }
        return -1;
    }
    
    public static void addBook(TblBookDTO dto, ArrayList<TblBookDTO> list){
        list.add(dto);
    }
    
    public static void updateBook(TblBookDTO dto, ArrayList<TblBookDTO> list){
        int i = FindByID(dto.getBookID(), list);
        list.set(i, dto);
    }
    
    
    public static void deleteBook(String ID, ArrayList<TblBookDTO> list){
        int i = FindByID(ID, list);
        list.remove(i);
    }
    
}
