package com.gigsphere;

import com.gigsphere.util.DBConnection;

public class Main {
    public static void main(String[] args) {
        try {
            DBConnection.getConnection();
            System.out.println(" Database Connected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}