package com.gigsphere.util;

public class FileValidator {

    private static final long MAX_SIZE =
            1024 * 1024;

    public static boolean isValidType(
            String type
    ) {

        return type.equalsIgnoreCase("pdf")
                || type.equalsIgnoreCase("jpg")
                || type.equalsIgnoreCase("png");
    }

    public static boolean isValidSize(
            long size
    ) {

        return size <= MAX_SIZE;
    }
}