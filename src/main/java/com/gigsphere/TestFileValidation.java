package com.gigsphere;

import com.gigsphere.util.FileValidator;

public class TestFileValidation {

    public static void main(String[] args) {

        System.out.println(
                FileValidator.isValidType("pdf")
        );

        System.out.println(
                FileValidator.isValidType("exe")
        );

        System.out.println(
                FileValidator.isValidSize(500000)
        );

        System.out.println(
                FileValidator.isValidSize(2000000)
        );
    }
}