


package com.paytm;

import java.security.MessageDigest;
import java.util.Map;
import java.util.TreeMap;

public class ChecksumService {

    public static String generateChecksum(Map<String, String> params, String key) throws Exception {

        StringBuilder data = new StringBuilder();

        for (String value : new TreeMap<>(params).values()) {
            data.append(value).append("|");
        }

        data.append(key);

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(data.toString().getBytes());

        StringBuilder hex = new StringBuilder();
        for (byte b : hash) {
            hex.append(String.format("%02x", b));
        }

        return hex.toString();
    }
}