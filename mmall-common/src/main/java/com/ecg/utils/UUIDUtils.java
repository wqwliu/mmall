package com.ecg.utils;

import java.util.UUID;

public class UUIDUtils {
    public static String getuuid(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }
}
